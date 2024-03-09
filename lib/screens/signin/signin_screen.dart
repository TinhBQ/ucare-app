import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/blocs/blocs.dart';
import 'package:mobile_advanced_project_fe/cubits/cubits.dart';
import 'package:mobile_advanced_project_fe/screens/screens.dart';
import 'package:mobile_advanced_project_fe/widgets/widgets.dart';

bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  return regExp.hasMatch(em);
}

bool isPassword(String password) {
  String p = r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$)';
  RegExp regExp = RegExp(p);

  return regExp.hasMatch(password);
}

class SignInScreen extends StatefulWidget {
  static const String routeName = '/signin';

  const SignInScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SignInScreen(),
    );
  }

  @override
  State<StatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formField = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _passwordVisible = true;

  bool checked = false;
  bool _isButtonDisabled = true;

  late SignInCubit _signinCubit;
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _signinCubit = BlocProvider.of(context);
    _authBloc = BlocProvider.of<AuthBloc>(context);
  }

  void onSetDisableButton(String text) {
    if ((_emailController.text.isEmpty || _passwordController.text.isEmpty) ||
        !_formField.currentState!.validate()) {
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

    return BlocListener<SignInCubit, SigninState>(
      listener: (context, state) {
        if (state.status == SigninStatus.success) {
          _authBloc.add(AuthEventStarted());
          Navigator.pushReplacement(context, MainScreen.route());
        }
        if (state.status == SigninStatus.error) {}
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - appBarSize.height,
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
                        child: CustomTextIntroduce(description: ""),
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
                                    onSetDisableButton(value);
                                    _signinCubit.emailChanged(value);
                                  },
                                  validator: (input) =>
                                      isEmail(input.toString())
                                          ? null
                                          : "Check your email",
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
                                    onSetDisableButton(value);
                                    _signinCubit.passwordChanged(value);
                                  },
                                  validator: (input) =>
                                      isPassword(input.toString())
                                          ? null
                                          : "Mật khẩu không hợp lệ",
                                ),
                                CustomCheckbox(
                                  description: 'Lưu thông tin đăng nhập',
                                  checked: checked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checked = value!;
                                    });
                                  },
                                  descriptionInkwell: '',
                                  onTap: () {},
                                ),
                                BlocBuilder<SignInCubit, SigninState>(
                                  buildWhen: (previous, current) =>
                                      previous.status != current.status,
                                  builder: (context, state) {
                                    return state.status ==
                                            SigninStatus.submitting
                                        ? const CircularProgressIndicator()
                                        : CustomButton(
                                            title: "ĐĂNG NHẬP",
                                            disabled: _isButtonDisabled,
                                            onPressed: () {
                                              _signinCubit.login();
                                            });
                                  },
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(height: 24),
                      CustomInkwell(
                        description: '',
                        onTap: () {
                          Navigator.push(context, ForgotPassScreen.route());
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
                          Navigator.push(context, SignupScreen.route());
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
      ),
    );
  }
}
