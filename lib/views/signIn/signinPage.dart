import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:easy_stock_app/controllers/auth_provider/auth_provider.dart';
import 'package:easy_stock_app/utils/constants/colors.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

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

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true, // Allows layout to resize when keyboard is displayed
        backgroundColor: Colors.white,
        body: SingleChildScrollView( // Makes the whole page scrollable
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.24),
              SizedBox(
                height: screenHeight * 0.1,
                width: screenWidth * 0.35,
                child: Image.asset(
                  'assets/images/applogo.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.image,
                    color: Colors.white,
                    size: 10,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.06),
              // Username Field
              _buildTextField(
                controller: _usernameController,
                label: 'Username or Mobile Number',
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ),
              const SizedBox(height: 16.0),
              // Password Field
              _buildTextField(
                controller: _passwordController,
                label: 'Password',
                obscureText: _obscurePassword,
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              const SizedBox(height: 24.0),
              // Login Button
              _buildButton(
                onPressed: () => _login(context),
                label: 'Login',
                color: buttonColor,
                textColor: Colors.white,
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ),
              const SizedBox(height: 18.0),
              // Create New Account Button
              _buildButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                label: 'Create New Account',
                color: Colors.white,
                textColor: buttonColor,
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                borderColor: buttonColor,
              ),
            ],
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
          maxLines: 1, // Ensures single-line input
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
          style: TextStyle(
            overflow: TextOverflow.ellipsis, // Prevents text overflow
          ),
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
