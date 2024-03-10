import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_advanced_project_fe/logic/cubits/cubits.dart';
import 'package:mobile_advanced_project_fe/presentation/screens/signin/signin_screen.dart';
import 'package:mobile_advanced_project_fe/presentation/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/utils/exception_massage.dart';
import 'package:mobile_advanced_project_fe/utils/show_snackbar.dart';

class ConfirmRegisterScreen extends StatefulWidget {
  static const String routeName = '/signup/confirm';

  const ConfirmRegisterScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ConfirmRegisterScreen(),
    );
  }

  @override
  State<StatefulWidget> createState() => _ConfirmRegisterScreenState();
}

class _ConfirmRegisterScreenState extends State<ConfirmRegisterScreen> {
  final _formField = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  late ConfirmRegisterCubit _confirmRegisterCubit;

  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    _confirmRegisterCubit = BlocProvider.of(context);
  }

  void onSetDisableButton() {
    if (_codeController.text.isEmpty || _codeController.text.length != 6) {
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

    return BlocListener<ConfirmRegisterCubit, ConfirmRegisterState>(
      listener: (context, state) {
        if (state.status == ConfirmRegisterStatus.success) {
          ShowSnackBar.success(ExceptionMassage.signupSuccess, context);
          Navigator.pop(context);
        }
        if (state.status == ConfirmRegisterStatus.error) {
          ShowSnackBar.error(ExceptionMassage.authenticationFailed, context);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text("Quay lại"),
        ),
        body: SafeArea(
          child: Center(
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
                              description: "Xác thực đăng ký tài khoản"),
                        ),

                        Form(
                          key: _formField,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 32, left: 32),
                                child: Text(
                                  "Nhập mã OTP được gửi qua email đăng ký của bạn.",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                ),
                              ),
                              CustomOTP(
                                label: 'OTP',
                                controller: _codeController,
                                onChanged: (value) {
                                  onSetDisableButton();
                                  _confirmRegisterCubit.codeChanged(value);
                                },
                              ),

                              // button signins
                              BlocBuilder<ConfirmRegisterCubit,
                                  ConfirmRegisterState>(
                                buildWhen: (previous, current) =>
                                    previous.status != current.status,
                                builder: (context, state) {
                                  return state.status ==
                                          ConfirmRegisterStatus.submitting
                                      ? const Padding(
                                          padding: EdgeInsets.only(top: 24),
                                          child: CircularProgressIndicator(),
                                        )
                                      : CustomButton(
                                          title: "XÁC NHẬN",
                                          disabled: _isButtonDisabled,
                                          onPressed: () {
                                            _confirmRegisterCubit
                                                .confirmRegister();
                                          });
                                },
                              ),
                            ],
                          ),
                        ),
                        LottieBuilder.asset("assets/lottie/otp-animation.json")
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
    );
  }
}
