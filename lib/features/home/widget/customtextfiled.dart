import 'package:flutter/material.dart';

class Customtextfiled extends StatelessWidget {
  String? text;
IconData?icons;
  Customtextfiled({super.key, required this.text,this.icons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
         prefixIcon:Icon(icons) ,
          hintText: text,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
          
          ),
          // enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
