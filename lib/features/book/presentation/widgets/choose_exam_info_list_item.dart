// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_choose_exam_info/app_choose_exam_info_cubit.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

import 'choose_exam_info_item.dart';

class ChooseExamInfoListItem extends StatelessWidget {
  final List<InfoMedicalItem> listInfoMedicalItems;

  const ChooseExamInfoListItem({
    super.key,
    required this.listInfoMedicalItems,
  });

  @override
  Widget build(BuildContext context) {
    final String department_id = context.select(
        (AppChooseExamInfoCubit bloc) => bloc.state.listInfoMedicalItem[0].id);

    final String day = context.select((AppChooseExamInfoCubit bloc) =>
        bloc.state.listInfoMedicalItem[1].value);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          ...listInfoMedicalItems.map((item) => ChooseExamInfoItem(
                value: item.value,
                icon: getIcon(item.strIcon),
                title: item.title,
                disable: item.disabled,
                onTap: () {
                  if (item.path == BookRoutes.BOOK_CHOOSE_DEPARTMET_PAGE) {
                    Navigator.of(context).pushNamed(item.path, arguments: {
                      'onDepartmentSelected': (DepartmentItem department) {
                        context.read<AppChooseExamInfoCubit>().updateValue(
                              item.numStep,
                              value: department.name,
                              id: department.id,
                              price: department.service_charge,
                            );
                        Navigator.of(context).pop();
                      }
                    });
                  } else if (item.path ==
                      BookRoutes.BOOK_CHOOSE_DATE_MEDICAL_PAGE) {
                    Navigator.of(context).pushNamed(item.path, arguments: {
                      'onDateMedicalPageSelected': (DateTime dateTime) {
                        context.read<AppChooseExamInfoCubit>().updateValue(
                              item.numStep,
                              value: UCARETimeZone.fDate(dateTime),
                            );
                        Navigator.of(context).pop();
                      }
                    });
                  } else if (item.path ==
                      BookRoutes.BOOK_CHOOSE_DOCTOR_EXAM_PAGE) {
                    Navigator.of(context).pushNamed(item.path, arguments: {
                      'department_id': department_id,
                      'day': UCARETimeZone.fDateInput(
                        day,
                      ),
                      'onChooseDoctorExamPage': (ScheduleItem schedule) {
                        context.read<AppChooseExamInfoCubit>().updateValue(
                              item.numStep,
                              id: schedule.schedule_id,
                              value: schedule.doctor.name ?? "",
                              scheduleItem: schedule,
                            );
                        Navigator.of(context).pop();
                      }
                    });
                  } else {
                    Navigator.of(context).pushNamed(item.path);
                  }
                },
              ))
        ],
      ),
    );
  }
}
