import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/widgets/custom_appbar.dart';
import 'package:mobile_advanced_project_fe/widgets/custom_textfield.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Tạo hồ sơ',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              
            ],
          ),
        ),
      ),
    );
  }
}
