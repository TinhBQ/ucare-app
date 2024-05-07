import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_choose_exam_info/app_choose_exam_info_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_patient/app_patient_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

import '../bloc/patient_bloc.dart';
import '../widgets/widget.dart';

class PatientChooseProfilePage extends StatefulWidget {
  const PatientChooseProfilePage({super.key});

  @override
  State<PatientChooseProfilePage> createState() =>
      _PatientChooseProfilePageState();
}

class _PatientChooseProfilePageState extends State<PatientChooseProfilePage> {
  bool _isLoading = false;
  PatientGetItem? _patientGetItem;
  BaseGetRequestModel? _baseGetRequestModel;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<AppChooseExamInfoCubit>().updateInitial();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    _patientGetItem = context.read<AppPatientCubit>().state.patientGetItem;

    if (_patientGetItem?.totalPages.toString() ==
        _patientGetItem?.currentPage.toString()) {
      return;
    }

    if (!_isLoading &&
        _scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _isLoading = true;
      });
      context
          .read<AppPatientCubit>()
          .nextPage((_patientGetItem!.currentPage + 1).toString());
      _loadData();
    }
  }

  void _loadData() {
    _baseGetRequestModel =
        context.read<AppPatientCubit>().state.baseGetRequestModel;

    context.read<PatientBloc>().add(
          PatientGetList(
            currentPage: _baseGetRequestModel!.currentPage,
            pageSize: _baseGetRequestModel!.pageSize,
            filters: _baseGetRequestModel!.filters,
            sortField: _baseGetRequestModel!.sortField,
            sortOrder: _baseGetRequestModel!.sortOrder,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    PatientGetItem? patientGetItem =
        context.select((AppPatientCubit cubit) => cubit.state.patientGetItem);

    return BlocConsumer<PatientBloc, PatientState>(
      listener: (context, state) {
        if (state is PatientLoading) {
          LoadingOverlay.showLoading(context);
        } else if (state is PatientFailure) {
          LoadingOverlay.dismissLoading();
          // ShowSnackBar.error(state.message, context);
        } else if (state is PatientSuccess) {
          LoadingOverlay.dismissLoading();
          // ShowSnackBar.success(state.message, context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: const CustomSubAppBar(
            title: 'Chọn hồ sơ đặt khám',
          ),
          body: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  PatientProfileDetailsListCardWidget(
                    onChoose: (PatientItem item) {
                      context
                          .read<AppChooseExamInfoCubit>()
                          .updatePatientId(item.id);
                      Navigator.of(context)
                          .pushNamed(BookRoutes.BOOK_CHOOSE_EXAM_INFOR)
                          .then((value) => context
                              .read<AppChooseExamInfoCubit>()
                              .updateInitial());
                    },
                    patients: patientGetItem?.rows ?? [],
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.only(bottom: 96),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: CustomCta(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      BookRoutes.BOOK_PATIENT_ADD,
                    );
                  },
                  disable: false,
                  title: 'THÊM HỒ SƠ',
                  background: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
