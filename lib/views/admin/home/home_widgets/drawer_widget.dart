import 'package:easy_stock_app/utils/common_widgets/logout_alertbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget drawerWidget(screenHeight, screenWidth, context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: screenHeight * 0.17,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 25,
                      )),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  Text(
                    'Admin',
                    style: GoogleFonts.merriweatherSans(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
        ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Dashboard',
              style: GoogleFonts.merriweatherSans(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Product',
              style: GoogleFonts.merriweatherSans(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, '/product');
          },
        ),
        ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Category',
              style: GoogleFonts.merriweatherSans(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, '/category');
          },
        ),
      
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.black,
              size: 20,
            ),
            title: Text(
              'Logout',
              style: GoogleFonts.merriweatherSans(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () {
               logoutAlertDialog(context, 'Do you want to Logout?',
                                  screenHeight, screenWidth);
              // Navigator.pop(context);
              // Navigator.pushReplacementNamed(context, '/signin');
            },
          ),
        ),
      ],
    ),
  );
}
