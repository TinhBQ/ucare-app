import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/presentation/screens/medical_appointment_schedule/doctor_item.dart';
import 'package:mobile_advanced_project_fe/presentation/screens/medical_appointment_schedule/medical_appointment_schedule_option.dart';
import 'package:mobile_advanced_project_fe/presentation/widgets/widgets.dart';

import 'choose_option.dart';

class MedicalAppointmentScheduleScreen extends StatefulWidget {
  const MedicalAppointmentScheduleScreen({super.key});

  static const String routeName = '/medical-appointment-schedule';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const MedicalAppointmentScheduleScreen());
  }

  @override
  State<MedicalAppointmentScheduleScreen> createState() {
    return _MedicalAppointmentScheduleScreenState();
  }
}

class _MedicalAppointmentScheduleScreenState
    extends State<MedicalAppointmentScheduleScreen> {
  final _codeController = TextEditingController();

  void _openChooseDepartment() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      context: context,
      builder: (ctx) => const ChooseOption(
        title: 'Chọn chuyên khoa',
      ),
    );
  }

  void _openChooseSessionOfDay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      context: context,
      builder: (ctx) => const ChooseOption(
        title: 'Chọn ngày khám',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const CustomAppBar(
        title: 'Lịch khám bệnh',
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      MedicalAppointmentScheduleOption(
                        title: 'Lọc chuyên khoa',
                        subtitle: 'Chọn chuyên khoa khám bệnh',
                        width: sizeScreen.width / 2 - 0.5,
                        onTap: _openChooseDepartment,
                      ),
                      SizedBox(
                        width: 1,
                        child: VerticalDivider(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      MedicalAppointmentScheduleOption(
                        title: 'Lọc ngày khám',
                        subtitle: 'Chọn ngày khám bệnh',
                        width: sizeScreen.width / 2 - 0.5,
                        onTap: _openChooseSessionOfDay,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              CustomSearchBar(
                controller: _codeController,
              ),
              const SizedBox(height: 8),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: DoctorItem())
            ],
          ),
        ),
      ),
    );
  }
}
