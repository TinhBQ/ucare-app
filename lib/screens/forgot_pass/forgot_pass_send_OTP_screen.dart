import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/cubits/cubits.dart';
import 'package:mobile_advanced_project_fe/screens/screens.dart';
import 'package:mobile_advanced_project_fe/screens/signin/signin_screen.dart';
import 'package:mobile_advanced_project_fe/widgets/widgets.dart';

class ForgotPassSendOTPScreen extends StatefulWidget {
  static const String routeName = '/forgot_pass_send_OTP';

  const ForgotPassSendOTPScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ForgotPassSendOTPScreen(),
    );
  }

  @override
  State<StatefulWidget> createState() => _ForgotPassSendOTPScreenState();
}

class _ForgotPassSendOTPScreenState extends State<ForgotPassSendOTPScreen> {
  final formField = GlobalKey<FormState>();
  final otpController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool checked = false;
  late CreateOTPCubit _createOTPCubit;

  late ForgotPassCubit _forgotPassCubit;
  @override
  void initState() {
    super.initState();
    _forgotPassCubit = BlocProvider.of(context);
    _createOTPCubit = BlocProvider.of(context);

  }

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    return BlocListener<ForgotPassCubit, ForgotPassState>(
      listener: (context, state) {
        if (state.status == ForgotPassStatus.success) {
          Navigator.pushAndRemoveUntil(
              context, SignInScreen.route(), (route) => false);
        }
        if (state.status == ForgotPassStatus.error) {}
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
                          //discription
                          Text(
                            'Nhập mã OTP được gửi qua email của bạn',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          //nhập OTP
                          CustomOTP(
                              label: "",
                              controller: otpController,
                              onChanged: (value) {
                                _forgotPassCubit.codeChanged(value);
                              }),
                          //button confirm OTP
                          //input new pass
                          CustomTextfieldPassword(
                            label: "Mật khẩu",
                            controller: passwordController,
                            onChanged: (value) {
                              _forgotPassCubit.newPassChanged(value);
                            },
                          ),
                          CustomTextfieldPassword(
                            label: "Nhập lại mật khẩu",
                            controller: confirmPasswordController,
                            onChanged: (value) {
                              _forgotPassCubit.confirmPassChanged(value);
                            },
                          ),
                          //button confirm new password
                          //button confirm OTP
                          BlocBuilder<ForgotPassCubit, ForgotPassState>(
                            buildWhen: (previous, current) =>
                                previous.status != current.status,
                            builder: (context, state) {
                              return state.status == ForgotPassStatus.submitting
                                  ? const CircularProgressIndicator()
                                  : CustomButton(
                                      title: "Xác nhận",
                                      onPressed: () {
                                        _forgotPassCubit.getForgotPass();
                                      });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              "Không nhận được mã?",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _createOTPCubit.getCreateOTP();
                            },
                            child: Text(
                              "Gửi lại",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ),
                        ],
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
