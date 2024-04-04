import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/names.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_medical_appointment_body/app_medical_appointment_body_cubit.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

class ChooseInfoWidget extends StatefulWidget {
  const ChooseInfoWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ChooseInfoWidgetState();
}

class _ChooseInfoWidgetState extends State<ChooseInfoWidget> {
  List<InfoMedicalItem> infoMedicalItems = [];
  bool? isChoseSpecilty =
      true; // null: không iconRight, false: icon right là arrow_left, true: icon checked
  bool? isChoseDate = false;
  bool? isChoseTime = false;
  bool? isChoseDoctor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    infoMedicalItems = [
      InfoMedicalItem(
        title: 'Chuyên khoa',
        icon: Icons.local_hospital_outlined,
        onPressed: () {
          Navigator.of(context)
              .pushNamed(AppRoutes.CHOOSE_DEPARTMET_PAGE, arguments: {
            'onDepartmentSelected': (DepartmentItem item) {
              context
                  .read<AppMedicalAppointmentBodyCubit>()
                  .updateDepartmentItem(item);
              Navigator.of(context).pop();
            }
          });
          context.read<AppMedicalAppointmentBodyCubit>().updateNumFlow(1);
        },
        iconRight: isChoseSpecilty == null
            ? null
            : isChoseSpecilty == false
                ? Icons.keyboard_arrow_right_outlined
                : Icons.check_circle,
      ),
      InfoMedicalItem(
        title: 'Ngày khám',
        icon: Icons.date_range_outlined,
        onPressed: isChoseDate == null
            ? null
            : () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.CHOOSE_DATE_MEDICAL_PAGE)
                    .then((value) => context
                        .read<AppMedicalAppointmentBodyCubit>()
                        .updateNumFlow(2));
              },
        iconRight: isChoseDate == null
            ? null
            : isChoseDate == false
                ? Icons.keyboard_arrow_right_outlined
                : Icons.check_circle,
      ),
      InfoMedicalItem(
        title: 'Giờ khám',
        icon: Icons.watch_later_outlined,
        onPressed: isChoseTime == null
            ? null
            : () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChooseTimeMedicalWidget(),
                  ),
                );
                context.read<AppMedicalAppointmentBodyCubit>().updateNumFlow(3);
              },
        iconRight: isChoseTime == null
            ? null
            : isChoseTime == false
                ? Icons.keyboard_arrow_right_outlined
                : Icons.check_circle,
      ),
      // InfoMedicalItem(
      //   title: 'Bác sĩ',
      //   icon: Icons.medical_services_outlined,
      //   iconRight: isChoseDoctor == null
      //       ? null
      //       : isChoseDoctor == true
      //           ? Icons.keyboard_arrow_right_outlined
      //           : Icons.check_circle,
      // ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    int numFlow = context.watch<AppMedicalAppointmentBodyCubit>().state.numFlow;
    print('numFlow $numFlow');
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: const SubAppBarWidget(
        title: 'Chọn thông tin khám',
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: InfoMedicalsListCardWidget(
              listInfoMedicalItems: infoMedicalItems,
              numFlow: numFlow,
            ),
          ),
        ],
      ),
    );
  }
}
