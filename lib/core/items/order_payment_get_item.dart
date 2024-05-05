import '../utils/convert_to_int.dart';
import 'base_get_item.dart';
import 'payment_item.dart';

class OrderPaymentGetItem extends BaseGetItem<PaymentItem> {
  OrderPaymentGetItem({
    required super.count,
    required super.rows,
    required super.totalPages,
    required super.currentPage,
  });

  factory OrderPaymentGetItem.fromJson(Map<String, dynamic> json) {
    return OrderPaymentGetItem(
      count: convertToInt(json['count']) ?? 0,
      rows: List<PaymentItem>.from(
        json['rows'].map(
          (item) => PaymentItem.fromJson(item),
        ),
      ),
      totalPages: convertToInt(json['totalPages']) ?? 0,
      currentPage: convertToInt(json['currentPage']) ?? 0,
    );
  }

  OrderPaymentGetItem copyWith({
    int? count,
    List<PaymentItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return OrderPaymentGetItem(
      count: count ?? this.count,
      rows: rows ?? this.rows,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  OrderPaymentGetItem copyWithAddRow({
    int? count,
    List<PaymentItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return OrderPaymentGetItem(
      count: count ?? this.count,
      rows: rows == null ? this.rows : [...this.rows, ...rows],
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
