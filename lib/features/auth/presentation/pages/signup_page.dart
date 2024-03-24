import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils.dart';

import '../bloc/auth_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formField = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _passwordVisible = true;
  bool _isButtonDisabled = true;

  bool onCheckedConfirmPassword(String text) {
    return text.trim().toString() == _passwordController.text.trim().toString();
  }

  void _onSetDisableButton() {
    if (_emailController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty ||
        !isEmail(_emailController.text) ||
        !isPhone(_phoneController.text) ||
        !isPassword(_passwordController.text) ||
        !onCheckedConfirmPassword(_confirmPasswordController.text)) {
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
    _phoneController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    setState(() {
      _isButtonDisabled = true;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size appBarSize = AppBar().preferredSize;
    final Size sizeScreen = MediaQuery.of(context).size;
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

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
          Navigator.of(context).pushReplacementNamed(AppRoutes.CONFIRM_SIGN_UP);
          LoadingOverlay.dismissLoading();
          ShowSnackBar.success(state.message, context);
        }
      },
      builder: (context, state) {
        final Widget formSignUp = Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //introduce
            const Padding(
              padding: EdgeInsets.only(bottom: 24.0),
              child: CustomTextIntroduce(
                  description: "Đăng ký tài khoản bằng Email"),
            ),
            Form(
              key: _formField,
              child: Column(
                children: [
                  CustomTextfield(
                    label: 'Email',
                    icon: Icons.email,
                    controller: _emailController,
                    onChanged: (value) {
                      _onSetDisableButton();
                    },
                    validator: (input) => isEmail(input.toString())
                        ? null
                        : InforMassage.emailValid,
                  ),
                  CustomTextfield(
                    label: 'Số điện thoại',
                    icon: Icons.phone_android,
                    controller: _phoneController,
                    onChanged: (value) {
                      _onSetDisableButton();
                    },
                    validator: (input) => isPhone(input.toString())
                        ? null
                        : InforMassage.phoneNumberValid,
                  ),
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
                    validator: (input) => isPassword(input.toString())
                        ? null
                        : InforMassage.passwordValid,
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
                    validator: (input) =>
                        onCheckedConfirmPassword(input.toString())
                            ? null
                            : InforMassage.confirmPasswordValid,
                  ),
                  CustomButton(
                      title: "ĐĂNG KÝ TÀI KHOẢN",
                      disabled: _isButtonDisabled || state is AuthLoading,
                      onPressed: () {
                        if (_formField.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                AuthSignUp(
                                  email:
                                      _emailController.text.trim().toString(),
                                  phone:
                                      _phoneController.text.trim().toString(),
                                  password: _passwordController.text
                                      .trim()
                                      .toString(),
                                  confirm_password: _confirmPasswordController
                                      .text
                                      .trim()
                                      .toString(),
                                ),
                              );
                        }
                      }),
                ],
              ),
            ),
          ],
        );

        final Widget navigateLogin = Align(
          child: CustomInkwell(
            description: 'Bạn đã có sẵn tài khoản?',
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(AppRoutes.SING_IN, (route) => false);
            },
            descriptionInkwell: 'Đăng nhập',
            textStyle: Theme.of(context).textTheme.bodyMedium!,
          ),
        );

        if (keyboardSpace == 0) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Theme.of(context).colorScheme.background,
            body: SafeArea(
              child: SizedBox(
                height: sizeScreen.height - appBarSize.height,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [formSignUp, navigateLogin],
                  ),
                ),
              ),
            ),
          );
        }

        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(
            child: SizedBox(
              height: sizeScreen.height - appBarSize.height,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 20, 16, 20 + keyboardSpace),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: formSignUp,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
