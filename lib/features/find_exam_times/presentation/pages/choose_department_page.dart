import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/utils/show_snackbar.dart';

import '../../../../core/utils/loading_overlay.dart';
import '../bloc/find_exam_times_bloc.dart';
import '../widgets/widget.dart';

class ChooseDepartmentPage extends StatefulWidget {
  const ChooseDepartmentPage({super.key});

  @override
  State<ChooseDepartmentPage> createState() => _ChooseDepartmentPageState();
}

class _ChooseDepartmentPageState extends State<ChooseDepartmentPage> {
  DepartmentGetItem? _departmentGetItem;
  final _searchController = TextEditingController();

  @override
  void didChangeDependencies() {
    context.read<FindExamTimesBloc>().add(const FindExamTimesGetDepartments(
          currentPage: '1',
          pageSize: '10',
          filters: null,
          sortField: null,
          sortOrder: null,
        ));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FindExamTimesBloc, FindExamTimesState>(
      listener: (context, state) {
        if (state is FindExamTimesLoading) {
          LoadingOverlay.showLoading(context);
        }

        if (state is FindExamTimesFailure) {
          ShowSnackBar.error(state.message, context);
          LoadingOverlay.dismissLoading();
        }

        if (state is FindExamTimesSuccess) {
          if (state.onFindExamTimesEvent ==
              OnFindExamTimesEvent.onFindExamTimesGetDepartments) {
            setState(() {
              _departmentGetItem = state.departmentGetItem;
            });
          }
          ShowSnackBar.success(state.message, context);
          LoadingOverlay.dismissLoading();
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: const CustomAppBar(
            title: 'Chọn chuyên Khoa',
          ),
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  pinned: true,
                  snap: true,
                  stretch: true,
                  floating: true,
                  expandedHeight: 68.0,
                  flexibleSpace: CustomSearchBar(
                    controller: _searchController,
                    borderColor: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                SliverToBoxAdapter(
                  child: ChooseDepartmentListItemWidget(
                    listChooseDepartmentItem: _departmentGetItem?.rows ?? [],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
