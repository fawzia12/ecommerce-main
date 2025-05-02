import 'package:app/app/app_image_path.dart';
import 'package:app/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:app/features/common/widget/category_item.dart';
import 'package:app/features/home/widget/custom_avater.dart';
import 'package:app/features/home/widget/customtextfiled.dart';
import 'package:app/features/home/widget/home_carousel_slider.dart';
import 'package:app/features/common/widget/product_card.dart';
import 'package:app/features/home/widget/selection_header.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String home = '/home_screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // MainBottomNavBarController _MainBottomNavBarController =
  //Get.find<MainBottomNavBarController>(); why not create here??

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 28),
              Customtextfiled(text: "search", icons: Icons.search),
              SizedBox(height: 16),
              HomeCarouselSlider(),
              SizedBox(height: 8),
              SelectionHeader(
                text: 'Categorey',
                ontap: () {
                  Get.find<MainBottomNavBarController>().movetocategory();
                },
              ),
              SizedBox(height: 10),
              _buildCategoriesSection(),
              SizedBox(height: 10),
              SelectionHeader(text: "popular", ontap: () {}),
              SizedBox(height: 7),
              _buildProductSection(),
              SizedBox(height: 8),
              SelectionHeader(text: "spacial", ontap: () {}),
              _buildProductSection(),
              SizedBox(height: 8),
              SelectionHeader(text: "New", ontap: () {}),
              _buildProductSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [ProductCard(), ProductCard(), ProductCard(), ProductCard()],
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
          CategoryItem(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Image.asset(AppImagePath.logo, height: 859),
      actions: [
        CustomAvater(icons: Icons.person, ontap: () {}),
        SizedBox(width: 10),
        CustomAvater(icons: Icons.call, ontap: () {}),
        SizedBox(width: 10),
        CustomAvater(icons: Icons.notification_add, ontap: () {}),
      ],
    );
  }
}
