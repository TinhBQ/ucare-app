import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/cubits/cubits.dart';
import 'package:mobile_advanced_project_fe/screens/screens.dart';
import 'package:mobile_advanced_project_fe/widgets/widgets.dart';

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
  final formField = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool checked = false;
  late SignInCubit _signinCubit;

  @override
  void initState() {
    super.initState();
    _signinCubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    return BlocListener<SignInCubit, SigninState>(
      listener: (context, state) {
        if (state.status == SigninStatus.success) {
          Navigator.pushAndRemoveUntil(
              context, SplashScreen.route(), (route) => false);
        }
        if (state.status == SigninStatus.error) {}
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
                            child: CustomTextIntroduce(
                                description: ""),
                          ),
                          //information signin
                          CustomTextfield(
                            label: 'Số điện thoại',
                            icon: Icons.phone_android,
                            controller: phoneController,
                            onChanged: (value) {
                              
                              _signinCubit.phoneNumberChanged(value);
                            },
                          ),
                          CustomTextfieldPassword(
                            label: 'Mật khẩu',
                            controller: passwordController,
                            onChanged: (value) {
                              _signinCubit.passwordChanged(value);
                            },
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
                          //button signin
                          BlocBuilder<SignInCubit, SigninState>(
                            buildWhen: (previous, current) =>
                                previous.status != current.status,
                            builder: (context, state) {
                              return state.status == SigninStatus.submitting
                                  ? const CircularProgressIndicator()
                                  : CustomButton(
                                      title: "ĐĂNG NHẬP",
                                      onPressed: () {
                                        _signinCubit.login();
                                      });
                            },
                          ),
                          //forgot pass
                          CustomInkwell(
                            description: '',
                            onTap: () {},
                            descriptionInkwell:
                                'Quên tài khoản hoặc quên mật khẩu?',
                            textStyle: Theme.of(context).textTheme.titleSmall!,
                          ),
                        ],
                      ),
                      //CTA sign up
                      CustomInkwell(
                        description: 'Bạn chưa có tài khoản?',
                        onTap: () {
                          Navigator.push(context, SignupScreen.route());
                        },
                        descriptionInkwell: 'Đăng ký',
                        textStyle: Theme.of(context).textTheme.bodyMedium!,
                      ),
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
