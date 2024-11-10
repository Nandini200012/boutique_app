import 'dart:io';
import 'package:easy_stock_app/utils/common_widgets/showdialoguebox.dart';
import 'package:easy_stock_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final TextEditingController _categorynameController = TextEditingController();
  XFile? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _categorynameController.dispose();
    super.dispose();
  }

  Future<void> _pickSvgFile() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _selectedImage = image;
        });
      }
    } catch (e) {
      print("Failed to pick image: $e");
    }
  }

  void _removeImage() {
    setState(() {
      _selectedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Category',
          style: GoogleFonts.merriweatherSans(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Category Name',
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
                  controller: _categorynameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Category Name',
                    hintStyle: TextStyle(
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

            SizedBox(height: screenHeight * 0.024),
            Text(
              'Image',
              style: GoogleFonts.merriweatherSans(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenHeight * 0.008),

            // SVG Picker Container
            GestureDetector(
              onTap: _pickSvgFile,
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
                        _selectedImage != null
                            ? _selectedImage!.name
                            : 'Pick image from file',
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                    const Spacer(),
                    if (_selectedImage !=
                        null) // Display remove icon if an image is selected
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.red),
                        onPressed: _removeImage,
                      ),
                    if (_selectedImage == null)
                      const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.add_photo_alternate),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            if (_selectedImage != null)
              Center(
                child: Container(
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey),
                    image: DecorationImage(
                      image: FileImage(File(_selectedImage!.path)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            // Spacer for layout control
            // _selectedImage != null
            //     ? SizedBox(height: screenHeight * 0.33)
            //     : SizedBox(height: screenHeight * 0.53),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(
            bottom: screenHeight * 0.03, top: screenHeight * 0.03),
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
                  showAlertDialog(context, 'Are you sure want to Cancel?',
                      screenHeight, screenWidth);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
                  showAlertDialog(context, 'Are you sure want to Add Category?',
                      screenHeight, screenWidth);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text(
                  'Add Category',
                  style: GoogleFonts.merriweatherSans(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
