import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/utils/utils.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  static const String routeName = '/change_password';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ChangePasswordScreen(),
    );
  }

  @override
  State<StatefulWidget> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formField = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewpasswordController = TextEditingController();
  bool _passwordVisible = true;
  bool _isButtonDisabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Đổi mật khẩu',
      ),
      body: Center(
        child: Form(
          key: _formField,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Column(
              children: [
                CustomTextfield(
                  label: 'Mật khẩu cũ',
                  icon: Icons.lock,
                  controller: _oldPasswordController,
                  isObscureText: _passwordVisible,
                  suffixIcon: _passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onSuffixIcon: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  onChanged: (value) {},
                ),
                CustomTextfield(
                  label: 'Mật khẩu mới',
                  icon: Icons.lock,
                  controller: _newPasswordController,
                  isObscureText: _passwordVisible,
                  suffixIcon: _passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onSuffixIcon: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  onChanged: (value) {},
                  validator: (input) => isPassword(input.toString())
                      ? null
                      : "Mật khẩu không hợp lệ",
                ),
                CustomTextfield(
                  label: 'Nhập lại mật khẩu',
                  icon: Icons.lock,
                  controller: _confirmNewpasswordController,
                  isObscureText: _passwordVisible,
                  suffixIcon: _passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onSuffixIcon: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  onChanged: (value) {},
                ),
                CustomButton(
                  title: 'XÁC NHẬN',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
