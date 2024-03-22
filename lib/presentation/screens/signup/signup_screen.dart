import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/logic/cubits/cubits.dart';
import 'package:mobile_advanced_project_fe/presentation/screens/screens.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/utils/exception_massage.dart';
import 'package:mobile_advanced_project_fe/utils/show_snackbar.dart';
import 'package:mobile_advanced_project_fe/utils/validate.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = '/signup';

  const SignupScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SignupScreen(),
    );
  }

  @override
  State<StatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formField = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _passwordVisible = true;
  bool _isButtonDisabled = true;

  late SignUpCubit _signupCubit;

  @override
  void initState() {
    super.initState();
    _signupCubit = BlocProvider.of(context);
  }

  bool onCheckedConfirmPassword(String text) {
    return text.trim().toString() == _passwordController.text.trim().toString();
  }

  void onSetDisableButton() {
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

  @override
  Widget build(BuildContext context) {
    final Size appBarSize = AppBar().preferredSize;
    final Size sizeScreen = MediaQuery.of(context).size;

    return BlocListener<SignUpCubit, SignupState>(
      listener: (context, state) {
        if (state.status == SignupStatus.success) {
          Navigator.pushReplacementNamed(
            context,
            ConfirmRegisterScreen.routeName,
          );
        }

        if (state.status == SignupStatus.error) {
          ShowSnackBar.error(ExceptionMassage.signupFailure, context);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
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
                            description: "Đăng ký tài khoản bằng Email"),
                      ),
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
                                  onSetDisableButton();
                                  _signupCubit.emailChanged(value);
                                },
                                validator: (input) => isEmail(input.toString())
                                    ? null
                                    : ExceptionMassage.emailValid,
                              ),
                              CustomTextfield(
                                label: 'Số điện thoại',
                                icon: Icons.phone_android,
                                controller: _phoneController,
                                onChanged: (value) {
                                  onSetDisableButton();
                                  _signupCubit.phoneNumberChanged(value);
                                },
                                validator: (input) => isPhone(input.toString())
                                    ? null
                                    : ExceptionMassage.phoneNumberValid,
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
                                  onSetDisableButton();
                                  _signupCubit.passwordChanged(value);
                                },
                                validator: (input) =>
                                    isPassword(input.toString())
                                        ? null
                                        : ExceptionMassage.passwordValid,
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
                                  onSetDisableButton();
                                  _signupCubit.confirmPasswordChanged(value);
                                },
                                validator: (input) =>
                                    onCheckedConfirmPassword(input.toString())
                                        ? null
                                        : ExceptionMassage.confirmPasswordValid,
                              ),
                              BlocBuilder<SignUpCubit, SignupState>(
                                buildWhen: (previous, current) =>
                                    previous.status != current.status,
                                builder: (context, state) {
                                  return state.status == SignupStatus.submitting
                                      ? const Padding(
                                          padding: EdgeInsets.only(top: 24),
                                          child: CircularProgressIndicator(),
                                        )
                                      : CustomButton(
                                          title: "ĐĂNG KÝ TÀI KHOẢN",
                                          disabled: _isButtonDisabled,
                                          onPressed: () {
                                            _signupCubit.signup();
                                          });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomInkwell(
                      description: 'Bạn đã có sẵn tài khoản?',
                      onTap: () {
                        Navigator.push(context, SignInScreen.route());
                      },
                      descriptionInkwell: 'Đăng nhập',
                      textStyle: Theme.of(context).textTheme.bodyMedium!,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
