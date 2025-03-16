import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/button_widget.dart';
import '../widgets/custom_text_Field.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool _isLoading = false;

  late String email;

  late String fullName;

  late String password;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withValues(
          alpha: 0.95,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Form(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Create Your Account",
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF0d120E),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.2,
                          fontSize: 23,
                        ),
                      ),
                      Text(
                        'To Explore the world exclusives',
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF0d120E),
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
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Full Name',
                          style: GoogleFonts.getFont(
                            'Nunito Sans',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                      CustomTextField(
                        onChanged: (value) {
                          fullName = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your Full Name';
                          } else {
                            return null;
                          }
                        },
                        label: 'Enter your Full Name',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(Icons.person),
                        ),
                        text: 'enter email',
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
                      ButtonWidgets(
                        isLoading: _isLoading ? true : false,
                        buttonChange: () {

                        },
                        buttonTitle: 'Sign Up',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login  account?',
                            style: GoogleFonts.roboto(),
                          ),
                          TextButton(
                            onPressed: () {

                            },
                            child: Text(
                              'Login?',
                              style: GoogleFonts.roboto(),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login vendor account?',
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              letterSpacing: 0.1,
                              height: 1.7,
                            ),
                          ),
                          TextButton(
                            onPressed: () {

                            },
                            child: Text(
                              'Login',
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
      ),
    );
  }
}
