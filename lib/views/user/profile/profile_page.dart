import 'package:easy_stock_app/utils/common_widgets/logout_alertbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfilePagePage extends StatefulWidget {
  const UserProfilePagePage({super.key});

  @override
  State<UserProfilePagePage> createState() => _UserProfilePagePageState();
}

class _UserProfilePagePageState extends State<UserProfilePagePage> {
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
              'Profile',
              style: GoogleFonts.merriweatherSans(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey.shade500,
                  radius: 30,
                  child: const Center(
                      child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 48,
                  )),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text(
                      'Ashraf Ghan',
                      style: GoogleFonts.merriweatherSans(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '+91 6253783263',
                      style: GoogleFonts.merriweatherSans(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // color: Colors.red,
                width: double.infinity,
                height: screenHeight * 0.48,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      List<Widget> icon = [
                        const Icon(
                          Icons.person_outline,
                          size: 25,
                          color: Colors.black,
                        ),
                        const Icon(
                          Icons.grid_view,
                          size: 25,
                          color: Colors.black,
                        ),
                        const Icon(
                          Icons.notifications,
                          size: 25,
                          color: Colors.black,
                        ),
                        const Icon(
                          Icons.security,
                          size: 25,
                          color: Colors.black,
                        ),
                        const Icon(
                          Icons.logout,
                          size: 25,
                          color: Colors.black,
                        ),
                      ];
                      List<String> title = [
                        'Personal Information',
                        'orders',
                        'Notification',
                        'Privacy Policy',
                        'LogOut'
                      ];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            if (title[index] == 'LogOut') {
                              logoutAlertDialog(context, 'Do you want to Logout?',
                                  screenHeight, screenWidth);
                              
                            }
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    icon[index],
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      title[index],
                                      style: GoogleFonts.merriweatherSans(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 0.8,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
