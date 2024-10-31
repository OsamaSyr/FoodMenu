import 'package:flutter/material.dart';

class AddToBagButton extends StatelessWidget {
  const AddToBagButton(
      {super.key, required this.price, required this.quantity});

  final double price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // action when button is pressed
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Add to bag',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 20.0),
            Text(
              'SAR ${price * quantity}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
