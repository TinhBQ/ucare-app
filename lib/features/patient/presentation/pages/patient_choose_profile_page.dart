import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_medical_appointment_body/app_medical_appointment_body_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_patient/app_patient_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils.dart';

import '../bloc/patient_bloc.dart';
import '../widgets/widget.dart';

class PatientChooseProfilePage extends StatefulWidget {
  const PatientChooseProfilePage({super.key});

  @override
  State<PatientChooseProfilePage> createState() =>
      _PatientChooseProfilePageState();
}

class _PatientChooseProfilePageState extends State<PatientChooseProfilePage> {
  @override
  void initState() {
    context.read<PatientBloc>().add(const PatientGetList());
    super.initState();
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
            title: 'Chọn chuyên Khoa',
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            child: Column(
              children: [
                const ProfilesListCardWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Divider(
                    thickness: 1,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                ProfileDetailsListCardWidget(
                  onChoose: (PatientItem item) {
                    context
                        .read<AppMedicalAppointmentBodyCubit>()
                        .updatePatientId(item.id);
                    Navigator.of(context)
                        .pushNamed(AppRoutes.CHOOSE_INFOR)
                        .then((value) => context
                            .read<AppMedicalAppointmentBodyCubit>()
                            .returnPatientId());
                  },
                  patients: patientGetItem?.rows ?? [],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
