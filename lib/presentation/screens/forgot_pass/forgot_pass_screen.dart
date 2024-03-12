import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_advanced_project_fe/logic/cubits/cubits.dart';
import 'package:mobile_advanced_project_fe/presentation/screens/screens.dart';
import 'package:mobile_advanced_project_fe/presentation/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/utils/exception_massage.dart';
import 'package:mobile_advanced_project_fe/utils/show_snackbar.dart';
import 'package:mobile_advanced_project_fe/utils/validate.dart';

class ForgotPassScreen extends StatefulWidget {
  static const String routeName = '/forgot_pass';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const ForgotPassScreen());
  }

  const ForgotPassScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final _formField = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isButtonDisabled = true;

  late CreateOTPCubit _createOTPCubit;

  @override
  void initState() {
    super.initState();
    _createOTPCubit = BlocProvider.of(context);
  }

  void onSetDisableButton(String text) {
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

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateOTPCubit, CreateOTPState>(
        listener: (context, state) {
          if (state.status == CreateOTPStatus.success) {
            ShowSnackBar.success(ExceptionMassage.otpSentSuccessfully, context);
            Navigator.pushReplacement(context, ForgotPassSendOTPScreen.route());
          }
          if (state.status == CreateOTPStatus.error) {
            ShowSnackBar.error(ExceptionMassage.handlingFailure, context);
          }
        },
        child: Scaffold(
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
                            onSetDisableButton(value);
                            _createOTPCubit.emailChanged(value);
                          },
                          validator: (input) => isEmail(input.toString())
                              ? null
                              : ExceptionMassage.emailValid,
                        ),
                        //button
                        BlocBuilder<CreateOTPCubit, CreateOTPState>(
                          buildWhen: (previous, current) =>
                              previous.status != current.status,
                          builder: (context, state) {
                            return state.status == CreateOTPStatus.submitting
                                ? const Padding(
                                    padding: EdgeInsets.only(top: 24),
                                    child: CircularProgressIndicator(),
                                  )
                                : CustomButton(
                                    title: "XÁC NHẬN",
                                    disabled: _isButtonDisabled,
                                    onPressed: () {
                                      _createOTPCubit.getCreateOTP();
                                    });
                          },
                        ),
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
        ));
  }
}
