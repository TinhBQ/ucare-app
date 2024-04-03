import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils.dart';
import 'package:pinput/pinput.dart';

import '../bloc/profile_bloc.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formField = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _genderController = TextEditingController();

  String _initTextName = '';
  String _initTextDateOfBirth = '';
  String _initTextGender = '';

  bool isDisable = true;

  void _updateTextFilds() {
    _initTextName =
        context.read<AppUserCubit>().state.userItem?.user_name ?? '';
    _nameController.setText(stringTernaryOperatir(_initTextName, ''));

    _initTextDateOfBirth =
        context.read<AppUserCubit>().state.userItem?.birthday ?? '';
    _dateOfBirthController
        .setText(stringTernaryOperatir(_initTextDateOfBirth, ''));

    if (context.read<AppUserCubit>().state.userItem?.male == null) {
      _initTextGender = '';
    } else {
      _initTextGender =
          context.read<AppUserCubit>().state.userItem!.male! ? 'Nam' : 'Nữ';
    }

    _genderController.setText(_initTextGender);
  }

  void _onSetDisableButton() {
    if (_initTextName == _nameController.text &&
        _initTextDateOfBirth == _dateOfBirthController.text &&
        _initTextGender == _genderController.text) {
      setState(() {
        isDisable = true;
      });
    } else {
      setState(() {
        isDisable = false;
      });
    }
  }

  @override
  void initState() {
    _phoneController
        .setText(context.read<AppUserCubit>().state.userItem?.phone ?? '');
    _emailController
        .setText(context.read<AppUserCubit>().state.userItem?.email ?? '');

    _updateTextFilds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoading) {
          LoadingOverlay.showLoading(context);
        }

        if (state is ProfileFailure) {
          LoadingOverlay.dismissLoading();
          if (state.onProfileEvent == OnProfileEvent.onProfileChangeProflie) {
            ShowSnackBar.error(state.message, context);
          }
        }

        if (state is ProfileSuccess) {
          LoadingOverlay.dismissLoading();
          if (state.onProfileEvent == OnProfileEvent.onProfileChangeProflie) {
            _updateTextFilds();
            Navigator.of(context).pop();
          }
          ShowSnackBar.success(state.message, context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: 'Chỉnh sửa thông tin',
          ),
          body: SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 20, 16, keyboardSpace + 20),
                child: Form(
                  key: _formField,
                  child: Column(
                    children: [
                      CustomTextfield(
                        label: 'Họ và tên',
                        icon: Icons.supervised_user_circle,
                        controller: _nameController,
                        onChanged: (value) {
                          _onSetDisableButton();
                          // _onSetDisableButton(value);
                        },
                      ),
                      CustomTextfield(
                        label: 'Số điện thoại',
                        icon: Icons.supervised_user_circle,
                        controller: _phoneController,
                        disabled: true,
                      ),
                      CustomTextfield(
                        label: 'Email',
                        icon: Icons.supervised_user_circle,
                        controller: _emailController,
                        disabled: true,
                      ),
                      CustomTextfieldDatetime(
                        label: 'Ngày sinh',
                        controller: _dateOfBirthController,
                        onChange: () {
                          _onSetDisableButton();
                        },
                      ),
                      CustomTextfieldDropdown(
                        controller: _genderController,
                        label: 'Giới tính',
                        listOption: const ['Nữ', 'Nam'],
                        onChanged: () {
                          _onSetDisableButton();
                        },
                      ),
                      CustomButton(
                          disabled: isDisable || state is ProfileLoading,
                          title: 'CẬP NHẬT',
                          onPressed: () {
                            context.read<ProfileBloc>().add(
                                  ProfileChangeProflie(
                                    userItem: context
                                        .read<AppUserCubit>()
                                        .state
                                        .userItem!
                                        .copyWith(
                                          user_name: _nameController.text
                                              .trim()
                                              .toString(),
                                          birthday: _dateOfBirthController.text
                                              .trim()
                                              .toString(),
                                          male: _genderController.text
                                                  .trim()
                                                  .toString() ==
                                              'Nam',
                                        ),
                                  ),
                                );
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
