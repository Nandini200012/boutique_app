import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

Widget productList(screenHeight, screenWidth) {
  return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Row(
              children: [
                SizedBox(
                    height: screenHeight * 0.08,
                    // width: screenWidth * 0.3,
                    child: Image.asset('assets/images/product.png')),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.45,
                      child: Text(
                        'Roadster women Brown Solid Leather Corduroy Tailored Jacket',
                        style: GoogleFonts.merriweatherSans(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      'Shipped',
                      style: GoogleFonts.merriweatherSans(
                          color: Colors.orangeAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
