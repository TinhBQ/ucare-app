import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/blocs/blocs.dart';
import 'package:mobile_advanced_project_fe/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const String routeName = '/main';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const MainScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        print(state);
        if (state is AuthInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UnAuthenticateState) {
          // Sử dụng Future.delayed để chuyển hướng sau khi giao diện đã được xây dựng
          Future.delayed(Duration.zero, () {
            Navigator.pushReplacement(
              context,
              SignInScreen.route(),
            );
          });
        }
        if (state is AuthenticateState) {
          // Nếu trạng thái là AuthenticateState, trả về MainPage
          return const Scaffold(
            body: MainPage(),
          );
        }
        // Mặc định, trả về một Text hiển thị "Something went wrong"
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: _buildPage(_currentIndex),
      ),
      bottomNavigationBar: CustomNavBar(
        onTabSelected: _onTabSelected,
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ProfileScreen();
      default:
        return const MainScreen();
    }
  }
}
