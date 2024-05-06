import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/medicine_sessions/medicine_sessions_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/features/medicine_schedule/presentation/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';

import '../bloc/medicine_schedule_bloc.dart';

class MedicineSchedulePage extends StatefulWidget {
  const MedicineSchedulePage({super.key});

  @override
  State<StatefulWidget> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicineSchedulePage> {
  late List<MedicineDayItem> medicineDays = [];
  DateTime fromDay = DateTime.utc(2024, 3, 12);
  DateTime toDay = DateTime(2024, 4, 30);

  void _updateMedicineDays() {
    medicineDays = [
      MedicineDayItem(
        title: 'Từ ngày',
        icon: Icons.fast_forward_outlined,
        day: fromDay,
        onChangedDay: () async {
          fromDay = (await selectDate(context, fromDay)) ?? fromDay;
          setState(() {
            _updateMedicineDays();
          });
        },
      ),
      MedicineDayItem(
        title: 'Đến ngày',
        icon: Icons.fast_rewind_outlined,
        day: toDay,
        onChangedDay: () async {
          toDay = (await selectDate(context, toDay)) ?? toDay;
          setState(() {
            _updateMedicineDays();
          });
        },
      ),
    ];
  }

  Future<DateTime?> selectDate(BuildContext context, DateTime day) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: day,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != day) {
      return picked;
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _updateMedicineDays();
  }

  @override
  Widget build(BuildContext context) {
    List<MedicineSessionItem> medicineSessions = context.select(
        (MedicineSessionsCubit cubit) => cubit.state.medicineSessionItems);

    return BlocConsumer<MedicineScheduleBloc, MedicineScheduleState>(
      listener: (context, state) {
        if (state is MedicineScheduleSuccess) {
          if (state.onMedicineSchedule ==
                  OnMedicineSchedule.onMedicineScheduleUpdateTime ||
              state.onMedicineSchedule ==
                  OnMedicineSchedule.onMedicineScheduleChecked) {
            context.read<MedicineScheduleBloc>().add(MedicineScheduleGetList());
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: const CustomAppBar(
            title: 'Đặt lịch uống thuốc',
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: MedicineScheduleSessions(
                      medicineSessions: medicineSessions,
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 16),
                    sliver: SliverToBoxAdapter(
                      child: MedicineScheduleDays(
                        medicineDays: medicineDays,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
