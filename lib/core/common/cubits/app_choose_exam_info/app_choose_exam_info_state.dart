part of 'app_choose_exam_info_cubit.dart';

sealed class AppChooseExamInfoState extends Equatable {
  final List<InfoMedicalItem> listInfoMedicalItem;
  final int? price;
  final String? patientId;
  final int numFlow;
  final SessionOfDayEntity? section;

  const AppChooseExamInfoState({
    required this.listInfoMedicalItem,
    this.price,
    this.patientId,
    required this.numFlow,
    this.section,
  });

  @override
  List<Object?> get props => [
        listInfoMedicalItem,
        price,
        patientId,
        numFlow,
        section,
      ];
}

final class AppChooseExamInfoInitial extends AppChooseExamInfoState {
  AppChooseExamInfoInitial()
      : super(
          listInfoMedicalItem: [
            InfoMedicalItem(
              title: 'Chuyên khoa',
              strIcon: 'local_hospital_outlined',
              path: BookRoutes.BOOK_CHOOSE_DEPARTMET_PAGE,
              value: '',
              numStep: 0,
            ),
            InfoMedicalItem(
              title: 'Ngày khám',
              strIcon: 'date_range_outlined',
              path: BookRoutes.BOOK_CHOOSE_DATE_MEDICAL_PAGE,
              value: '',
              disabled: true,
              numStep: 1,
            ),
            InfoMedicalItem(
              title: 'Bác sĩ',
              strIcon: 'medical_services_outlined',
              path: BookRoutes.BOOK_CHOOSE_DOCTOR_EXAM_PAGE,
              value: '',
              disabled: true,
              numStep: 2,
            ),
          ],
          price: 0,
          patientId: '',
          numFlow: 0,
          section: null,
        );

  @override
  List<Object?> get props => [
        listInfoMedicalItem,
        price,
        patientId,
        numFlow,
        section,
      ];
}

final class AppChooseExamInfoLoaded extends AppChooseExamInfoState {
  const AppChooseExamInfoLoaded({
    required super.listInfoMedicalItem,
    super.price,
    super.patientId,
    required super.numFlow,
    super.section,
  });

  @override
  List<Object?> get props => [
        listInfoMedicalItem,
        price,
        patientId,
        numFlow,
        section,
      ];
}
