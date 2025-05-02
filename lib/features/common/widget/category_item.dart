import 'package:app/features/product/screen/product_list_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductListScreen.home,
          arguments: 'Elactronics',
        );
      },
      child: Column(
        children: [
          Card(
            color: Colors.lightBlueAccent[100],
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(Icons.computer, size: 43, color: Colors.blue),
            ),
          ),
          Text('Computer'),
        ],
      ),
    );
  }
}
