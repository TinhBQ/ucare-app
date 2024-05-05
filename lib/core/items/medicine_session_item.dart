part of 'item_dependencies.dart';

class MedicineSessionItem extends MedicineSessionEntity {
  MedicineSessionItem({
    required super.id,
    required super.session,
    required super.icon,
    required super.isActived,
    required super.hour,
    required super.minute,
  });

  factory MedicineSessionItem.fromJson(Map<String, dynamic> json) {
    return MedicineSessionItem(
      id: json['id'],
      session: json['session'],
      icon: json['icon'],
      isActived: json['isActived'],
      hour: json['hour'],
      minute: json['minute'],
    );
  }

  static List<MedicineSessionItem> medicineSessionItemsFromJson(
      List<Map<String, dynamic>> jsons) {
    return jsons.map((json) => MedicineSessionItem.fromJson(json)).toList();
  }

  MedicineSessionItem copyWith({
    String? session,
    String? icon,
    int? isActived,
    int? hour,
    int? minute,
  }) {
    return MedicineSessionItem(
      id: id,
      session: session ?? this.session,
      icon: icon ?? this.icon,
      isActived: isActived ?? this.isActived,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'session': session,
      'icon': icon,
      'isActived': isActived,
      'hour': hour,
      'minute': minute,
    };
  }

  Map<String, dynamic> toUpdateTimeOfDateJson() {
    return {
      'hour': hour,
      'minute': minute,
    };
  }

  Map<String, dynamic> toCheckedJson() {
    return {
      'isActived': isActived,
    };
  }
}


// class MedicineSessionItem {
//   final String session;
//   final IconData icon;
//   final bool isActived;
//   final Function(bool) onChangedActive;
//   final TimeOfDay time;
//   final VoidCallback onChangedTime;
  
//   MedicineSessionItem({
//     required this.session,
//     required this.icon,
//     required this.isActived,
//     required this.onChangedActive,
//     required this.time,
//     required this.onChangedTime
//   });

// }