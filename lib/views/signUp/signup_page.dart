import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:easy_stock_app/controllers/auth_provider/auth_provider.dart';
import 'package:easy_stock_app/utils/constants/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _reenterPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _reobscurePassword = true;

  void _login(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    authProvider.login(username, password);

     if (authProvider.isAdmin) {
       Navigator.pushNamed(context, '/home');
    } else {
      Navigator.pushNamed(context,  '/bottom_navbar');
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleReenterPasswordVisibility() {
    setState(() {
      _reobscurePassword = !_reobscurePassword;
    });
  }

@override
Widget build(BuildContext context) {
  var screenHeight = MediaQuery.of(context).size.height;
  var screenWidth = MediaQuery.of(context).size.width;

  return SafeArea(
    child: Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SizedBox(
            height: screenHeight,
            child: Stack(
              children: [
                Positioned(
                  bottom: screenHeight * 0.2, left: screenWidth * 0.02,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.24),
                      // Your Logo and TextFields
                      SizedBox(
                        height: screenHeight * 0.1,
                        width: screenWidth * 0.35,
                        child: Image.asset(
                          'assets/images/applogo.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.06),
                      _buildTextField(
                        controller: _usernameController,
                        label: 'Name',
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                      ),
                      const SizedBox(height: 16.0),
                      _buildTextField(
                        controller: _phoneController,
                        label: 'Phone Number',
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                      ),
                      const SizedBox(height: 16.0),
                      _buildTextField(
                        controller: _passwordController,
                        label: 'Password',
                        obscureText: _obscurePassword,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: _togglePasswordVisibility,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      _buildTextField(
                        controller: _reenterPasswordController,
                        label: 'Re Enter Password',
                        obscureText: _reobscurePassword,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _reobscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: _toggleReenterPasswordVisibility,
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      _buildButton(
                        onPressed: () => _login(context),
                        label: 'Create Account',
                        color: buttonColor,
                        textColor: Colors.white,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                      ),
                       const SizedBox(height: 18.0),
                       _buildButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/signin');
                  },
                  label: 'Login',
                  color: Colors.white,
                  textColor: buttonColor,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  borderColor: buttonColor,
                ),
                    ],
                  ),
                ),
               
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
    Widget? suffixIcon,
    required double screenHeight,
    required double screenWidth,
  }) {
    return Container(
      height: screenHeight * 0.06,
      width: screenWidth * 0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: GoogleFonts.merriweatherSans(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            border: InputBorder.none,
            suffixIcon: suffixIcon,
          ),
          obscureText: obscureText,
        ),
      ),
    );
  }

  Widget _buildButton({
    required VoidCallback onPressed,
    required String label,
    required Color color,
    required Color textColor,
    required double screenHeight,
    required double screenWidth,
    Color? borderColor,
  }) {
    return Container(
      height: screenHeight * 0.06,
      width: screenWidth * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: borderColor != null
            ? Border.all(width: 1.2, color: borderColor)
            : null,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: GoogleFonts.merriweatherSans(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
