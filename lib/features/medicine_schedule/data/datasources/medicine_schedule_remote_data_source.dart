import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/service/database_helper.dart';
import 'package:mobile_advanced_project_fe/core/utils/local_notifications.dart';

abstract interface class MedicineScheduleRemoteDataSource {
  Future<List<MedicineSessionItem>> getMedicineSessionItems();
  Future<String> updateTimeMedicineSession(MedicineSessionItem items);
  Future<int> checkedTimeMedicineSession(MedicineSessionItem items);
}

class MedicineScheduleRemoteDataSourceImpl
    implements MedicineScheduleRemoteDataSource {
  MedicineScheduleRemoteDataSourceImpl();

  @override
  Future<List<MedicineSessionItem>> getMedicineSessionItems() async {
    try {
      List<Map<String, dynamic>> medicineScheduleData = await DatabaseHelper()
          .retrieveData(DatabaseHelperTableNames.medicineSchedule);

      return MedicineSessionItem.medicineSessionItemsFromJson(
          medicineScheduleData);
    } catch (e) {
      throw ServerException(ServerException.GET_DEPARTMENT_FAILURE);
    }
  }

  @override
  Future<String> updateTimeMedicineSession(MedicineSessionItem items) async {
    try {
      await DatabaseHelper().updateData(
        items.toUpdateTimeOfDateJson(),
        DatabaseHelperTableNames.medicineSchedule,
        items.id,
      );

      return '';
    } catch (e) {
      throw ServerException(ServerException.GET_DEPARTMENT_FAILURE);
    }
  }

  @override
  Future<int> checkedTimeMedicineSession(MedicineSessionItem items) async {
    try {
      await DatabaseHelper().updateData(
        items.toCheckedJson(),
        DatabaseHelperTableNames.medicineSchedule,
        items.id,
      );

      if (items.isActived == 1) {
        LocalNotifications.scheduleRepeatingNotification(
          title: "Schedule Notification",
          body: "This is a Schedule Notification",
          payload: "This is schedule data",
          hour: items.hour,
          minute: items.minute,
          numRepeat: 10,
          id: items.id,
        );
      }

      if (items.isActived == 0) {
        LocalNotifications.cancelScheduleRepeatingNotification(
          id: items.id,
        );
      }

      return items.isActived;
    } catch (e) {
      throw ServerException(ServerException.GET_DEPARTMENT_FAILURE);
    }
  }
}
