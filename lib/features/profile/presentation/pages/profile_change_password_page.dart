import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

import 'package:mobile_advanced_project_fe/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile_advanced_project_fe/features/profile/presentation/bloc/profile_bloc.dart';

class ProfileChangePasswordPage extends StatefulWidget {
  const ProfileChangePasswordPage({super.key});

  @override
  State<ProfileChangePasswordPage> createState() =>
      _ProfileChangePasswordPageState();
}

class _ProfileChangePasswordPageState extends State<ProfileChangePasswordPage> {
  final _formField = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewpasswordController = TextEditingController();

  bool _passwordVisible = true;
  bool _isButtonDisabled = true;

  bool _onCheckedConfirmPassword(String text) {
    return text.trim().toString() ==
        _newPasswordController.text.trim().toString();
  }

  void _onSetDisableButton() {
    if (_oldPasswordController.text.isEmpty ||
        _newPasswordController.text.isEmpty ||
        _confirmNewpasswordController.text.isEmpty ||
        !isPassword(_oldPasswordController.text) ||
        !isPassword(_newPasswordController.text) ||
        !_onCheckedConfirmPassword(_confirmNewpasswordController.text)) {
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
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewpasswordController.dispose();
    super.dispose();
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
          ShowSnackBar.error(state.message, context);
        }

        if (state is ProfileSuccess) {
          ShowSnackBar.success(state.message, context);
          LoadingOverlay.dismissLoading();
          if (state.onProfileEvent == OnProfileEvent.onProfileChangePassword) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRoutes.SING_IN, (route) => false);
            LoadingOverlay.dismissLoading();
          }
        }
      },
      builder: (context, state) {
        return MultiBlocListener(
          listeners: [
            BlocListener<ProfileBloc, ProfileState>(
              listener: (context, state) {
                if (state is ProfileLoading) {
                  LoadingOverlay.showLoading(context);
                }

                if (state is ProfileFailure) {
                  LoadingOverlay.dismissLoading();
                  ShowSnackBar.error(state.message, context);
                }

                if (state is ProfileSuccess) {
                  LoadingOverlay.dismissLoading();
                  if (state.onProfileEvent ==
                      OnProfileEvent.onProfileChangePassword) {
                    context.read<AuthBloc>().add(AuthLogout());
                  } else {
                    ShowSnackBar.success(state.message, context);
                  }
                }
              },
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthLoading) {
                  LoadingOverlay.showLoading(context);
                }

                if (state is AuthFailure) {
                  LoadingOverlay.dismissLoading();
                  if (state.onAuthEvent == OnAuthEvent.onAuthLogout) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.SING_IN, (route) => false);
                    ShowSnackBar.success(
                        InforMassage.CHANGE_PASSWORD_SUCCESS, context);
                  } else {
                    ShowSnackBar.error(state.message, context);
                  }
                }

                if (state is AuthSuccess) {
                  LoadingOverlay.dismissLoading();
                  if (state.onAuthEvent == OnAuthEvent.onAuthLogout) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.SING_IN, (route) => false);
                    ShowSnackBar.success(
                        InforMassage.CHANGE_PASSWORD_SUCCESS, context);
                  } else {
                    ShowSnackBar.success(state.message, context);
                  }
                }
              },
            )
          ],
          child: Scaffold(
            appBar: const CustomAppBar(
              title: 'Đổi mật khẩu',
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    padding:
                        EdgeInsets.fromLTRB(16, 20, 16, keyboardSpace + 20),
                    child: Form(
                      key: _formField,
                      child: Column(
                        children: [
                          CustomTextfield(
                            label: 'Mật khẩu cũ',
                            icon: Icons.lock,
                            controller: _oldPasswordController,
                            isObscureText: _passwordVisible,
                            suffixIcon: _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            onSuffixIcon: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                            onChanged: (value) {
                              _onSetDisableButton();
                            },
                            validator: (input) => isPassword(input.toString())
                                ? null
                                : InforMassage.passwordValid,
                          ),
                          CustomTextfield(
                            label: 'Mật khẩu mới',
                            icon: Icons.lock,
                            controller: _newPasswordController,
                            isObscureText: _passwordVisible,
                            suffixIcon: _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            onSuffixIcon: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                            onChanged: (value) {
                              _onSetDisableButton();
                            },
                            validator: (input) => isPassword(input.toString())
                                ? null
                                : InforMassage.passwordValid,
                          ),
                          CustomTextfield(
                            label: 'Xác nhận mật khẩu',
                            icon: Icons.lock,
                            controller: _confirmNewpasswordController,
                            isObscureText: _passwordVisible,
                            suffixIcon: _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            onSuffixIcon: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                            onChanged: (value) {
                              _onSetDisableButton();
                            },
                            validator: (input) =>
                                _onCheckedConfirmPassword(input.toString())
                                    ? null
                                    : InforMassage.confirmPasswordValid,
                          ),
                          CustomButton(
                              title: "Xác nhận",
                              disabled:
                                  _isButtonDisabled || state is ProfileLoading,
                              onPressed: () {
                                context.read<ProfileBloc>().add(
                                      ProfileChangePassword(
                                        oldPass: _oldPasswordController.text
                                            .trim()
                                            .toString(),
                                        newPass: _newPasswordController.text
                                            .trim()
                                            .toString(),
                                        confirmPass:
                                            _confirmNewpasswordController.text
                                                .trim()
                                                .toString(),
                                      ),
                                    );
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
