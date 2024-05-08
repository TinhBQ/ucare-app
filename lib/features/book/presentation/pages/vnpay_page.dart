import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_choose_exam_info/app_choose_exam_info_cubit.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';
import 'package:mobile_advanced_project_fe/features/patient/presentation/bloc/patient_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VnpayPage extends StatelessWidget {
  final String link;

  const VnpayPage({
    super.key,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    final ScheduleItem? scheduleItem = context
        .select((AppChooseExamInfoCubit cubit) => cubit.state.scheduleItem);

    final String? patientId =
        context.select((AppChooseExamInfoCubit cubit) => cubit.state.patientId);

    return BlocListener<PatientBloc, PatientState>(
      listener: (context, state) {
        if (state is PatientLoading) {
          LoadingOverlay.showLoading(context);
        }

        if (state is PatientFailure) {
          ShowSnackBar.error(state.message, context);
          Navigator.of(context)
              .pushReplacementNamed(BookRoutes.BOOK_PATIENT_CHOOSE_PROFILE);
          LoadingOverlay.dismissLoading();
        }

        if (state is PatientSuccess) {
          if (state.onPatientEvent == OnPatientEvent.onPatientBookSchedule) {
            context.read<AppChooseExamInfoCubit>().updateInitial();
            Navigator.of(context)
                .pushReplacementNamed(BookRoutes.BOOK_PATIENT_CHOOSE_PROFILE);
          }

          LoadingOverlay.dismissLoading();
        }
      },
      child: Scaffold(
        body: WebViewWidget(
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {
                  // Update loading bar.
                },
                onPageStarted: (String url) {},
                onPageFinished: (String url) {},
                onWebResourceError: (WebResourceError error) {},
                onNavigationRequest: (NavigationRequest request) {
                  if (request.url.startsWith('https://online.hcmute.edu.vn/')) {
                    ShowSnackBar.success('Thanh toán thành công', context);
                    context.read<PatientBloc>().add(PatientBookSchedule(
                          patient_id: patientId ?? '',
                          schedule_id: scheduleItem?.schedule_id ?? '',
                        ));

                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
              ),
            )
            ..loadRequest(
              Uri.parse(link),
            ),
        ),
      ),
    );
  }
}
