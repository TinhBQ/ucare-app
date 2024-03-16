import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/logic/blocs/blocs.dart';
import 'package:mobile_advanced_project_fe/presentation/screens/screens.dart';
import 'package:mobile_advanced_project_fe/presentation/widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const ProfileScreen());
  }

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late AuthBloc _authBloc;
  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/images/background-profile.png'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Image(
                              image: AssetImage(
                                  'assets/images/default_avatar.png'),
                              height: 80,
                              width: 80,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Bùi Quốc Tĩnh',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  '0946541256',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, EditProfileScreen.routeName);
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomInkwellItemProfile(
                    icon: Icons.insert_drive_file_rounded,
                    title: 'Hồ sơ cá nhân',
                    ontap: () {
                      Navigator.pushNamed(context, ProfilesScreen.routeName);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ),
                  CustomInkwellItemProfile(
                    icon: Icons.settings,
                    title: 'Cài đặt',
                    ontap: () {
                      Navigator.pushNamed(context, SettingsScreen.routeName);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ),
                  CustomInkwellItemProfile(
                    icon: Icons.lock,
                    title: 'Đổi mật khẩu',
                    ontap: () {
                      Navigator.pushNamed(context, ChangePasswordScreen.routeName);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ),
                  CustomInkwellItemProfile(
                    icon: Icons.logout_outlined,
                    title: 'Đăng xuất',
                    ontap: () {
                      _authBloc.add(AuthEventLoggedOut());
                      Navigator.pushAndRemoveUntil(context, SignInScreen.route(), (route) => false);
                    },
                    hideIconNavigation: true,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
