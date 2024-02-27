import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
                            onChanged: (value) {},
                          ),
                          //button
                          CustomButton(
                            title: "XÁC NHẬN",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
