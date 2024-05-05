import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

import '../bloc/auth_bloc.dart';

class AuthConfirmRegisterPage extends StatefulWidget {
  const AuthConfirmRegisterPage({super.key});

  @override
  State<AuthConfirmRegisterPage> createState() =>
      _AuthConfirmRegisterPageState();
}

class _AuthConfirmRegisterPageState extends State<AuthConfirmRegisterPage> {
  final _formField = GlobalKey<FormState>();
  final _codeController = TextEditingController();

  bool _isButtonDisabled = true;

  void _onSetDisableButton() {
    if (_codeController.text.isEmpty || _codeController.text.length != 6) {
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
    _codeController.clear();
    setState(() {
      _isButtonDisabled = true;
    });
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size appBarSize = AppBar().preferredSize;
    final Size sizeScreen = MediaQuery.of(context).size;

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
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.SING_IN,
            (route) => false,
          );
          LoadingOverlay.dismissLoading();
          ShowSnackBar.success(state.message, context);
        }
      },
      builder: (context, state) {
        LoadingOverlay.dismissLoading();
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: const Text("Quay lại"),
          ),
          body: SafeArea(
            child: Center(
              child: SizedBox(
                height: sizeScreen.height - appBarSize.height,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16, right: 20, bottom: 16, left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          //introduce
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: CustomTextIntroduce(
                                description: "Xác thực đăng ký tài khoản"),
                          ),

                          Form(
                            key: _formField,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 32, left: 32),
                                  child: Text(
                                    "Nhập mã OTP được gửi qua email đăng ký của bạn.",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                  ),
                                ),
                                CustomOTP(
                                  label: 'OTP',
                                  controller: _codeController,
                                  onChanged: (value) {
                                    _onSetDisableButton();
                                  },
                                ),

                                // button signins
                                CustomButton(
                                    title: "XÁC NHẬN",
                                    disabled: _isButtonDisabled ||
                                        state is AuthLoading,
                                    onPressed: () {
                                      if (_formField.currentState!.validate()) {
                                        context
                                            .read<AuthBloc>()
                                            .add(AuthConfirmSignUp(
                                              token: _codeController.text
                                                  .trim()
                                                  .toString(),
                                            ));
                                      }
                                    }),
                              ],
                            ),
                          ),
                          LottieBuilder.asset(
                              "assets/lottie/otp-animation.json")
                        ],
                      ),
                      //CTA sign up
                      CustomInkwell(
                        description: 'Bạn đã có sẵn tài khoản?',
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRoutes.SING_IN);
                        },
                        descriptionInkwell: 'Đăng nhập',
                        textStyle: Theme.of(context).textTheme.bodyMedium!,
                      )
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
