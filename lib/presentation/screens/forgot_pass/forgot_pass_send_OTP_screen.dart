// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/logic/cubits/cubits.dart';
import 'package:mobile_advanced_project_fe/presentation/screens/screens.dart';
import 'package:mobile_advanced_project_fe/presentation/screens/signin/signin_screen.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/utils/exception_massage.dart';
import 'package:mobile_advanced_project_fe/utils/show_snackbar.dart';
import 'package:mobile_advanced_project_fe/utils/validate.dart';

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
  final _formField = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _passwordVisible = true;
  bool _isButtonDisabled = true;

  late CreateOTPCubit _createOTPCubit;
  late ForgotPassCubit _forgotPassCubit;

  @override
  void initState() {
    super.initState();
    _forgotPassCubit = BlocProvider.of(context);
    _createOTPCubit = BlocProvider.of(context);
  }

  bool onCheckedConfirmPassword(String text) {
    return text.trim().toString() == _passwordController.text.trim().toString();
  }

  void onSetDisableButton() {
    if (_otpController.text.isEmpty ||
        _otpController.text.length != 6 ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty ||
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
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return MultiBlocListener(
      listeners: [
        BlocListener<ForgotPassCubit, ForgotPassState>(
            listener: (context, state) {
          if (state.status == ForgotPassStatus.success) {
            ShowSnackBar.success(
                ExceptionMassage.changedPasswordSuccessfully, context);
            Navigator.pushAndRemoveUntil(
                context, SignInScreen.route(), (route) => false);
          }
          if (state.status == ForgotPassStatus.error) {
            ShowSnackBar.error(ExceptionMassage.handlingFailure, context);
          }
        }),
        BlocListener<CreateOTPCubit, CreateOTPState>(
          listener: (BuildContext context, CreateOTPState state) {
            if (state.status == CreateOTPStatus.success) {
              ShowSnackBar.success(
                  ExceptionMassage.otpSentSuccessfully, context);
            }
            if (state.status == CreateOTPStatus.error) {
              ShowSnackBar.error(ExceptionMassage.handlingFailure, context);
            }
          },
        )
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text("Quay lại"),
        ),
        body: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, keyboardSpace + 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
                    key: _formField,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        //introduce
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child:
                              CustomTextIntroduce(description: "Quên mật khẩu"),
                        ),
                        //discription
                        Text(
                          'Nhập mã OTP được gửi qua email của bạn.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                        ),
                        //nhập OTP
                        CustomOTP(
                          label: 'OTP',
                          controller: _otpController,
                          onChanged: (value) {
                            // onSetDisableButton();
                            _forgotPassCubit.codeChanged(value);
                          },
                        ),
                        //button confirm OTP
                        //input new pass
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
                            _forgotPassCubit.newPassChanged(value);
                          },
                          validator: (input) => isPassword(input.toString())
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
                            _forgotPassCubit.confirmPassChanged(value);
                          },
                          validator: (input) =>
                              onCheckedConfirmPassword(input.toString())
                                  ? null
                                  : ExceptionMassage.confirmPasswordValid,
                        ),
                        //button confirm new password
                        //button confirm OTP
                        BlocBuilder<ForgotPassCubit, ForgotPassState>(
                          buildWhen: (previous, current) =>
                              previous.status != current.status,
                          builder: (context, state) {
                            return state.status == ForgotPassStatus.submitting
                                ? const Padding(
                                    padding: EdgeInsets.only(top: 16),
                                    child: CircularProgressIndicator(),
                                  )
                                : CustomButton(
                                    title: "Xác nhận",
                                    disabled: _isButtonDisabled,
                                    onPressed: () {
                                      _forgotPassCubit.getForgotPass();
                                    });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 4),
                          child: Text(
                            "Không nhận được mã?",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        BlocBuilder<CreateOTPCubit, CreateOTPState>(
                          buildWhen: (previous, current) =>
                              previous.status != current.status,
                          builder: (context, state) {
                            return state.status == CreateOTPStatus.submitting
                                ? const CircularProgressIndicator()
                                : InkWell(
                                    onTap: () {
                                      _createOTPCubit.getCreateOTP();
                                    },
                                    child: Text(
                                      "Gửi lại",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                    ),
                                  );
                          },
                        ),
                      ],
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
