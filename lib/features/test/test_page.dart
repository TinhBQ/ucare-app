import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String chuyenKhoa;
  final String ngayKham;
  final String gioKham;
  final String phiTamThu;

  const CartItem({
    super.key,
    required this.chuyenKhoa,
    required this.ngayKham,
    required this.gioKham,
    required this.phiTamThu,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      child: IntrinsicHeight(
        child: Card(
          shape: RoundedRectangleBorder(
            // Đặt hình dáng của card để thêm viền
            borderRadius: BorderRadius.circular(10.0), // Đặt góc cong cho viền
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.8,
            ), // Đặt màu và độ rộng của viền
          ),
          color: Colors.white.withOpacity(1),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Chuyên khoa:',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      chuyenKhoa,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Ngày khám:',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      ngayKham,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Giờ khám:',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      gioKham,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Phí khám tạm thu:',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      phiTamThu,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
