import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_new/app_new_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';
import 'package:mobile_advanced_project_fe/features/new/presentation/bloc/news_bloc.dart';

import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserItem? userItem =
        context.select((AppUserCubit cubit) => cubit.state.userItem);

    NewGetItem? newGetItem =
        context.select((AppNewCubit cubit) => cubit.state.newGetItem);

    return BlocListener<NewsBloc, NewsState>(
      listener: (context, state) {
        if (state is NewsLoading) {
          LoadingOverlay.showLoading(context);
        }

        if (state is NewsFailure) {
          LoadingOverlay.dismissLoading();
          ShowSnackBar.error(state.message, context);
        }

        if (state is NewsSuccess) {
          LoadingOverlay.dismissLoading();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: HomeIntroduce(
                email: stringTernaryOperatir(userItem?.email, 'No Name'),
                avatar: userItem!.avatar,
              ),
            ),
            const SliverToBoxAdapter(
              child: HomeCategoriesGirdCard(),
            ),
            if (newGetItem != null)
              SliverToBoxAdapter(
                child: HomeNewsWidget(
                  newItems: newGetItem.rows,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
