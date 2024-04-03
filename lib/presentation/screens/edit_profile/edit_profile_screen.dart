import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  static const String routeName = '/edit_profile';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const EditProfileScreen(),
    );
  }

  @override
  State<StatefulWidget> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formField = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _genderController = TextEditingController();
  final _nationalityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Chỉnh sửa thông tin',
      ),
      body: Center(
        child: Form(
          key: _formField,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 20,
            ),
            child: Column(
              children: [
                CustomTextFieldProfile(
                  controller: _nameController,
                  label: 'Họ và tên',
                  hint: 'VD',
                  content: "Bùi Quốc Tĩnh",
                ),
                CustomTextFieldProfile(
                  controller: _phoneController,
                  label: 'Số điện thoại',
                  content: "0938049556",
                  disabled: true,
                ),
                CustomTextFieldProfile(
                  controller: _emailController,
                  label: 'Email',
                  content: "mytran070202@gmail.com",
                  disabled: true,
                ),
                CustomTextfieldDatetime(
                  label: 'Ngày sinh',
                  controller: _dateOfBirthController,
                  // content: DateTime.utc(1989, 11, 9),
                ),
                CustomTextfieldDropdown(
                  controller: _genderController,
                  label: 'Giới tính',
                  listOption: const ['Nữ', 'Nam'],
                  content: 'Nữ',
                ),
                CustomButton(
                  title: 'CẬP NHẬT',
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
