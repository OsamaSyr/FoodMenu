import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector(
      {super.key,
      required this.quantity,
      required this.decrement,
      required this.increment});
  final int quantity;
  final Function() decrement;
  final Function() increment;

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              widget.decrement();
            },
            icon: const Icon(Icons.remove, color: Colors.pink),
          ),
          Text(
            '${widget.quantity}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () {
              widget.increment();
            },
            icon: const Icon(Icons.add, color: Colors.pink),
          ),
        ],
      ),
    );
  }
}
