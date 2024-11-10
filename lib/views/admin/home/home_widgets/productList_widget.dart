import 'package:flutter/material.dart';
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
                child: Image.asset('assets/images/product.png'),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth * 0.45,
                    height: screenHeight * 0.07,
                    child: Text(
                      'Roadster women Brown Solid Leather Corduroy Tailored Jacket',
                      style: GoogleFonts.merriweatherSans(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    'stock: 12',
                    style: GoogleFonts.merriweatherSans(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15),
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'edit') {
                    // Handle edit product action
                    print("Edit Product tapped");
                  } else if (value == 'remove') {
                    // Handle remove product action
                    print("Remove Product tapped");
                  }
                },
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem<String>(
                    value: 'edit',
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Text('Edit Product'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'remove',
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Text('Remove Product'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}




