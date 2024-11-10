// ignore_for_file: avoid_print, invalid_use_of_protected_member, unused_field

import 'dart:io';
import 'package:easy_stock_app/controllers/admin/product/product_provider.dart';
import 'package:easy_stock_app/utils/common_widgets/showdialoguebox.dart';
import 'package:easy_stock_app/utils/common_widgets/textfield_common.dart';
import 'package:easy_stock_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _productnameController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  List<XFile>? _selectedImages = [];

  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _productnameController.dispose();
    _productDescriptionController.dispose();
    _productPriceController.dispose();
    super.dispose();
  }

  Future<void> _pickSvgFiles() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final List<XFile>? images =
          await _picker.pickMultiImage(); // Picking multiple images

      if (images != null && images.isNotEmpty) {
        setState(() {
          _selectedImages = images; // Storing selected images in a list
        });
      }
    } catch (e) {
      print("Failed to pick images: $e");
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages
          ?.removeAt(index); // Remove the selected image at the given index
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => ProductProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Product',
            style: GoogleFonts.merriweatherSans(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        body: Consumer<ProductProvider>(
          builder: (context, provider, _) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonTextfield(
                    controller: _productnameController,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    title: "Product Name",
                    hintText: "Enter Product Name",
                    keyboardType: TextInputType.text,
                  ),

                  commonTextfield(
                    controller: _productDescriptionController,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    title: 'Product Description',
                    hintText: 'Enter Product Description',
                    keyboardType: TextInputType.text,
                  ),

                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Category',
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 2),
                      child: DropdownButtonFormField<String>(
                        value: provider.category,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        items: ['Electronics', 'Clothing', 'Accessories']
                            .map((category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(
                                    category,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) =>
                            provider.category = value ?? 'Electronics',
                      ),
                    ),
                  ),
                  commonTextfield(
                    controller: _productPriceController,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    title: "Price",
                    hintText: "Enter Product Price",
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Select Size',
                    style: GoogleFonts.merriweatherSans(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: screenHeight * 0.008),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      'S',
                      'M',
                      'L',
                      'XL',
                      'XXL',
                    ].map((size) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            activeColor: buttonColor,
                            value: provider.selectedSizes.contains(size),
                            onChanged: (selected) {
                              if (selected == true) {
                                provider.selectedSizes.add(size);
                              } else {
                                provider.selectedSizes.remove(size);
                              }
                              provider.notifyListeners();
                            },
                          ),
                          Text(
                            size,
                            style: GoogleFonts.merriweatherSans(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16.0),

                  // SVG Picker Container

                  Text(
                    'Image',
                    style: GoogleFonts.merriweatherSans(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: screenHeight * 0.008),
                  GestureDetector(
                    onTap:
                        _pickSvgFiles, // Call the function for multiple images
                    child: Container(
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
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              _selectedImages != null &&
                                      _selectedImages!.isNotEmpty
                                  ? '${_selectedImages!.length} images selected'
                                  : 'Pick SVG from file',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          ),
                          const Spacer(),
                          if (_selectedImages != null &&
                              _selectedImages!.isNotEmpty)
                            IconButton(
                              icon: const Icon(Icons.close, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  _selectedImages
                                      ?.clear(); // Clear all selected images
                                });
                              },
                            ),
                          if (_selectedImages == null ||
                              _selectedImages!.isEmpty)
                            const Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Icon(Icons.add_photo_alternate),
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
// Display all selected images
                  if (_selectedImages != null && _selectedImages!.isNotEmpty)
                    Wrap(
                      spacing: 10.0,
                      children: _selectedImages!.map((image) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              image: DecorationImage(
                                image: FileImage(File(image.path)),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon:
                                    const Icon(Icons.close, color: Colors.red),
                                onPressed: () {
                                  int index = _selectedImages!.indexOf(image);
                                  _removeImage(index); // Remove specific image
                                },
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                ],
              ),
            );
          },
        ),
        bottomSheet: Padding(
          padding: EdgeInsets.only(bottom: screenHeight * 0.03,top: screenHeight * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: screenHeight * 0.06,
                width: screenWidth * 0.4,
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
                child: ElevatedButton(
                  onPressed: () {
                    showAlertDialog(context, 'Are you sure want to Cancel?',screenHeight,screenWidth);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  ),
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.merriweatherSans(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                height: screenHeight * 0.06,
                width: screenWidth * 0.4,
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
                child: ElevatedButton(
                  onPressed: () {
                    showAlertDialog(context, 'Are you sure want to Add Product?',screenHeight,screenWidth);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  ),
                  child: Text(
                    'Add Product',
                    style: GoogleFonts.merriweatherSans(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
