import 'package:easy_stock_app/controllers/admin/product/product_provider.dart';
import 'package:easy_stock_app/controllers/auth_provider/auth_provider.dart';
import 'package:easy_stock_app/controllers/splash_provider/splash_provider.dart';
import 'package:easy_stock_app/views/admin/categories/add_category/add_category_page.dart';
import 'package:easy_stock_app/views/admin/categories/category_page.dart';
import 'package:easy_stock_app/views/admin/home/homepage.dart';
import 'package:easy_stock_app/views/admin/product/add_product/add_product_page.dart';
import 'package:easy_stock_app/views/admin/product/product_page.dart';
import 'package:easy_stock_app/views/signIn/signinPage.dart';
import 'package:easy_stock_app/views/signUp/signup_page.dart';
import 'package:easy_stock_app/views/splash_screens/splashscreen.dart';
import 'package:easy_stock_app/views/user/BottomNavbar/bottomNavbar.dart';
import 'package:easy_stock_app/views/user/Home/userhome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Splashscreen(),
      routes: {
        // login
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        // admin
        '/home': (context) => const AdminHomePage(),
        '/product': (context) => const ProductPage(),
        '/category': (context) => const CategoryPage(),
        '/add_product': (context) => const AddProductPage(),
        '/add_category': (context) => const AddCategoryPage(),
        // user
        '/bottom_navbar': (context) => BottomNavBar(),
        '/user_home': (context) => const UserhomePage()
      },
    );
  }
}
