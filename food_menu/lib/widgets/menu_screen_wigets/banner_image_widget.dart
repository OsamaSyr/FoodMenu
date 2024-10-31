import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  const BannerImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset(
        'assets/images/image.png',
      ),
    );
  }
}
