import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget commonTextfield({
  required TextEditingController? controller,
  required double screenHeight,
  required double screenWidth,
  required String title,
  String? hintText,
  required TextInputType? keyboardType,
}) {
  return Column( crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: screenHeight * 0.02),
      Text(
        title,
        style: GoogleFonts.merriweatherSans(
            fontSize: 16, fontWeight: FontWeight.w500),
      ),
      SizedBox(height: screenHeight * 0.008),

      // Category Name Input
      Container(
        height: screenHeight * 0.06,
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
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
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              fillColor: Colors.white,
              filled: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
            ),
          ),
        ),
      ),
    ],
  );
}
