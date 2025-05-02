import 'package:app/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:app/features/common/widget/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class Categorylist extends StatefulWidget {
  const Categorylist({super.key});
  static String home = "category";
  @override
  State<Categorylist> createState() => _CategorylistState();
}

class _CategorylistState extends State<Categorylist> {
  @override
  Widget build(BuildContext context) {
    // 2 /3 not create instance
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Category'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().backscreen();
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),

        body: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return FittedBox(child: CategoryItem());
          },
        ),
      ),
    );
  }
}
