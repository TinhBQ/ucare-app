import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/cubits/cubits.dart';
import 'package:mobile_advanced_project_fe/screens/main/main_screen.dart';
import 'package:mobile_advanced_project_fe/screens/screens.dart';
import 'package:mobile_advanced_project_fe/widgets/widgets.dart';

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
  final formField = GlobalKey<FormState>();
  final codeController = TextEditingController();
  bool checked = false;
  late ConfirmRegisterCubit _confirmRegisterCubit;

  @override
  void initState() {
    super.initState();
    _confirmRegisterCubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    return BlocListener<ConfirmRegisterCubit, ConfirmRegisterState>(
      listener: (context, state) {
        if (state.status == ConfirmRegisterStatus.success) {
          Navigator.pushAndRemoveUntil(
              context, MainScreen.route(), (route) => false);
        }
        if (state.status == ConfirmRegisterStatus.error) {}
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

                          const Padding(
                            padding: EdgeInsets.only(right: 44, left: 44),
                            child: Text(
                                textAlign: TextAlign.center,
                                "Nhập mã OTP được gửi qua email đăng ký của bạn"),
                          ),

                          Column(
                            children: [
                              CustomOTP(
                                label: 'OTP',
                                controller: codeController,
                                onChanged: (value) {
                                  _confirmRegisterCubit.codeChanged(value);
                                },
                              ),

                              // button signin
                              BlocBuilder<ConfirmRegisterCubit, ConfirmRegisterState>(
                                buildWhen: (previous, current) =>
                                    previous.status != current.status,
                                builder: (context, state) {
                                  return state.status == ConfirmRegisterStatus.submitting
                                      ? const CircularProgressIndicator()
                                      : CustomButton(
                                          title: "XÁC NHẬN",
                                          onPressed: () {
                                            _confirmRegisterCubit.confirmRegister();
                                          });
                                },
                              ),
                            ],
                          )

                          //forgot pass
                        ],
                      ),
                      //CTA sign up
                      CustomInkwell(
                        description: 'Bạn đã có sẵn tài khoản?',
                        onTap: () {},
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
