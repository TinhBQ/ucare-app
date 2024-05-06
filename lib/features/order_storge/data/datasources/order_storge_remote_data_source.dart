import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/service/service_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

abstract interface class OrderStorgeRemoteDataSource {
  Future<List<OrderRequestItem>> getOrderRequest();
  Future<String> createOrderRequest(OrderRequestItem item);
  Future<String> updateOrderRequest(OrderRequestItem item);

  Future<String> updateTimeMedicineSession(MedicineSessionItem items);
  Future<int> checkedTimeMedicineSession(MedicineSessionItem items);
}

class OrderStorgeRemoteDataSourceImpl implements OrderStorgeRemoteDataSource {
  OrderStorgeRemoteDataSourceImpl();

  @override
  Future<List<OrderRequestItem>> getOrderRequest() async {
    try {
      List<Map<String, dynamic>> orderRequestItems = await DatabaseHelper()
          .retrieveData(DatabaseHelperTableNames.orderRequest);

      return OrderRequestItem.orderRequestItemsFromJson(orderRequestItems);
    } catch (e) {
      throw ServerException(ServerException.GET_DEPARTMENT_FAILURE);
    }
  }

  @override
  Future<String> createOrderRequest(OrderRequestItem item) async {
    try {
      await DatabaseHelper().insertData(
        item.toJsonLocal(),
        DatabaseHelperTableNames.orderRequest,
      );

      return '';
    } catch (e) {
      throw ServerException(ServerException.GET_DEPARTMENT_FAILURE);
    }
  }

  @override
  Future<String> updateOrderRequest(OrderRequestItem item) async {
    try {
      if (item.id == null) {
        throw ServerException(ServerException.GET_DEPARTMENT_FAILURE);
      }

      await DatabaseHelper().updateData(
        item.toJsonLocal(),
        DatabaseHelperTableNames.orderRequest,
        item.id as int,
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
          numRepeat: 25,
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

  @override
  Future<String> updateTimeMedicineSession(MedicineSessionItem items) {
    // TODO: implement updateTimeMedicineSession
    throw UnimplementedError();
  }
}
