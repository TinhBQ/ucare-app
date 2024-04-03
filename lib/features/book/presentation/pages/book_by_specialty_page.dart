import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_medical_appointment_body/app_medical_appointment_body_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

class BookBySpecialtyPage extends StatefulWidget {
  const BookBySpecialtyPage({super.key});

  @override
  State<StatefulWidget> createState() => _BookBySpecialtyPageState();
}

class _BookBySpecialtyPageState extends State<BookBySpecialtyPage> {
  List<String> listTitleSteps = [
    'Chọn hồ sơ',
    'Chọn thông tin khám',
    'Xác nhận thông tin khám',
    'Thanh toán',
    'Phiếu khám bệnh',
  ];

  @override
  Widget build(BuildContext context) {
    int numFlow = context
        .select((AppMedicalAppointmentBodyCubit cubit) => cubit.state.numFlow);

    return Scaffold(
      appBar: CustomAppBar(
        title: listTitleSteps[numFlow],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MultiStepperWidget(
            currentStep: numFlow,
          ),
          const Flexible(
            child: Navigator(
              onGenerateRoute: BookPages.GenerateRouteSettings,
            ),
          ),
        ],
      ),
    );
  }
}
