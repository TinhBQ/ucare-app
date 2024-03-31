import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/features/medicine_schedule/presentation/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';

class MedicineSchedulePage extends StatefulWidget {
  const MedicineSchedulePage({super.key});

  @override
  State<StatefulWidget> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicineSchedulePage> {
  bool isActivedMoringSession = false;
  bool isActivedNoonSession = false;
  bool isActivedAfternoonSession = false;
  bool isActivedEveningSession = false;
  bool isActivedFreeSession = false;
  bool isActivedBeforSleepSession = false;
  late List<MedicineSessionItem> medicineSessions = [];
  TimeOfDay timeMorningSession = const TimeOfDay(hour: 6, minute: 00);
  TimeOfDay timeNoonSession = const TimeOfDay(hour: 11, minute: 00);
  TimeOfDay timeAfternoonSession = const TimeOfDay(hour: 13, minute: 00);
  TimeOfDay timeEveningSession = const TimeOfDay(hour: 18, minute: 00);
  TimeOfDay timeFreeSession = const TimeOfDay(hour: 00, minute: 00);
  TimeOfDay timeBeforSleepSession = const TimeOfDay(hour: 22, minute: 00);
  late List<MedicineDayItem> medicineDays = [];
  DateTime fromDay = DateTime.utc(2024, 3, 12);
  DateTime toDay = DateTime(2024, 4, 30);

  void _updateMedicineSessions() {
    medicineSessions = [
      MedicineSessionItem(
        session: 'Buổi sáng',
        icon: Icons.wb_sunny_outlined,
        onChangedActive: (value) {
          setState(() {
            isActivedMoringSession = value;
            _updateMedicineSessions();
          });
        },
        time: timeMorningSession,
        onChangedTime: () async {
          timeMorningSession =
              (await _selectTime(context, timeMorningSession)) ??
                  timeMorningSession;
          setState(() {
            _updateMedicineSessions();
          });
        },
        isActived: isActivedMoringSession,
      ),
      MedicineSessionItem(
        session: 'Buổi trưa',
        icon: Icons.sunny,
        onChangedActive: (value) {
          setState(() {
            isActivedNoonSession = value;
            _updateMedicineSessions();
          });
        },
        time: timeNoonSession,
        onChangedTime: () async {
          timeNoonSession =
              (await _selectTime(context, timeNoonSession)) ?? timeNoonSession;
          setState(() {
            _updateMedicineSessions();
          });
        },
        isActived: isActivedNoonSession,
      ),
      MedicineSessionItem(
        session: 'Buổi chiều',
        icon: Icons.sunny_snowing,
        onChangedActive: (value) {
          setState(() {
            isActivedAfternoonSession = value;
            _updateMedicineSessions();
          });
        },
        time: timeAfternoonSession,
        onChangedTime: () async {
          timeAfternoonSession =
              (await _selectTime(context, timeAfternoonSession)) ??
                  timeAfternoonSession;
          setState(() {
            _updateMedicineSessions();
          });
        },
        isActived: isActivedAfternoonSession,
      ),
      MedicineSessionItem(
        session: 'Buổi tối',
        icon: Icons.nightlight_round,
        onChangedActive: (value) {
          setState(() {
            isActivedEveningSession = value;
            _updateMedicineSessions();
          });
        },
        time: timeEveningSession,
        onChangedTime: () async {
          timeEveningSession =
              (await _selectTime(context, timeEveningSession)) ??
                  timeEveningSession;
          setState(() {
            _updateMedicineSessions();
          });
        },
        isActived: isActivedEveningSession,
      ),
      MedicineSessionItem(
        session: 'Trước khi ngủ',
        icon: Icons.night_shelter,
        onChangedActive: (value) {
          setState(() {
            isActivedBeforSleepSession = value;
            _updateMedicineSessions();
          });
        },
        time: timeBeforSleepSession,
        onChangedTime: () async {
          timeBeforSleepSession =
              (await _selectTime(context, timeBeforSleepSession)) ??
                  timeBeforSleepSession;
          setState(() {
            _updateMedicineSessions();
          });
        },
        isActived: isActivedBeforSleepSession,
      ),
      MedicineSessionItem(
        session: 'Tự do',
        icon: Icons.accessibility_outlined,
        onChangedActive: (value) {
          setState(() {
            isActivedFreeSession = value;
            _updateMedicineSessions();
          });
        },
        time: timeFreeSession,
        onChangedTime: () async {
          timeFreeSession =
              (await _selectTime(context, timeFreeSession)) ?? timeFreeSession;
          setState(() {
            _updateMedicineSessions();
          });
        },
        isActived: isActivedFreeSession,
      ),
    ];
  }

  void _updateMedicineDays() {
    medicineDays = [
      MedicineDayItem(
        title: 'Từ ngày',
        icon: Icons.fast_forward_outlined,
        day: fromDay,
        onChangedDay: () async {
          fromDay = (await _selectDate(context, fromDay)) ?? fromDay;
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
          toDay = (await _selectDate(context, toDay)) ?? toDay;
          setState(() {
            _updateMedicineDays();
          });
        },
      ),
    ];
  }

  Future<TimeOfDay?> _selectTime(BuildContext context, TimeOfDay time) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (picked != null && picked != time) {
      return picked;
    }
  }

  Future<DateTime?> _selectDate(BuildContext context, DateTime day) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: day,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
      
    );
    if (picked != null && picked != day) {
      return picked;
    }
  }

  @override
  void initState() {
    super.initState();
    _updateMedicineSessions();
    _updateMedicineDays();
  }

  @override
  Widget build(BuildContext context) {
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
                child: MedicineSessionsWidget(
                  medicineSessions: medicineSessions,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 16),
                sliver: SliverToBoxAdapter(
                  child: MedicineDaysWidget(
                    medicineDays: medicineDays,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
