import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/routes/names.dart';
import 'package:mobile_advanced_project_fe/core/utils/show_snackbar.dart';
import 'package:mobile_advanced_project_fe/core/values/constant.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile_advanced_project_fe/global.dart';
import 'package:mobile_advanced_project_fe/presentation/screens/screens.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/utils/exception_massage.dart';
import 'package:mobile_advanced_project_fe/utils/validate.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formField = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _passwordVisible = true;
  bool _checked = false;
  bool _isButtonDisabled = true;

  void _onSetDisableButton(String text) {
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        !isEmail(_emailController.text) ||
        !isPassword(_passwordController.text)) {
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
    _passwordController.clear();
    setState(() {
      _isButtonDisabled = true;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size appBarSize = AppBar().preferredSize;
    final sizeScreen = MediaQuery.of(context).size;
    final hightSreen = sizeScreen.height;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          EasyLoading.show(
            status: 'Loading...',
          );
        }

        if (state is AuthFailure) {
          EasyLoading.dismiss();
          ShowSnackBar.error(state.message, context);
        }

        if (state is AuthSuccess) {
          Global.storageService
              .setBool(AppConstants.STORAGE_USER_REMEMBERS_LOGIN, _checked);
          EasyLoading.dismiss();
          ShowSnackBar.success(state.massage, context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(
            child: SizedBox(
              height: hightSreen - appBarSize.height,
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
                          padding: EdgeInsets.only(bottom: 24.0),
                          child: CustomTextIntroduce(
                              description: "Vui lòng đăng nhập để xử dụng"),
                        ),
                        //information signin
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Form(
                              key: _formField,
                              child: Column(
                                children: [
                                  CustomTextfield(
                                    label: 'Email',
                                    icon: Icons.email,
                                    controller: _emailController,
                                    onChanged: (value) {
                                      _onSetDisableButton(value);
                                    },
                                    validator: (input) =>
                                        isEmail(input.toString())
                                            ? null
                                            : ExceptionMassage.emailValid,
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
                                      _onSetDisableButton(value);
                                    },
                                    validator: (input) =>
                                        isPassword(input.toString())
                                            ? null
                                            : ExceptionMassage.passwordValid,
                                  ),
                                  CustomCheckbox(
                                    description: 'Lưu thông tin đăng nhập',
                                    checked: _checked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _checked = value!;
                                      });
                                    },
                                  ),
                                  CustomButton(
                                    title: "ĐĂNG NHẬP",
                                    disabled: _isButtonDisabled ||
                                        state is AuthLoading,
                                    onPressed: () {
                                      if (_formField.currentState!.validate()) {
                                        context.read<AuthBloc>().add(
                                              AuthLogin(
                                                email: _emailController.text
                                                    .trim(),
                                                password: _passwordController
                                                    .text
                                                    .trim(),
                                              ),
                                            );
                                        _clearFields();
                                      }
                                    },
                                  ),
                                ],
                              )),
                        ),
                        const SizedBox(height: 24),
                        CustomInkwell(
                          description: '',
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.FORGOT_PASSWORD);
                          },
                          descriptionInkwell:
                              'Quên tài khoản hoặc quên mật khẩu?',
                          textStyle: Theme.of(context).textTheme.titleSmall!,
                        ),
                      ],
                    ),
                    //CTA sign up
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomInkwell(
                          description: 'Bạn chưa có tài khoản?',
                          onTap: () {
                            Navigator.of(context).pushNamed(AppRoutes.SIGN_UP);
                          },
                          descriptionInkwell: 'Đăng ký',
                          textStyle: Theme.of(context).textTheme.bodyMedium!,
                        ),
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
