import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Menu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.shopping_bag)),
        const Padding(
            padding: EdgeInsets.only(right: 20), child: Icon(Icons.search)),
        Container(
          height: 30,
          width: 30,
          decoration: const BoxDecoration(
              color: Color(0xFFFFDBD7), shape: BoxShape.circle),
          child: const Center(
            child: Text(
              'TA',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
