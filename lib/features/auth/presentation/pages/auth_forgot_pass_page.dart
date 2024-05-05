import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';


import '../bloc/auth_bloc.dart';

class AuthForgotPassPage extends StatefulWidget {
  const AuthForgotPassPage({super.key});
  @override
  State<AuthForgotPassPage> createState() => _AuthForgotPassPageState();
}

class _AuthForgotPassPageState extends State<AuthForgotPassPage> {
  final _formField = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isButtonDisabled = true;

  void _onSetDisableButton(String text) {
    if (text.isEmpty || !isEmail(text.toString())) {
      setState(() {
        _isButtonDisabled = true;
      });
    } else {
      setState(() {
        _isButtonDisabled = false;
      });
    }
  }

  void _clearFields() {
    _emailController.clear();
    setState(() {
      _isButtonDisabled = true;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          LoadingOverlay.showLoading(context);
        }

        if (state is AuthFailure) {
          _clearFields();
          LoadingOverlay.dismissLoading();
          ShowSnackBar.error(state.message, context);
        }

        if (state is AuthSuccess) {
          Navigator.of(context).pushReplacementNamed(
            AppRoutes.FORGOT_PASSWORD_SEND_OTP,
            arguments: {
              'email': _emailController.text.trim().toString(),
            },
          );
          LoadingOverlay.dismissLoading();
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
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 16, right: 20, left: 20),
              child: Column(
                children: [
                  Form(
                    key: _formField,
                    child: Column(
                      children: [
                        //Introduce
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child:
                              CustomTextIntroduce(description: "Quên mật khẩu"),
                        ),
                        //information
                        CustomTextfield(
                          label: 'Email',
                          icon: Icons.email,
                          controller: _emailController,
                          onChanged: (value) {
                            _onSetDisableButton(value);
                          },
                          validator: (input) {
                            if (input.toString().isEmpty) {
                              return null;
                            }
                            return isEmail(input.toString())
                                ? null
                                : InforMassage.emailValid;
                          },
                        ),
                        //button
                        CustomButton(
                            title: "XÁC NHẬN",
                            disabled: _isButtonDisabled || state is AuthLoading,
                            onPressed: () {
                              if (_formField.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                      AuthCreateOTP(
                                        email: _emailController.text
                                            .trim()
                                            .toString(),
                                      ),
                                    );
                              }
                            }),
                        // const SizedBox(height: 24)
                      ],
                    ),
                  ),
                  Expanded(
                    child: LottieBuilder.asset(
                        "assets/lottie/forgot-password-animation.json"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
