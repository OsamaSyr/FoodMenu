import 'package:flutter/material.dart';
import 'package:food_menu/widgets/dish_screen_widgets/add_to_bag_button_widget.dart';
import 'package:food_menu/widgets/dish_screen_widgets/quantity_selection_widget.dart';
import 'package:food_menu/widgets/dish_screen_widgets/select_additions_widget.dart';
import 'package:food_menu/widgets/dish_screen_widgets/select_size_widget.dart';

class DishScreen extends StatefulWidget {
  const DishScreen(
      {super.key,
      required this.name,
      required this.description,
      required this.calories,
      required this.imageAsset,
      required this.price,
      required this.quantity});

  final String name;
  final String description;
  final int calories;
  final String imageAsset;
  final double price;
  final int quantity;

  @override
  State<DishScreen> createState() => _DishScreenState();
}

class _DishScreenState extends State<DishScreen> {
  int selectedSizeInt = 0;
  List<Map<String, double>> additions = [
    {'Herbs': 1.00},
    {'Checken': 5.00},
    {'Egg': 5.00}
  ];
  bool _hasHerbs = false;
  bool _hasChecken = true;
  bool _hasEgg = true;
  int quantity = 1;

  void _selectSize(int value) {
    setState(() {
      selectedSizeInt = value;
    });
  }

  void _changeQuantity(value) {
    setState(() {
      quantity = value;
    });
  }

  void _selectAdditions(bool hasHerbs, bool hasChecken, bool hasEgg) {
    setState(() {
      _hasHerbs = hasHerbs;
      _hasChecken = hasChecken;
      _hasEgg = hasEgg;
    });
  }

  void _increment() {
    setState(() {
      quantity++;
    });
  }

  void _decrement() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        widget.name,
        style: const TextStyle(fontSize: 18),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.imageAsset),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.description,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${widget.calories} Calories',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            SelectSizeWidget(
              selectedSizeInt: selectedSizeInt,
              onTap: _selectSize,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            SelectAdditionsWidget(
                selectAdditions: _selectAdditions,
                hasHerbs: _hasHerbs,
                hasChecken: _hasChecken,
                hasEgg: _hasEgg,
                additions: additions,
                onTap: (int v) {}),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 12),
                        hintText: 'Add a note'),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  QuantitySelector(
                    decrement: () {
                      _decrement();
                    },
                    increment: () {
                      _increment();
                    },
                    quantity: quantity,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddToBagButton(
                    price: widget.price,
                    quantity: quantity,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
