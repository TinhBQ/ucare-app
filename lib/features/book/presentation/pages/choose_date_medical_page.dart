import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/configs/routes/names.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_medical_appointment_body/app_medical_appointment_body_cubit.dart';
import 'package:mobile_advanced_project_fe/core/utils/time_zone.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ChooseDateMedicalPage extends StatefulWidget {
  const ChooseDateMedicalPage({super.key});

  @override
  State<ChooseDateMedicalPage> createState() => _ChooseDateMedicalPageState();
}

class _ChooseDateMedicalPageState extends State<ChooseDateMedicalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBarWidget(
        title: 'Chọn ngày khám',
      ),
      body: Column(
        children: [
          PickerDateWidget(
            onSelected: (DateTime dateTime) {
              bool isSucess = context
                  .read<AppMedicalAppointmentBodyCubit>()
                  .updateStrDate(UCARETimeZone.fDate(dateTime));
              if (isSucess) {
                Navigator.of(context).pushNamed(AppRoutes.CHOOSE_INFOR);
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.square,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text('Ngày có thể chọn')
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.square,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text('Ngày ngoài vùng đăng ký khám')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
