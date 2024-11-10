import 'package:easy_stock_app/utils/constants/colors.dart';
import 'package:easy_stock_app/views/admin/home/home_widgets/drawer_widget.dart';
import 'package:easy_stock_app/views/admin/home/home_widgets/productList_widget.dart';
import 'package:easy_stock_app/views/admin/product/product_widgets/category_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Products',
          style: GoogleFonts.merriweatherSans(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                 Navigator.pushNamed(context, '/add_product');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    'Add Product',
                    style: GoogleFonts.merriweatherSans(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18,
                    fill: 1,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: drawerWidget(screenHeight, screenWidth, context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: GoogleFonts.merriweatherSans(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16.0),
              categorylist(screenHeight, screenWidth),
              SizedBox(
                height: screenHeight * 0.76,
                child: productList(screenHeight, screenWidth),
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
