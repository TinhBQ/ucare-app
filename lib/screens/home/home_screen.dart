import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen());
  }

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, right: 20, left: 20),
            child: Row(
              children: [
                Text(
                  'Chào mừng đến với',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  ' ',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'U Care',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              childAspectRatio: (1 / .4),
              mainAxisSpacing: 16,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              children: [
                CustomCategoryCard(
                  title: 'Đặt khám',
                  icon: Icons.local_hospital,
                  onPressed: () {
                    print('object');
                  },
                ),
                CustomCategoryCard(
                  title: 'Lịch sử đặt khám',
                  icon: Icons.file_copy_outlined,
                  onPressed: () {
                    print('object');
                  },
                ),
                CustomCategoryCard(
                  title: 'Đặt lịch uống thuốc',
                  icon: Icons.medication_liquid,
                  onPressed: () {
                    print('object');
                  },
                ),
                CustomCategoryCard(
                  title: 'Theo dõi sức khỏe',
                  icon: Icons.monitor_heart,
                  onPressed: () {
                    print('object');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
