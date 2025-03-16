import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/button_widget.dart';
import '../widgets/custom_text_Field.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  late String email;

  late String password;

  bool _isLoading = false;



  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withValues(alpha:
        0.95,
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
                        "Login Your Account",
                        style: GoogleFonts.roboto(
                          color: Color(0xFF0d120E),
                          fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
