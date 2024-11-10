import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

Widget categorylist(screenHeight, screenWidth) {
  final titles = ['All', 'Men & Women', 'Kids', 'Western', 'Traditional'];
  return SizedBox(
    height: screenHeight * 0.035, // Set a fixed height
    child: ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: titles.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          // width: screenWidth * 0.13, // Adjust width as needed
          margin: const EdgeInsets.symmetric(
            horizontal: 5.0,
          ),
           padding: const EdgeInsets.symmetric(horizontal:10,vertical: 2),
          decoration: BoxDecoration(
            color: index==0? Colors.blue:Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color:index==0?Colors.white:  Colors.grey.shade600,width: 0.6),
          ),
          child: Center(
            child: Text(
              titles[index],
              style: GoogleFonts.merriweatherSans(
                color:index==0?Colors.white: Colors.grey.shade600,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        );
      },
    ),
  );
}
