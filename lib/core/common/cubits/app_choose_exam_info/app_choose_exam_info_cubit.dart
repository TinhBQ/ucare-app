import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:mobile_advanced_project_fe/core/entities/entities.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';

part 'app_choose_exam_info_state.dart';

class AppChooseExamInfoCubit extends Cubit<AppChooseExamInfoState> {
  AppChooseExamInfoCubit()
      : super(
          AppChooseExamInfoInitial(),
        );

  void updateInitial() {
    emit(AppChooseExamInfoInitial());
  }

  void updateValue(
    int numStep, {
    required String value,
    String? id,
    int? price,
    SessionOfDayEntity? section,
  }) {
    emit(
      AppChooseExamInfoLoaded(
        listInfoMedicalItem: state.listInfoMedicalItem.map(
          (item) {
            // numStep hiện tại
            if (item.numStep == numStep) {
              return item.copyWith(
                value: value,
                id: id ?? "",
              );
            }

            if (item.numStep == numStep + 1 &&
                numStep < state.listInfoMedicalItem.length) {
              if (numStep < 1) {
                return item.copyWith(
                  disabled: false,
                );
              }
              return item.copyWith(
                disabled: false,
                value: '',
                id: '',
              );
            }

            if (item.numStep >= numStep + 1 &&
                numStep < state.listInfoMedicalItem.length &&
                numStep > 1) {
              return item.copyWith(
                disabled: true,
                value: '',
                id: '',
              );
            }

            return item;
          },
        ).toList(),
        price: numStep == 0 ? price : state.price,
        numFlow: 1,
        section: numStep == 2 ? section : null,
        patientId: state.patientId,
      ),
    );
  }

  void updatePatientId(String id) {
    emit(
      AppChooseExamInfoLoaded(
        listInfoMedicalItem: state.listInfoMedicalItem,
        price: state.price,
        patientId: id,
        numFlow: 1,
        section: null,
      ),
    );
  }

  void nextStep(int id) {
    emit(
      AppChooseExamInfoLoaded(
        listInfoMedicalItem: state.listInfoMedicalItem,
        price: state.price,
        patientId: state.patientId,
        numFlow: id,
        section: state.section,
      ),
    );
  }
}
