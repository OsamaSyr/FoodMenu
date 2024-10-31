import 'package:flutter/material.dart';

class MyLocation extends StatelessWidget {
  const MyLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0, top: 8, bottom: 8),
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.05,
          decoration: BoxDecoration(
              color: const Color.fromARGB(137, 237, 227, 234),
              borderRadius: BorderRadius.circular(10)),
          child: const Row(
            children: [
              Icon(
                Icons.motorcycle,
                color: Color.fromARGB(255, 246, 33, 90),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Color.fromARGB(255, 246, 33, 90),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'RHYA3969, 3696 Al Imam Saud Ibn Abdulaziz road',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
