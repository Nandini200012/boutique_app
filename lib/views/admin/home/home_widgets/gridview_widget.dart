import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    final gradients = [
      [Color(0xFF9DD366), Color(0xFF8EC254)], // Green gradient for first item
      [Color(0xFFEB5565), Color(0xFFDB4655)], // Red gradient for second item
      [
        Color.fromARGB(255, 254, 147, 80),
        Color.fromARGB(255, 247, 157, 60)
      ], // Yellow gradient for third item
      [Color(0xFF599AEB), Color(0xFF4B89DC)], // Blue gradient for fourth item
    ];
    final content1 = [
      'Our Products',
      'Current Orders',
      'Categories',
      'Sub Categories',
    ];
    final content2 = [
      '4',
      '5',
      '6',
      '8',
    ];
    final content3 = [
      'View Products',
      'View Orders',
      'View Categories',
      'View Product',
    ];
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 15, horizontal: screenWidth * 0.07),
      child: GridView.builder(
        itemCount: 4,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 20, // spacing between columns
            mainAxisSpacing: 10, // spacing between rows
            childAspectRatio: 1.3),
        itemBuilder: (context, index) {
          return Container(
            height: screenHeight * 0.15,
            width: screenWidth * 0.35,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradients[index],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                // begin: Alignment.topLeft,
                // end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    content1[index],
                    style: GoogleFonts.merriweatherSans(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    content2[index],
                    style: GoogleFonts.merriweatherSans(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text(
                        content3[index],
                        style: GoogleFonts.merriweatherSans(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 20,
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
