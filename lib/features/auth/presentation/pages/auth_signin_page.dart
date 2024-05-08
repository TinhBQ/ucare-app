import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/values/constant.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile_advanced_project_fe/global.dart';

class AuthSignInPage extends StatefulWidget {
  const AuthSignInPage({super.key});

  @override
  State<AuthSignInPage> createState() => _AuthSignInPageState();
}

class _AuthSignInPageState extends State<AuthSignInPage> {
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
          LoadingOverlay.showLoading(context);
        }

        if (state is AuthFailure) {
          if (state.onAuthEvent == OnAuthEvent.onAuthUserLoggedIn) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.APPLICATION, (route) => false);
            ShowSnackBar.success(InforMassage.LOGIN_SUCCESS, context);
          } else {
            _clearFields();
            ShowSnackBar.error(state.message, context);
          }
          LoadingOverlay.dismissLoading();
        }

        if (state is AuthSuccess) {
          if (state.onAuthEvent == OnAuthEvent.onAuthUserLoggedIn) {
            LoadingOverlay.dismissLoading();
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.APPLICATION, (route) => false);
            ShowSnackBar.success(InforMassage.LOGIN_SUCCESS, context);
          }

          if (state.onAuthEvent == OnAuthEvent.onAuthLogin) {
            Global.storageService
                .setBool(AppConstants.STORAGE_USER_REMEMBERS_LOGIN, _checked);
            context.read<AuthBloc>().add(
                  AuthUserLoggedIn(),
                );
          }
          LoadingOverlay.dismissLoading();
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
                              description: "Vui lòng đăng nhập để sử dụng"),
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
                                    validator: (input) {
                                      if (input.toString().isEmpty) {
                                        return null;
                                      }
                                      return isEmail(input.toString())
                                          ? null
                                          : InforMassage.emailValid;
                                    },
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
                                    validator: (input) {
                                      if (input.toString().isEmpty) {
                                        return null;
                                      }
                                      return isPassword(input.toString())
                                          ? null
                                          : InforMassage.passwordValid;
                                    },
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
