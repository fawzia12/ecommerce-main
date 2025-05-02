import 'package:app/app/app_image_path.dart';
import 'package:app/features/product/screen/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.home);
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: Colors.white,

        child: SizedBox(
          width: 160,

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Blue container with an image
              Container(
                height: 119,
                width: 199.3,
                decoration: BoxDecoration(
                  color: Colors.blue, // Blue background
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                    image: AssetImage(
                      AppImagePath.mac,
                    ), // Replace with your image
                  ),
                ),
              ),
              SizedBox(height: 2),
              Column(
                children: [
                  SizedBox(height: 5),
                  Text(
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    'Product Name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '100\$',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Wrap(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 16),
                          Text(
                            ' 3.5',
                            style: TextStyle(
                              fontSize: 16,

                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_outline_rounded,
                          size: 20,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
