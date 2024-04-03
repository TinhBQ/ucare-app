import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils.dart';
import 'package:mobile_advanced_project_fe/core/values/constant.dart';

class CreateProfileWidget extends StatefulWidget {
  const CreateProfileWidget({super.key});

  @override
  State<StatefulWidget> createState() => _CreateProfileWidgetState();
}

class _CreateProfileWidgetState extends State<CreateProfileWidget> {
  final _formField = GlobalKey<FormState>();

  final _lastNameController = TextEditingController(),
      _firstNameController = TextEditingController(),
      _phoneController = TextEditingController(),
      _emailController = TextEditingController(),
      _citizenIdController = TextEditingController(),
      _birthdayController = TextEditingController(),
      _maleController = TextEditingController(),
      _nationController = TextEditingController(),
      _ethnicityController = TextEditingController(),
      _jobController = TextEditingController(),
      _provinceController = TextEditingController(),
      _districtController = TextEditingController(),
      _wardsController = TextEditingController(),
      _addressController = TextEditingController();

  bool _isButtonDisabled = true;

  void _onSetDisableButton() {
    if (_lastNameController.text.isEmpty ||
        _firstNameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _citizenIdController.text.isEmpty ||
        _birthdayController.text.isEmpty ||
        _maleController.text.isEmpty ||
        _nationController.text.isEmpty ||
        _ethnicityController.text.isEmpty ||
        _jobController.text.isEmpty ||
        _provinceController.text.isEmpty ||
        _districtController.text.isEmpty ||
        _wardsController.text.isEmpty ||
        _addressController.text.isEmpty ||
        !isEmail(_emailController.text) ||
        !isPhone(_phoneController.text)) {
      setState(() {
        _isButtonDisabled = true;
      });
    } else {
      setState(() {
        _isButtonDisabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const CustomAppBar(
        title: 'Tạo hồ sơ khám bệnh',
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 20, 16, keyboardSpace + 20),
              child: Form(
                key: _formField,
                child: Column(
                  children: [
                    CustomTextfield(
                      label: 'Họ tên lót (theo CCCD/CMND/Passport)',
                      onChanged: (value) {
                        _onSetDisableButton();
                      },
                      labelStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.grey,
                              ),
                      controller: _lastNameController,
                    ),
                    CustomTextfield(
                      label: 'Tên (theo CCCD/CMND/Passport)',
                      onChanged: (value) {
                        _onSetDisableButton();
                      },
                      labelStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.grey,
                              ),
                      controller: _firstNameController,
                    ),
                    CustomTextfield(
                      label: 'Số điện thoại',
                      onChanged: (value) {
                        _onSetDisableButton();
                      },
                      labelStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.grey,
                              ),
                      controller: _phoneController,
                      validator: (input) => isPhone(input.toString())
                          ? null
                          : InforMassage.phoneNumberValid,
                    ),
                    CustomTextfield(
                      label: 'Email',
                      onChanged: (value) {
                        _onSetDisableButton();
                      },
                      labelStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.grey,
                              ),
                      controller: _emailController,
                      validator: (input) => isEmail(input.toString())
                          ? null
                          : InforMassage.emailValid,
                    ),
                    CustomTextfield(
                      label: 'CCCD/CMND/Passport',
                      onChanged: (value) {
                        _onSetDisableButton();
                      },
                      labelStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.grey,
                              ),
                      controller: _citizenIdController,
                    ),
                    CustomTextfieldDatetime(
                      label: 'Ngày sinh',
                      onChanged: (value) {
                        _onSetDisableButton();
                      },
                      labelStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.grey,
                              ),
                      controller: _birthdayController,
                    ),
                    CustomTextfieldDropdown(
                      label: 'Giới tính',
                      onChanged: (value) {
                        _onSetDisableButton();
                      },
                      controller: _maleController,
                      listOption: const ["Nam", "Nữ"],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: CustomTextfieldDropdown(
                              label: 'Giới tính',
                              onChanged: (value) {
                                _onSetDisableButton();
                              },
                              controller: _maleController,
                              listOption: const ["Nam", "Nữ"],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: CustomTextfieldDropdown(
                              label: 'Quốc gia',
                              onChanged: (value) {
                                _onSetDisableButton();
                              },
                              controller: _nationController,
                              listOption: const ["Nam", "Nữ"],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: CustomTextfieldDropdown(
                              label: 'Dân tộc',
                              onChanged: (value) {
                                _onSetDisableButton();
                              },
                              controller: _ethnicityController,
                              listOption: AppConstants.ETHNICITY,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: CustomTextfield(
                              label: 'Nghề nghiệp',
                              onChanged: (value) {
                                _onSetDisableButton();
                              },
                              controller: _jobController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomTextfield(
                      label: 'Tỉnh thành',
                      onChanged: (value) {
                        _onSetDisableButton();
                      },
                      controller: _provinceController,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: CustomTextfield(
                                label: 'Quận huyện',
                                onChanged: (value) {
                                  _onSetDisableButton();
                                },
                                controller: _districtController),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: CustomTextfield(
                              label: 'Phường xã',
                              onChanged: (value) {
                                _onSetDisableButton();
                              },
                              controller: _wardsController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomTextfield(
                      label: 'Địa chỉ thường trú',
                      onChanged: (value) {
                        _onSetDisableButton();
                      },
                      controller: _addressController,
                    ),
                    CustomButton(
                        title: "Xác nhận",
                        disabled: _isButtonDisabled,
                        onPressed: () {}),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
