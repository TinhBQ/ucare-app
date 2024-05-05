// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

import '../bloc/auth_bloc.dart';

class AuthForgotPassSendOTPPage extends StatefulWidget {
  const AuthForgotPassSendOTPPage({super.key});

  @override
  State<AuthForgotPassSendOTPPage> createState() =>
      _AuthForgotPassSendOTPPageState();
}

class _AuthForgotPassSendOTPPageState extends State<AuthForgotPassSendOTPPage> {
  final _formField = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _passwordVisible = true;
  bool _isButtonDisabled = true;

  bool _onCheckedConfirmPassword(String text) {
    return text.trim().toString() == _passwordController.text.trim().toString();
  }

  void _onSetDisableButton() {
    if (_otpController.text.isEmpty ||
        _otpController.text.length != 6 ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty ||
        !isPassword(_passwordController.text) ||
        !_onCheckedConfirmPassword(_confirmPasswordController.text)) {
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
    final Map arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          LoadingOverlay.showLoading(context);
        }

        if (state is AuthFailure) {
          LoadingOverlay.dismissLoading();
          ShowSnackBar.error(state.message, context);
        }

        if (state is AuthSuccess) {
          LoadingOverlay.dismissLoading();
          if (state.onAuthEvent == OnAuthEvent.onAuthForgotPassword) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRoutes.SING_IN, (route) => false);
          }
          ShowSnackBar.success(state.message, context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: const Text("Quay lại"),
          ),
          body: SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 20, 16, keyboardSpace + 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                      key: _formField,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          //introduce
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: CustomTextIntroduce(
                                description: "Quên mật khẩu"),
                          ),
                          //discription
                          Text(
                            'Nhập mã OTP được gửi qua email của bạn.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                          ),
                          //nhập OTP
                          CustomOTP(
                            label: 'OTP',
                            controller: _otpController,
                            onChanged: (value) {
                              // onSetDisableButton();
                            },
                          ),
                          //button confirm OTP
                          //input new pass
                          CustomTextfield(
                            label: 'Mật khẩu',
                            icon: Icons.lock,
                            controller: _passwordController,
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
                            validator: (input) {
                              if (input.toString().isEmpty) {
                                return null;
                              }
                              return isPassword(input.toString())
                                  ? null
                                  : InforMassage.passwordValid;
                            },
                          ),
                          CustomTextfield(
                              label: 'Xác nhận mật khẩu',
                              icon: Icons.lock,
                              controller: _confirmPasswordController,
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
                              validator: (input) {
                                if (input.toString().isEmpty) {
                                  return null;
                                }
                                return _onCheckedConfirmPassword(
                                        input.toString())
                                    ? null
                                    : InforMassage.confirmPasswordValid;
                              }),
                          //button confirm new password
                          //button confirm OTP
                          CustomButton(
                              title: "Xác nhận",
                              disabled: _isButtonDisabled,
                              onPressed: () {
                                context.read<AuthBloc>().add(
                                      AuthForgotPassword(
                                        code: _otpController.text
                                            .trim()
                                            .toString(),
                                        new_pass: _passwordController.text
                                            .trim()
                                            .toString(),
                                        confirm_pass: _confirmPasswordController
                                            .text
                                            .trim()
                                            .toString(),
                                      ),
                                    );
                              }),
                          Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 4),
                            child: Text(
                              "Không nhận được mã?",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              context.read<AuthBloc>().add(
                                    AuthCreateOTP(
                                      email: arguments['email'],
                                    ),
                                  );
                            },
                            child: Text(
                              "Gửi lại",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
