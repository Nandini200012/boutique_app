import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_stock_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class UserhomePage extends StatefulWidget {
  const UserhomePage({super.key});

  @override
  State<UserhomePage> createState() => _UserhomePageState();
}

class _UserhomePageState extends State<UserhomePage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    List<String> imageList = [
      'assets/images/offerimage1.png',
      'assets/images/offerimage2.png',
      'assets/images/offerimage3.png',
      'assets/images/offerimage4.png',
    ];
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello!',
                        style: GoogleFonts.merriweatherSans(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Ashraf Ghan',
                        style: GoogleFonts.merriweatherSans(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.notifications_outlined,
                    color: Colors.black,
                    size: 28,
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: screenHeight * 0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: Colors.amber,
                    border: Border.all(width: 0.5, color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Search Product name here...",
                      style: GoogleFonts.merriweatherSans(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: CarouselSlider(
                  items: imageList.map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 200.0, // Set height of the carousel
                    enlargeCenterPage: true,
                    autoPlay: true, // Automatically scroll
                    autoPlayInterval:
                        const Duration(seconds: 3), // Time between auto scrolls
                    autoPlayAnimationDuration: const Duration(
                        milliseconds:
                            800), // Duration of the transition animation
                    scrollDirection: Axis.horizontal, // Horizontal scroll
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Shop by Category',
                style: GoogleFonts.merriweatherSans(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // First image with text overlay
                      Container(
                        height: screenHeight * 0.12,
                        width: screenWidth * 0.53,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/homeimage1.png', // Replace with your image URL
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                child: Container(
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 35,
                                child: Text(
                                  'Men & Women', // Replace with your desired text
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Second image with text overlay
                      Container(
                        height: screenHeight * 0.12,
                        width: screenWidth * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/homeimage2.png', // Replace with your image URL
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                child: Container(
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ),
                               Positioned(
                                bottom: 10,
                                left: 35,
                                child: Text(
                                  'Kids', // Replace with your desired text
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: screenHeight * 0.12,
                        width: screenWidth * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/homeimage3.png', // Replace with your image URL
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                child: Container(
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ),
                               Positioned(
                                bottom: 10,
                                left: 35,
                                child: Text(
                                  'Skin', // Replace with your desired text
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: screenHeight * 0.12,
                        width: screenWidth * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/homeimage4.png', // Replace with your image URL
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                child: Container(
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ),
                               Positioned(
                                bottom: 10,
                                left: 35,
                                child: Text(
                                  'Hair', // Replace with your desired text
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: screenHeight * 0.12,
                        width: screenWidth * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/homeimage5.png', // Replace with your image URL
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                child: Container(
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ),
                               Positioned(
                                bottom: 10,
                                left: 35,
                                child: Text(
                                  'Body', // Replace with your desired text
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(
                height: 15,
              ),
              Text(
                'Futured products',
                style: GoogleFonts.merriweatherSans(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: screenHeight * 0.8,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 15),
                  itemCount: 10,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    mainAxisSpacing: 15.0, // Vertical spacing
                    crossAxisSpacing: 15.0, // Horizontal spacing
                    childAspectRatio: 0.8, // Adjusts item width to height ratio
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 0.2,
                              blurRadius: 5,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: screenHeight * 0.13,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 191, 190, 190),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12))),
                              child: Image.asset(
                                'assets/images/product1.png',
                                height: screenHeight * 0.13,
                                width: double.infinity,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(
                                  Icons.image,
                                  size: 60,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Accessories',
                                    style: GoogleFonts.merriweatherSans(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.35,
                                    child: Text(
                                      ' Gold Plated Bag',
                                      style: GoogleFonts.merriweatherSans(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 18,
                                          color:
                                              Color.fromARGB(255, 255, 173, 59),
                                        ),
                                        Text(
                                          '4.6',
                                          style: GoogleFonts.merriweatherSans(
                                            color: Colors.grey.shade500,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '₹899',
                                          style: GoogleFonts.merriweatherSans(
                                            color: buttonColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
