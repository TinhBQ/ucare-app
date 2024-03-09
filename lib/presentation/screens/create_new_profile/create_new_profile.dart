import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/presentation/widgets/custom_textfield_dropdown.dart';
import 'package:mobile_advanced_project_fe/presentation/widgets/widgets.dart';

class CreateNewProfile extends StatefulWidget {
  const CreateNewProfile({super.key});

  static const String routeName = '/create_new_profile';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CreateNewProfile(),
    );
  }

  @override
  State<StatefulWidget> createState() => _CreateNewProfileState();
}

class _CreateNewProfileState extends State<CreateNewProfile> {
  final lastNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final idController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final genderController = TextEditingController();

  final List<String> listGender = ['Nữ', 'Nam'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Tạo hồ sơ',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Column(
              children: [
                CustomTextFieldProfile(
                  label: 'Họ tên lót*',
                  hint: 'VD: Nguyên Văn...',
                  controller: lastNameController,
                ),
                CustomTextFieldProfile(
                  label: 'Tên*',
                  hint: 'VD: A...',
                  controller: firstNameController,
                ),
                CustomTextFieldProfile(
                  label: 'Số điện thoại',
                  hint: 'VD: 94654xxxx',
                  controller: phoneController,
                ),
                CustomTextFieldProfile(
                  label: 'Email*',
                  hint: 'Email...',
                  controller: emailController,
                ),
                CustomTextFieldProfile(
                  label: 'CCCD/CMND/Passport',
                  hint: 'CCCD/CMND/Passport',
                  controller: idController,
                ),
                CustomTextFieldProfile(
                  label: 'Nghề nghiệp*',
                  hint: 'VD: Lập trình viên',
                  controller: idController,
                ),
                CustomTextfieldDatetime(
                  label: 'Ngày sinh*',
                  controller: dateOfBirthController,
                ),
                CustomTextfieldDropdown(
                  controller: genderController,
                  label: 'Giới tính',
                  listOption: listGender,
                ),
                CustomButton(
                  title: "Xác Nhận",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
