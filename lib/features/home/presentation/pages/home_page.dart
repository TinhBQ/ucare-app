import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/utils/string_ternary_operator.dart';

import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    UserItem? userItem =
        context.select((AppUserCubit cubit) => cubit.state.userItem);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: IntroduceWidget(
              email: stringTernaryOperatir(userItem?.email, 'No Name'),
              avatar: stringTernaryOperatir(
                  userItem?.avatar, 'assets/logo/no-image.png'),
            ),
          ),
          const SliverToBoxAdapter(
            child: CategoriesGirdCardWidget(),
          ),
          const SliverToBoxAdapter(
            child: NewsWidget(),
          ),
        ],
      ),
    );
  }
}
