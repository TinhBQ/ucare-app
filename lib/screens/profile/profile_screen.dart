import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/blocs/blocs.dart';

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
            Image(
              image: AssetImage('assets/images/background-profile.png'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/images/default_avatar.png'),
                      ),
                      Column(
                        children: <Widget>[
                          Text('Bùi Quốc Tĩnh'),
                          Text('0946541256'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
