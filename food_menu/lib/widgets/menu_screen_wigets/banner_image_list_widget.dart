import 'package:flutter/material.dart';
import 'package:food_menu/widgets/menu_screen_wigets/banner_image_widget.dart';

class BannerImagesList extends StatelessWidget {
  const BannerImagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 180),
      child: const CarouselView(itemExtent: 370, shrinkExtent: 370, children: [
        BannerImage(),
        BannerImage(),
        BannerImage(),
      ]),
    );
  }
}
