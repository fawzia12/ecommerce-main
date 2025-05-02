import 'package:app/app/app_routes.dart';
import 'package:app/app/controller_binder.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class Coderx extends StatelessWidget {
  const Coderx({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
             
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
               errorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
        )
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialBinding: ControllerBinder(),
    );
  }
}
