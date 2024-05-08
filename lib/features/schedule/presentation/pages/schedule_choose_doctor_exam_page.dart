// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

import '../bloc/schedule_bloc.dart';
import '../widgets/widgets.dart';

class ScheduleChooseDoctorExamPage extends StatefulWidget {
  final String? department_id;
  final String? day;
  final Function(ScheduleItem)? onChooseDoctorExamPage;

  const ScheduleChooseDoctorExamPage({
    super.key,
    this.department_id,
    this.day,
    this.onChooseDoctorExamPage,
  });

  @override
  State<ScheduleChooseDoctorExamPage> createState() =>
      _CScheduleChooseDoctorExamPageState();
}

class _CScheduleChooseDoctorExamPageState
    extends State<ScheduleChooseDoctorExamPage> {
  final ScheduleGetList _scheduleGetList = const ScheduleGetList();

  ScheduleGetItem? _scheduleGetItem;

  @override
  void didChangeDependencies() {
    context.read<ScheduleBloc>().add(_scheduleGetList.copyWith(
          department_id: widget.department_id ?? '',
          filters: 'day=="${widget.day ?? ""}"',
        ));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = SliverToBoxAdapter(
      child: ScheduleChooseDoctorExamDoctorListItem(
        listScheduleItem: _scheduleGetItem?.rows ?? [],
        isLoading: false,
        isFirstLoading: false,
        onChooseScheduleItem: (ScheduleItem item) {
          widget.onChooseDoctorExamPage?.call(item);
        },
      ),
    );

    if (_scheduleGetItem != null &&
        (_scheduleGetItem?.rows == null || _scheduleGetItem!.rows.isEmpty)) {
      content = const SliverToBoxAdapter(
          child: CustomNoData(
        text: 'Lịch khám không chưa có.',
      ));
    }

    return BlocConsumer<ScheduleBloc, ScheduleState>(
      listener: (context, state) {
        if (state is ScheduleLoading) {
          LoadingOverlay.showLoading(context);
        }
        if (state is ScheduleFailure) {
          ShowSnackBar.error(state.message, context);
          LoadingOverlay.dismissLoading();
        }

        if (state is ScheduleSuccess) {
          if (state.onScheduleEvent == OnScheduleEvent.onScheduleGetList) {
            setState(() {
              _scheduleGetItem = state.scheduleGetItem;
            });
          }
          LoadingOverlay.dismissLoading();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomSubAppBar(
            title: 'Chọn Bác sĩ',
          ),
          body: SafeArea(
            child: CustomScrollView(
              slivers: [content],
            ),
          ),
        );
      },
    );
  }
}
