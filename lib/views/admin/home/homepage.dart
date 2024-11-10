import 'package:easy_stock_app/views/admin/home/home_widgets/drawer_widget.dart';
import 'package:easy_stock_app/views/admin/home/home_widgets/gridview_widget.dart';
import 'package:easy_stock_app/views/admin/home/home_widgets/productList_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin',
          style: GoogleFonts.merriweatherSans(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      drawer:drawerWidget(screenHeight,screenWidth,context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.35, child: const GridViewExample()),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(2, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          'Current Orders',
                          style: GoogleFonts.merriweatherSans(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Text(
                          'View All',
                          style: GoogleFonts.merriweatherSans(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      color: Colors.grey.shade400,
                      thickness: 1.3,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.45,
                    child: productList(screenHeight, screenWidth)
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
