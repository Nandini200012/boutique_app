import 'dart:ui';

import 'package:easy_stock_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCategoryPage extends StatefulWidget {
  const UserCategoryPage({super.key});

  @override
  State<UserCategoryPage> createState() => _UserCategoryPageState();
}

class _UserCategoryPageState extends State<UserCategoryPage> {
  int selectedCategoryIndex = 0;

  // Mock data for categories and products
  final List<String> categories = [
    'Electronics',
    'Clothing',
    'Groceries',
    'Books',
    'Toys'
  ];
  final Map<String, List<String>> products = {
    'Electronics': ['Phone', 'Laptop', 'Headphones', 'Camera'],
    'Clothing': ['Shirt', 'Pants', 'Shoes', 'Hat'],
    'Groceries': ['Apple', 'Banana', 'Carrot', 'Bread'],
    'Books': ['Novel', 'Biography', 'Comics', 'Magazine'],
    'Toys': ['Action Figure', 'Puzzle', 'Doll', 'Lego'],
  };

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: GoogleFonts.merriweatherSans(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    // Category List
                    Container(
                      color: Colors.transparent,
                      width: screenWidth * 0.28,
                      height: screenHeight * 0.8,
                      child: ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          List<String> img = [
                            'assets/images/dress_icon.png',
                            'assets/images/tshrt.png',
                            'assets/images/skin_care.png',
                            'assets/images/sanitizer.png',
                            'assets/images/hairdyrer.png',
                          ];
                          List<String> title = [
                            'Women',
                            'Men',
                            'Skin Care',
                            'Hair Care',
                            'Essentials',
                          ];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategoryIndex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: selectedCategoryIndex == index
                                      ? buttonColor.withOpacity(0.85)
                                      : Colors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundColor: Colors.grey.shade300,
                                      child: Image.asset(
                                        img[index],
                                        fit: BoxFit.contain,
                                        width: 50,
                                        height: 40,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                const Icon(
                                          Icons.image,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      title[index],
                                      style: TextStyle(
                                          color: selectedCategoryIndex == index
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 15),

                    // Product List for Selected Category
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        height: screenHeight * 0.8,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          itemCount:
                              products[categories[selectedCategoryIndex]]!
                                  .length,
                          itemBuilder: (context, index) {
                            List<String> img = [
                              'assets/images/womenproduct.png',
                              'assets/images/menproduct.png',
                              'assets/images/skin_care.png',
                              'assets/images/sanitizer.png',
                              'assets/images/hairdyrer.png'
                            ];
                            return Stack(
                              children: [
                                // Image with blur effect
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue[100],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                        img[selectedCategoryIndex], // Replace with your image URL
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                        // Blur effect on image
                                        BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 5, sigmaY: 5),
                                          child: Container(
                                            color: Colors.black.withOpacity(
                                                0.2), // Adds a subtle dark overlay
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Text overlay
                                Center(
                                  child: Text(
                                    'product ${index + 1}', // Replace with product name
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    )

                    // Expanded(
                    //   child: Container(
                    //     color: Colors.transparent,
                    //     height: screenHeight * 0.8,
                    //     child: GridView.builder(
                    //       gridDelegate:
                    //           const SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount: 2, // Number of columns
                    //         mainAxisSpacing:
                    //             10, // Vertical spacing between items
                    //         crossAxisSpacing:
                    //             10, // Horizontal spacing between items
                    //         childAspectRatio:
                    //            1, // Adjusts the height-to-width ratio of the items
                    //       ),
                    //       itemCount:
                    //           products[categories[selectedCategoryIndex]]!
                    //               .length,
                    //       itemBuilder: (context, index) {
                    //         return Container(
                    //           decoration: BoxDecoration(
                    //             color: Colors.blue[100],
                    //             borderRadius:
                    //                 BorderRadius.circular(8), // Rounded corners
                    //           ),
                    //           child: Center(
                    //             child: Text(
                    //               products[categories[selectedCategoryIndex]]![
                    //                   index],
                    //               style: const TextStyle(
                    //                 color: Colors.black,
                    //                 fontWeight: FontWeight.w500,
                    //               ),
                    //               textAlign: TextAlign.center,
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';

// class UserCategoryPage extends StatefulWidget {
//   const UserCategoryPage({super.key});

//   @override
//   State<UserCategoryPage> createState() => _UserCategoryPageState();
// }

// class _UserCategoryPageState extends State<UserCategoryPage> {
//   @override
//   Widget build(BuildContext context) {
//     var screenHeight = MediaQuery.of(context).size.height;
//     var screenWidth = MediaQuery.of(context).size.width;
//     return SafeArea(
//         child: Scaffold(
//             body: SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Categories',
//               style: GoogleFonts.merriweatherSans(
//                 color: Colors.black,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               children: [
//                 Container(
//                   color: Colors.red,
//                   width: screenWidth * 0.28,
//                   height: screenHeight * 0.8,
//                   child: ListView.builder(
//                     itemCount: 10,
//                     itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 50,
//                         width: 50,
//                         color: Colors.yellow,
//                       ),
//                     );
//                   }),
//                 ),
//                 SizedBox(
//                   width: 15,
//                 ),
//                 Container(
//                   color: Colors.black,
//                   width: screenWidth * 0.5,
//                   height: screenHeight * 0.8,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     )));
//   }
// }
