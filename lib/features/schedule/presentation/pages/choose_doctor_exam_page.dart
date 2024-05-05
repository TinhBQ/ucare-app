// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

import '../bloc/schedule_bloc.dart';
import '../widgets/widgets.dart';

class ChooseDoctorExamPage extends StatefulWidget {
  final String? department_id;
  final String? day;
  final Function(ScheduleItem)? onChooseDoctorExamPage;

  const ChooseDoctorExamPage({
    super.key,
    this.department_id,
    this.day,
    this.onChooseDoctorExamPage,
  });

  @override
  State<ChooseDoctorExamPage> createState() => _ChooseDoctorExamPageState();
}

class _ChooseDoctorExamPageState extends State<ChooseDoctorExamPage> {
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
    return BlocConsumer<ScheduleBloc, ScheduleState>(
      listener: (context, state) {
        if (state is ScheduleFailure) {
          ShowSnackBar.error(state.message, context);
        }

        if (state is ScheduleSuccess) {
          if (state.onScheduleEvent == OnScheduleEvent.onScheduleGetList) {
            setState(() {
              _scheduleGetItem = state.scheduleGetItem;
            });
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const SubAppBarWidget(
            title: 'Chọn Bác sĩ',
          ),
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: ChooseDoctorExamDoctorListItem(
                    listScheduleItem: _scheduleGetItem?.rows ?? [],
                    isLoading: false,
                    isFirstLoading: false,
                    onChooseScheduleItem: (ScheduleItem item) {
                      widget.onChooseDoctorExamPage?.call(item);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
