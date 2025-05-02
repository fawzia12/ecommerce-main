import 'package:app/features/common/widget/product_card.dart';
import 'package:flutter/material.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});
  static String home = '/wishlist';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wishlist')),
      body: GridView.builder(
        itemCount: 30,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 0,
        ),
        itemBuilder: (context, index) {
          return FittedBox(child: ProductCard());
        },
      ),
    );
  }
}
