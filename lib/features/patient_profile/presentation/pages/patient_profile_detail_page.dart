import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';
import 'package:mobile_advanced_project_fe/features/patient/presentation/bloc/patient_bloc.dart';
import 'package:mobile_advanced_project_fe/features/patient_profile/presentation/widgets/widgets.dart';

class PatientProfileDetailPage extends StatefulWidget {
  const PatientProfileDetailPage({
    super.key,
    required this.patientItem,
  });
  final PatientItem patientItem;
  @override
  State<StatefulWidget> createState() => _PatientProfileDetailPageState();
}

class _PatientProfileDetailPageState extends State<PatientProfileDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<PatientBloc, PatientState>(
      listener: (context, state) {
        if (state is PatientLoading) {
          LoadingOverlay.showLoading(context);
        }
        if (state is PatientFailure) {
          LoadingOverlay.dismissLoading();
          ShowSnackBar.error(state.message, context);
        }
        if (state is PatientSuccess) {
          if (state.onPatientEvent == OnPatientEvent.onPatientDeleteProfile) {
            context.read<PatientBloc>().add(const PatientGetList());
            ShowSnackBar.success(state.message, context);
          }

          if (state.onPatientEvent == OnPatientEvent.onPatientGetList) {
            Navigator.of(context).pop();
          }
          LoadingOverlay.dismissLoading();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const CustomSubAppBar(
          title: 'Hồ sơ người bệnh',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 8,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  4.0,
                ),
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.account_circle_rounded,
                              size: 36,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Thông tin người bệnh',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontSize: 20,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            ShowDialog.confirm(
                              context,
                              title:
                                  'Xác nhận xóa liên kết hồ sơ khỏi tài khoản',
                              callback: () {
                                context.read<PatientBloc>().add(
                                      PatientDeleteProfile(
                                          patient_id: widget.patientItem.id),
                                    );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.delete_forever_outlined,
                            size: 32,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    PatientProfileDetailItem(
                      label: 'Họ và tên',
                      content:
                          '${widget.patientItem.last_name} ${widget.patientItem.first_name}',
                    ),
                    const Line(),
                    PatientProfileDetailItem(
                      label: 'Ngày sinh',
                      content: widget.patientItem.birthday,
                    ),
                    const Line(),
                    PatientProfileDetailItem(
                      label: 'Giới tính',
                      content: widget.patientItem.male ? 'Nam' : 'Nữ',
                    ),
                    const Line(),
                    PatientProfileDetailItem(
                      label: 'CMND/Passport',
                      content: widget.patientItem.citizen_id,
                    ),
                    const Line(),
                    PatientProfileDetailItem(
                      label: 'Quốc gia',
                      content: widget.patientItem.nation,
                    ),
                    const Line(),
                    PatientProfileDetailItem(
                      label: 'Nghệ nghiệp',
                      content: widget.patientItem.job,
                    ),
                    const Line(),
                    PatientProfileDetailItem(
                      label: 'Số điện thoại',
                      content: widget.patientItem.phone,
                    ),
                    const Line(),
                    PatientProfileDetailItem(
                      label: 'Email',
                      content: widget.patientItem.email,
                    ),
                    const Line(),
                    PatientProfileDetailItem(
                      label: 'Địa chỉ',
                      content:
                          '${widget.patientItem.address}, ${widget.patientItem.wards}, ${widget.patientItem.district}, ${widget.patientItem.province}',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
