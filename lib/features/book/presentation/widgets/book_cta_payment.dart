import 'package:flutter/material.dart';

class BookCtaPayment extends StatelessWidget {
  final String titlePrice;
  final String titleAction;
  final String price;
  final VoidCallback onTap;
  final bool disable;

  const BookCtaPayment({
    super.key,
    required this.titlePrice,
    required this.titleAction,
    required this.price,
    required this.onTap,
    required this.disable,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    double buttonWidth = (screenWidth - 32);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0.0, 2.0),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Total Price Row
          Row(
            children: [
              Expanded(
                child: Text(
                  titlePrice,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '$price VNĐ',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          // Buttons Row
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor:
                    disable ? null : Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                titleAction,
                style: disable
                    ? Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Theme.of(context).colorScheme.outline)
                    : Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
