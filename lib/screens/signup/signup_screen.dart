import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/cubits/cubits.dart';
import 'package:mobile_advanced_project_fe/screens/screens.dart';
import 'package:mobile_advanced_project_fe/screens/signup/confirm_register.dart';
import 'package:mobile_advanced_project_fe/widgets/widgets.dart';

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
  final formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool checked = false;
  late SignUpCubit _signupCubit;

  @override
  void initState() {
    super.initState();
    _signupCubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    return BlocListener<SignUpCubit, SignupState>(
      listener: (context, state) {
        if (state.status == SignupStatus.success) {
          Navigator.pushAndRemoveUntil(
              context, ConfirmRegisterScreen.route(), (route) => false);
        }
        if (state.status == SignupStatus.error) {}
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              height: currentHeight,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 16, right: 20, bottom: 16, left: 20),
                child: Form(
                  key: formField,
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
                          CustomTextfield(
                            label: 'Email',
                            icon: Icons.email,
                            controller: emailController,
                            onChanged: (value) {
                              _signupCubit.emailChanged(value);
                            },
                          ),
                          CustomTextfield(
                            label: 'Số điện thoại',
                            icon: Icons.phone_android,
                            controller: phoneController,
                            onChanged: (value) {
                              _signupCubit.phoneNumberChanged(value);
                            },
                          ),
                          CustomTextfieldPassword(
                            label: 'Mật khẩu',
                            controller: passwordController,
                            onChanged: (value) {
                              _signupCubit.passwordChanged(value);
                            },
                          ),
                          CustomTextfieldPassword(
                            label: 'Xác nhận mật khẩu',
                            controller: confirmPasswordController,
                            onChanged: (value) {
                              _signupCubit.confirmPasswordChanged(value);
                            },
                          ),
                          // button signin
                          BlocBuilder<SignUpCubit, SignupState>(
                            buildWhen: (previous, current) =>
                                previous.status != current.status,
                            builder: (context, state) {
                              return state.status == SignupStatus.submitting
                                  ? const CircularProgressIndicator()
                                  : CustomButton(
                                      title: "ĐĂNG KÝ TÀI KHOẢN",
                                      onPressed: () {
                                        _signupCubit.signup();
                                      });
                            },
                          ),
                          //forgot pass
                        ],
                      ),
                      //CTA sign up
                      CustomInkwell(
                        description: 'Bạn đã có sẵn tài khoản?',
                        onTap: () {
                          Navigator.push(context, SignInScreen.route());
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
        ),
      ),
    );
  }
}
