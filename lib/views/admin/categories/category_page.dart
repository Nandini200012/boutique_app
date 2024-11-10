import 'package:easy_stock_app/views/admin/home/home_widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Categories',
          style: GoogleFonts.merriweatherSans(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      drawer: drawerWidget(screenHeight, screenWidth, context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey.shade300,
                    child: Image.asset(
                      'assets/images/dress_icon.png',
                      fit: BoxFit.contain,
                      width: 50,
                      height: 50,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey.shade300,
                    child: Image.asset(
                      'assets/images/tshrt.png',
                      fit: BoxFit.contain,
                      width: 50,
                      height: 60,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey.shade300,
                    child: Image.asset(
                      'assets/images/skin_care.png',
                      fit: BoxFit.contain,
                      width: 50,
                      height: 40,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey.shade300,
                    child: SizedBox( width: 50,
                        height: 40,
                      child: Image.asset(
                        'assets/images/sanitizer.png',
                        fit: BoxFit.contain,
                       
                        errorBuilder: (context, error, stackTrace) => const Icon(
                          Icons.image,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey.shade300,
                    child: Image.asset(
                      'assets/images/hairdyrer.png',
                      fit: BoxFit.contain,
                      width: 50,
                      height: 40,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/add_category');
                    },
                    child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.grey.shade300,
                        child: const Icon(
                          Icons.add,
                          size: 35,
                          color: Colors.black,
                        )),
                  ),
                  const CircleAvatar(
                      radius: 35, backgroundColor: Colors.transparent),
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
