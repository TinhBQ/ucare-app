import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_doctor/app_doctor_cubit.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/doctor_get_request_model.dart';
import 'package:mobile_advanced_project_fe/features/doctor/presentation/bloc/doctor_bloc.dart';
import 'find_exam_times_item.dart';

class FindExamTimesFilter extends StatelessWidget {
  final String? departmentName;
  final String? sessionOfDayName;
  const FindExamTimesFilter({
    super.key,
    required this.departmentName,
    required this.sessionOfDayName,
  });

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return SizedBox(
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FindExamTimesItem(
              title: 'Lọc chuyên khoa',
              subtitle: departmentName ?? 'Chọn chuyên khoa khám bệnh',
              width: sizeScreen.width / 2 - 0.5,
              onTap: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.CHOOSE_DEPARTMET_PAGE, arguments: {
                  'onDepartmentSelected': (DepartmentItem item) {
                    context
                        .read<AppDoctorCubit>()
                        .updateDepartmentFilterItem(item);
                    DoctorGetRequestModel doctorGetRequestModel = context
                        .read<AppDoctorCubit>()
                        .state
                        .doctorGetRequestModel;
                    context.read<DoctorBloc>().add(
                          DoctorFindExamTimes(
                            currentPage: doctorGetRequestModel.currentPage,
                            pageSize: doctorGetRequestModel.pageSize,
                            filters: doctorGetRequestModel.filters,
                            sortField: doctorGetRequestModel.sortField,
                            sortOrder: doctorGetRequestModel.sortOrder,
                            full_name: doctorGetRequestModel.full_name,
                            session_of_day:
                                doctorGetRequestModel.session_of_day,
                          ),
                        );
                    Navigator.of(context).pop();
                  }
                });
              },
            ),
            SizedBox(
              width: 1,
              child: VerticalDivider(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            FindExamTimesItem(
              title: 'Lọc ngày khám',
              subtitle: sessionOfDayName ?? 'Chọn ngày khám bệnh',
              width: sizeScreen.width / 2 - 0.5,
              onTap: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.CHOOSE_SESSION_OF_DAY);
              },
            ),
          ],
        ),
      ),
    );
  }
}
