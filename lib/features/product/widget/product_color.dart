import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class ProductColor extends StatefulWidget {
  ProductColor({super.key, required this.ontap, required this.colors});
  final List<String> colors;

  final Function(String) ontap;
  @override
  State<ProductColor> createState() => _ProductColorState();
}

class _ProductColorState extends State<ProductColor> {
  String? selectcolor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.colors.length,
        itemBuilder: (context, index) {
          String color = widget.colors[index];

          return GestureDetector(
            onTap: () {
              selectcolor = color;
              widget.ontap(selectcolor!);
              setState(() {});
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(color),
              height: 30,

              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                color: selectcolor == color ? Colors.amber : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
