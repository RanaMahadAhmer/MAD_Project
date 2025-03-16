import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/ProfileDTO.dart';
import '../widgets/button_widget.dart';
import '../widgets/custom_text_Field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email="";
  String password="";
  bool _isLoading = false;

  bool validate() {


    bool isEmailValid = RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]').hasMatch(email);


    bool isPasswordValid = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*]).{8,}$').hasMatch(password);

    if (email.isEmpty || password.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email and password cannot be empty.'),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    } else if (!isEmailValid) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Enter a valid email address.'),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    } else if (!isPasswordValid) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password must be at least 8 characters long, with one uppercase letter, one special character, and one number.'),
          duration: Duration(seconds: 3),
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withAlpha(245),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/store.png',height: MediaQuery.sizeOf(context).height*0.1,),
                    Text(
                      "Shop Hub",
                      style: GoogleFonts.roboto(
                        color: Color(0xFF0d120E),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.2,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Login Your Account",
                      style: GoogleFonts.roboto(
                        color: Color(0xFF0d120E),
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.2,
                        fontSize: 23,
                      ),
                    ),
                    Text(
                      'To Explore the world exclusives',
                      style: GoogleFonts.roboto(
                        color: Color(0xFF0d120E),
                        fontSize: 14,
                        letterSpacing: 0.2,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Email',
                        style: GoogleFonts.getFont(
                          'Nunito Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                    CustomTextField(
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your email';
                        } else {
                          return null;
                        }
                      },
                      label: 'Enter your email',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.email_outlined),
                      ),
                      text: 'enter email',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Password',
                        style: GoogleFonts.getFont(
                          'Nunito Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                    CustomTextField(
                      isPassword: true,
                      onChanged: (value) {
                        password = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your password';
                        } else {
                          return null;
                        }
                      },
                      label: 'Enter your password',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.lock_open_outlined),
                      ),
                      text: 'enter password',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ButtonWidgets(
                      isLoading: _isLoading ? true : false,
                      buttonChange: () {
                        if (validate()) {
                          final profileData = ProfileDTO(
                            name: "Rana Mahad Ahmer",
                            imageName: "assets/profile_pic.png",
                            phone: "+92 300 1234567",
                            email: email,
                            biometric: true,
                            address: "Islamabad, Pakistan",
                          );
                          Navigator.pushNamed(context, '/profile', arguments: profileData);
                        }
                      },
                      buttonTitle: 'Sign In',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Need an account?',
                          style: GoogleFonts.roboto(),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/customer_register');
                          },
                          child: Text(
                            'Create account?',
                            style: GoogleFonts.roboto(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create Vendor account?',
                          style: GoogleFonts.roboto(),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle vendor account creation
                          },
                          child: Text(
                            'Create account?',
                            style: GoogleFonts.roboto(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
