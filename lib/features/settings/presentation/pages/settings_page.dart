import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/configs/themes/dark_theme.dart';
import 'package:mobile_advanced_project_fe/configs/themes/theme_provider.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const CustomAppBar(
        title: 'Cài đặt',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
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
