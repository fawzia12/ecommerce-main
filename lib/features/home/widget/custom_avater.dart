import 'package:flutter/material.dart';
class CustomAvater extends StatelessWidget {
  const CustomAvater({super.key, required this.icons, required this.ontap});
final IconData icons;
final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(child: IconButton(onPressed: ontap, icon: Icon(icons)));
  }
}