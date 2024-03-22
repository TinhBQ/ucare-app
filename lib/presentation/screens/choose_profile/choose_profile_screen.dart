import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/presentation/screens/create_new_profile/create_new_profile.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';

class ChooseProflieScreen extends StatelessWidget {
  const ChooseProflieScreen({super.key});

  static const String routeName = '/choose_profile';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ChooseProflieScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Chọn hồ sơ',
        iconAction: Icons.messenger_outline,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: currentHeight - 68,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 36,
              ),
              //when no-date
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage(
                      'assets/images/no-data.png',
                    ),
                    height: 295,
                    width: 197,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 44,
                    ),
                    child: Text(
                      'Bạn chưa có hồ sơ đặt khám, vui lòng tạo hồ sơ mới!',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              //when have data
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 100,
          vertical: 40,
        ),
        child: CustomButton(
          title: 'TẠO HỒ SƠ MỚI',
          onPressed: () {
            Navigator.pushNamed(context, CreateNewProfile.routeName);
          },
        ),
      ), // Tuỳ chỉnh màu sắc của nút
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
