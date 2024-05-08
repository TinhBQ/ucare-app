// ignore_for_file: non_constant_identifier_names

part of "order_request_model_dependencies.dart";

class OrderRequestItem {
  final String payment_id;
  final String patient_id;
  final List<String> schedule;
  final String sum;
  final String description;

  OrderRequestItem({
    required this.payment_id,
    required this.patient_id,
    required this.schedule,
    required this.sum,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
        "payment_id": payment_id,
        "patient_id": patient_id,
        "schedule": schedule,
        "sum": sum,
        "description": description,
      };

  Map<String, dynamic> toJsonLocal() => {
        "payment_id": payment_id,
        "patient_id": patient_id,
        "schedule": schedule[0].toString(),
        "sum": sum,
      };

  factory OrderRequestItem.fromJson(Map<String, dynamic> json) {
    return OrderRequestItem(
      payment_id: json['payment_id'],
      patient_id: json['patient_id'],
      schedule: [
        json['schedule'],
      ],
      sum: json['sum'],
      description: json['description'],
    );
  }

  static List<OrderRequestItem> orderRequestItemsFromJson(
      List<Map<String, dynamic>> jsons) {
    return jsons.map((json) => OrderRequestItem.fromJson(json)).toList();
  }

  OrderRequestItem copyWith({
    String? id,
    String? payment_id,
    String? patient_id,
    List<String>? schedule,
    String? sum,
    String? description,
  }) {
    return OrderRequestItem(
      payment_id: payment_id ?? this.payment_id,
      patient_id: patient_id ?? this.patient_id,
      schedule: schedule ?? this.schedule,
      sum: sum ?? this.sum,
      description: description ?? this.description,
    );
  }
}

class OrderDescription {
  final String type;
  final int totalPrice;
  final List<OrderDescriptionSchedule> schedules;

  OrderDescription({
    required this.type,
    required this.totalPrice,
    required this.schedules,
  });

  Map<String, dynamic> toJson() => {
        "type": type,
        "totalPrice": totalPrice,
        "schedules": schedules
            .map(
              (item) => item.toJson(),
            )
            .toList(),
      };

  factory OrderDescription.fromJson(Map<String, dynamic> json) {
    return OrderDescription(
      type: json['type'],
      totalPrice: json['totalPrice'],
      schedules: List<OrderDescriptionSchedule>.from(
        json['schedules'].map(
          (item) => OrderDescriptionSchedule.fromJson(item),
        ),
      ),
    );
  }
}

class OrderDescriptionSchedule {
  final String id;
  final String doctorName;
  final String roomName;
  final String day;
  final String session;
  final String department;

  OrderDescriptionSchedule({
    required this.id,
    required this.doctorName,
    required this.roomName,
    required this.day,
    required this.session,
    required this.department,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctorName": doctorName,
        "roomName": roomName,
        "day": day,
        "department": department,
        "session": session,
      };

  factory OrderDescriptionSchedule.fromJson(Map<String, dynamic> json) {
    return OrderDescriptionSchedule(
      id: json['id'],
      doctorName: json['doctorName'],
      roomName: json['roomName'],
      day: json['day'],
      session: json['session'],
      department: json['department'],
    );
  }
}

class OrderRequestModel {
  final List<OrderRequestItem> orderRequestItems;

  OrderRequestModel({
    required this.orderRequestItems,
  });

  List<Map<String, dynamic>> toJson() =>
      orderRequestItems.map((item) => item.toJson()).toList();

  OrderRequestModel copyWith({
    List<OrderRequestItem>? orderRequestItems,
  }) {
    return OrderRequestModel(
      orderRequestItems: orderRequestItems ?? this.orderRequestItems,
    );
  }
}
