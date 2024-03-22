import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_advanced_project_fe/core/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/utils/exception_massage.dart';
import 'package:mobile_advanced_project_fe/utils/show_snackbar.dart';
import 'package:mobile_advanced_project_fe/utils/validate.dart';

import '../bloc/auth_bloc.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({super.key});

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
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
          EasyLoading.show(
            status: 'Loading...',
          );
        }

        if (state is AuthFailure) {
          _clearFields();
          EasyLoading.dismiss();
          ShowSnackBar.error(state.message, context);
        }

        if (state is AuthSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.FORGOT_PASSWORD_SEND_OTP,
            (route) => false,
            arguments: {
              'email': _emailController.text.trim().toString(),
            },
          );
          EasyLoading.dismiss();
          ShowSnackBar.success(state.massage, context);
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
                          validator: (input) => isEmail(input.toString())
                              ? null
                              : ExceptionMassage.emailValid,
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
