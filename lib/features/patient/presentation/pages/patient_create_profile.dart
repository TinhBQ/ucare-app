import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_countries/countries_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/values/constant.dart';
import 'package:mobile_advanced_project_fe/features/country/presentation/bloc/country/country_bloc.dart';

import '../bloc/patient_bloc.dart';

class PatientCreateProfilePage extends StatefulWidget {
  const PatientCreateProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _PatientCreateProfilePageState();
}

class _PatientCreateProfilePageState extends State<PatientCreateProfilePage> {
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

  final String _nationDefault = 'Vietnam';

  bool _isButtonDisabled = true;

  bool _isVietnamese = true;

  void _onSetDisableButton(String value) {
    if (_lastNameController.text.isEmpty ||
        _firstNameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _citizenIdController.text.isEmpty ||
        _birthdayController.text.isEmpty ||
        _maleController.text.isEmpty ||
        _nationController.text.isEmpty ||
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
      if (_isVietnamese && _ethnicityController.text.isEmpty) {
        setState(() {
          _isButtonDisabled = true;
        });
      } else {
        setState(() {
          _isButtonDisabled = false;
        });
      }
    }
  }

  void _checkNation(String value) {
    if (value != 'Vietnam') {
      setState(() {
        _isVietnamese = false;
        _ethnicityController.clear();
      });
    } else {
      setState(() {
        _isVietnamese = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    CountryGetItem? countryGetItem =
        context.select((CountriesCubit cubit) => cubit.state.countriesItems);
    return BlocConsumer<PatientBloc, PatientState>(
      listener: (context, state) {
        if (state is PatientLoading) {
          LoadingOverlay.showLoading(context);
        }
        if (state is PatientFailure) {
          LoadingOverlay.dismissLoading();
          ShowSnackBar.error(state.message, context);
          Navigator.of(context).pop();
        }

        if (state is PatientSuccess) {
          if (state.onPatientEvent == OnPatientEvent.onPatientCreateProfile) {
            context.read<PatientBloc>().add(const PatientGetList());
            ShowSnackBar.success(state.message, context);
          }

          if (state.onPatientEvent == OnPatientEvent.onPatientGetList) {
            Navigator.of(context).pop();
          }
          LoadingOverlay.dismissLoading();
        }
      },
      builder: (context, state) {
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
                            _onSetDisableButton(value);
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
                            _onSetDisableButton(value);
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
                            _onSetDisableButton(value);
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
                            _onSetDisableButton(value);
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
                            _onSetDisableButton(value);
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
                            _onSetDisableButton(value);
                          },
                          labelStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey,
                                  ),
                          controller: _birthdayController,
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
                                    _onSetDisableButton(value);
                                  },
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.grey,
                                      ),
                                  controller: _maleController,
                                  listOption: const ["Nam", "Nữ"],
                                ),
                              ),
                            ),
                            Expanded(
                              child: BlocListener<CountryBloc, CountryState>(
                                listener: (context, state) {
                                  if (state is CountryLoading) {
                                    LoadingOverlay.showLoading(context);
                                  } else {
                                    LoadingOverlay.dismissLoading();
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: CustomTextfieldDropdown(
                                    label: 'Quốc gia',
                                    onChanged: (value) {
                                      _checkNation(value);
                                      _onSetDisableButton(value);
                                    },
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Colors.grey,
                                        ),
                                    controller: _nationController,
                                    listOption: countryGetItem == null
                                        ? []
                                        : countryGetItem.countries
                                            .map(
                                              (country) => country.name,
                                            )
                                            .toList(),
                                    content: _nationDefault,
                                  ),
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
                                    _onSetDisableButton(value);
                                  },
                                  disabled: !_isVietnamese,
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.grey,
                                      ),
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
                                    _onSetDisableButton(value);
                                  },
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.grey,
                                      ),
                                  controller: _jobController,
                                ),
                              ),
                            ),
                          ],
                        ),
                        CustomTextfield(
                          label: 'Tỉnh thành',
                          onChanged: (value) {
                            _onSetDisableButton(value);
                          },
                          labelStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey,
                                  ),
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
                                      _onSetDisableButton(value);
                                    },
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Colors.grey,
                                        ),
                                    controller: _districtController),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: CustomTextfield(
                                  label: 'Phường xã',
                                  onChanged: (value) {
                                    _onSetDisableButton(value);
                                  },
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.grey,
                                      ),
                                  controller: _wardsController,
                                ),
                              ),
                            ),
                          ],
                        ),
                        CustomTextfield(
                          label: 'Địa chỉ thường trú',
                          onChanged: (value) {
                            _onSetDisableButton(value);
                          },
                          labelStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey,
                                  ),
                          controller: _addressController,
                        ),
                        CustomButton(
                            title: "Xác nhận",
                            disabled: _isButtonDisabled,
                            onPressed: () {
                              if (_formField.currentState!.validate()) {
                                context.read<PatientBloc>().add(
                                      PatientCreateProfile(
                                        first_name: _firstNameController.text
                                            .trim()
                                            .toString(),
                                        last_name: _lastNameController.text
                                            .trim()
                                            .toString(),
                                        phone: _phoneController.text
                                            .trim()
                                            .toString(),
                                        email: _emailController.text
                                            .trim()
                                            .toString(),
                                        citizen_id: _citizenIdController.text
                                            .trim()
                                            .toString(),
                                        birthday: _birthdayController.text
                                            .trim()
                                            .toString(),
                                        male: _maleController.text
                                                    .trim()
                                                    .toString() ==
                                                "Nam"
                                            ? true
                                            : false,
                                        nation: _nationController.text
                                            .trim()
                                            .toString(),
                                        job: _jobController.text
                                            .trim()
                                            .toString(),
                                        address: _addressController.text
                                            .trim()
                                            .toString(),
                                        district: _districtController.text
                                            .trim()
                                            .toString(),
                                        ethnicity: _ethnicityController.text
                                            .trim()
                                            .toString(),
                                        province: _provinceController.text
                                            .trim()
                                            .toString(),
                                        wards: _wardsController.text
                                            .trim()
                                            .toString(),
                                      ),
                                    );
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
