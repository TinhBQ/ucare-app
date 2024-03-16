import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/themes/dark_theme.dart';
import 'package:mobile_advanced_project_fe/core/themes/theme_provider.dart';
import 'package:mobile_advanced_project_fe/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const String routeName = '/settings';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SettingsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Cài đặt',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(
                        Icons.nightlight,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Giao diện tối",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Switch(
                    activeColor: Theme.of(context).colorScheme.onBackground,
                    value: Provider.of<ThemeProvider>(context).themeData ==
                        darkTheme,
                    onChanged: (value) {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
