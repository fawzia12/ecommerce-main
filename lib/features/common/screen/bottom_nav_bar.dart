import 'package:app/features/categories/screen/category_list.dart';
import 'package:app/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:app/features/home/screen/home_screen.dart';
import 'package:app/features/wishlist/wish_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  static const String home = '/nav_bar';
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  MainBottomNavBarController _MainBottomNavBarController =
      Get.find<MainBottomNavBarController>();
  final List<Widget> _screens = [
    HomeScreen(),
    Categorylist(),
    HomeScreen(),
    WishList(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavBarController>(
        builder: (controller) {
          return _screens[controller.selectindex];
        },
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavBarController>(
        builder: (controller) {
          return NavigationBar(
            selectedIndex: controller.selectindex,
            onDestinationSelected: controller.changevalue,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'home'),

              NavigationDestination(
                icon: Icon(Icons.category),
                label: 'Category',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart),
                label: 'shopcart',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite),
                label: 'favorite',
              ),
            ],
          );
        },
      ),
    );
  }
}
