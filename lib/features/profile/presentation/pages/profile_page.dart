import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';
import 'package:mobile_advanced_project_fe/features/auth/presentation/bloc/auth_bloc.dart';

import '../widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    UserItem? userItem =
        context.select((AppUserCubit cubit) => cubit.state.userItem);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          LoadingOverlay.showLoading(context);
        }

        if (state is AuthFailure) {
          LoadingOverlay.dismissLoading();
          ShowSnackBar.error(state.message, context);
        }

        if (state is AuthSuccess) {
          if (state.onAuthEvent == OnAuthEvent.onAuthLogout) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRoutes.SING_IN, (route) => false);
          }

          LoadingOverlay.dismissLoading();
          ShowSnackBar.success(state.message, context);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: ProflieIntroduceWidget(),
            ),
            SliverToBoxAdapter(
              child: ProfileShortWidget(
                name: stringTernaryOperatir(userItem?.user_name, 'No Name'),
                email: stringTernaryOperatir(userItem?.email, 'No Email'),
                avatar: stringTernaryOperatir(
                    userItem?.avatar, 'assets/logo/no-image.png'),
              ),
            ),
            const SliverToBoxAdapter(
              child: ProfileInkwellListItemWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
