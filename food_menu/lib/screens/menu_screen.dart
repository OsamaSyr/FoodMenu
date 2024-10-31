import 'package:flutter/material.dart';
import 'package:food_menu/fake_dishes.dart';
import 'package:food_menu/screens/dish_screen.dart';
import 'package:food_menu/widgets/menu_screen_wigets/custom_app_bar_widget.dart';
import 'package:food_menu/widgets/menu_screen_wigets/banner_image_list_widget.dart';
import 'package:food_menu/widgets/menu_screen_wigets/food_item_widget.dart';
import 'package:food_menu/widgets/menu_screen_wigets/my_location_widget.dart';

List<List<FoodItem>> _fakeFoodMenu = [
  ramadanDealsfoodItems,
  mainDishesfoodItems,
  sideDishesfoodItems,
  drinks
];

final List<String> tabs = [
  'Ramadan deals',
  'Main dishes',
  'Side dishes',
  'Drinks'
];

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar(),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: TabBar(
        tabAlignment: TabAlignment.center,
        indicator: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.pink, width: 3),
          ),
        ),
        controller: _tabController,
        labelColor: Colors.pink,
        isScrollable: true,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.pink,
        tabs: List.generate(tabs.length, (index) {
          return Tab(
            height: MediaQuery.sizeOf(context).width * 0.14,
            child: Text(
              tabs[index],
              maxLines: 1,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          );
        }),
      ),
      body: Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BannerImagesList(),
              const MyLocation(),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: List.generate(
                    _tabController.length,
                    (index) {
                      return SingleChildScrollView(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _fakeFoodMenu[_tabController.index].length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return DishScreen(
                                      name: _fakeFoodMenu[_tabController.index]
                                              [index]
                                          .title,
                                      description:
                                          _fakeFoodMenu[_tabController.index]
                                                  [index]
                                              .description,
                                      calories: 400,
                                      imageAsset:
                                          _fakeFoodMenu[_tabController.index]
                                                  [index]
                                              .asset,
                                      price: _fakeFoodMenu[_tabController.index]
                                              [index]
                                          .price,
                                      quantity: 1);
                                },
                              ));
                            },
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 7),
                                child: _fakeFoodMenu[_tabController.index]
                                    [index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
