import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/cubits/cubits.dart';
import 'package:mobile_advanced_project_fe/screens/screens.dart';
import 'package:mobile_advanced_project_fe/widgets/widgets.dart';

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
  final formField = GlobalKey<FormState>();
  final emailController = TextEditingController();

  late CreateOTPCubit _createOTPCubit;

  @override
  void initState() {
    super.initState();
    _createOTPCubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    return BlocListener<CreateOTPCubit, CreateOTPState>(
        listener: (context, state) {
          if (state.status == CreateOTPStatus.success) {
            Navigator.pushAndRemoveUntil(
                context, ForgotPassSendOTPScreen.route(), (route) => false);
          }
          if (state.status == CreateOTPStatus.error) {}
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                height: currentHeight,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 16, right: 20, left: 20),
                  child: Form(
                      key: formField,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              //Introduce
                              const Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: CustomTextIntroduce(description: ""),
                              ),
                              //information
                              CustomTextfield(
                                label: 'Email',
                                icon: Icons.email,
                                controller: emailController,
                                onChanged: (value) {_createOTPCubit.emailChanged(value);},
                              ),
                              //button
                              BlocBuilder<CreateOTPCubit, CreateOTPState>(
                                buildWhen: (previous, current) =>
                                    previous.status != current.status,
                                builder: (context, state) {
                                  return state.status ==
                                          CreateOTPStatus.submitting
                                      ? const CircularProgressIndicator()
                                      : CustomButton(
                                          title: "Xác nhận",
                                          onPressed: () {
                                            _createOTPCubit.getCreateOTP();
                                          });
                                },
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ),
        ));
  }
}
