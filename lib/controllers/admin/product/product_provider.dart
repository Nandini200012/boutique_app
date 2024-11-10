import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Provider to manage form state
class ProductProvider with ChangeNotifier {
  String productName = '';
  String productDescription = '';
  String category = 'Electronics';
  double price = 0.0;
  List<String> selectedSizes = [];
  List<XFile> images = [];

  // Function to add product to list
  void addProduct() {
    // Handle adding the product to a list or API call here
    notifyListeners();
  }

  // Function to select images from gallery
  Future<void> selectImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null) {
      images = pickedFiles;
      notifyListeners();
    }
  }

  // Clear the form inputs
  void clearForm() {
    productName = '';
    productDescription = '';
    category = 'Electronics';
    price = 0.0;
    selectedSizes.clear();
    images.clear();
    notifyListeners();
  }
}