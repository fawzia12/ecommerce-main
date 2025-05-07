import 'package:app/features/auth/screen/otp_screen.dart';
import 'package:app/features/auth/screen/sign_in_screen.dart';
import 'package:app/features/auth/screen/sign_up_screen.dart';

import 'package:app/features/auth/screen/splash_screen.dart';

import 'package:app/features/common/screen/bottom_nav_bar.dart';
import 'package:app/features/product/screen/product_details_screen.dart';
import 'package:app/features/product/screen/product_list_screen.dart';
import 'package:app/features/wishlist/wish_list.dart';

import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    late Widget route;
    if (settings.name == SplashScreen.home) {
      route = SplashScreen();
    } else if (settings.name == SignInScreen.home) {
      route = SignInScreen();
    } else if (settings.name == SignUpScreen.home) {
      route = SignUpScreen();
    } else if (settings.name == BottomNavBar.home) {
      route = BottomNavBar();
    } else if (settings.name == ProductListScreen.home) {
      final String category = settings.arguments as String;
      route = ProductListScreen(category: category);
    } else if (settings.name == WishList.home) {
      route = WishList();
    } else if (settings.name == ProductDetailsScreen.home) {
      route = ProductDetailsScreen();
    } else if (settings.name == OtpScreen.home) {
      route = OtpScreen();
    }

    return MaterialPageRoute(
      builder: (context) {
        return route;
      },
    );
  }
}
