import 'package:app/features/product/widget/ProductQuantityCounter.dart';
import 'package:app/features/product/widget/product_carsoul_slider.dart';
import 'package:app/features/product/widget/product_color.dart';

import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static String home = '/product_details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: Column(
        children: [
          const Producrcursolslider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  const SizedBox(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Text(
                          'Next your project\n50% discount',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Productquantitycounter(
                        onChange: (int newQuantity) {
                          // handle the quantity change
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star),
                      Text(
                        "4.2",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Reviews",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_outline_rounded,
                          size: 27,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Color",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ProductColor(
                    ontap: (Color) {},
                    colors: ['Red', 'green', 'Blue'],
                  ),
                ],
              ),
            ),
          ),
          priceaddtocart(),
        ],
      ),
    );
  }

  Widget priceaddtocart() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 28),
      decoration: BoxDecoration(
        color: Colors.tealAccent[100],
        borderRadius: BorderRadius.circular(15),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Price\n \$1000",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "add to cart ",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
