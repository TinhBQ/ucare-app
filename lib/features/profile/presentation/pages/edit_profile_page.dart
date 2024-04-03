import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:pinput/pinput.dart';

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

  @override
  void initState() {
    _phoneController
        .setText(context.read<AppUserCubit>().state.userItem?.phone ?? '');
    _emailController
        .setText(context.read<AppUserCubit>().state.userItem?.email ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
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
                    content: DateTime.utc(1989, 11, 9),
                  ),
                  CustomTextfieldDropdown(
                    controller: _genderController,
                    label: 'Giới tính',
                    listOption: const ['Nữ', 'Nam'],
                    content: 'Nữ',
                  ),
                  CustomButton(
                    title: 'CẬP NHẬT',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
