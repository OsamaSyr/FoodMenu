import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  const FoodItem(
      {super.key,
      required this.asset,
      required this.title,
      required this.description,
      required this.price});
  final String asset;
  final String title;
  final String description;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
              height: MediaQuery.sizeOf(context).height * 0.1,
              width: MediaQuery.sizeOf(context).width * 0.25,
              fit: BoxFit.fill,
              asset),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  style: const TextStyle(fontSize: 10),
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SAR $price',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 246, 33, 90)),
                    ),
                    GestureDetector(
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(11, 246, 33, 90),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8),
                          child: Center(
                            child: Text(
                              'Add to cart',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 246, 33, 90)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
