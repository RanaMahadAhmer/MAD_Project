import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../vendor/authentication/vendor_login_Screen.dart';
import '../widgets/button_widget.dart';
import '../widgets/custom_text_Field.dart';
import 'login_screen.dart';


class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  late String email;

  late String fullName;

  late String password;

  late AnimationController _formController;
  late Animation<Offset> _slideAnimation;

  registerUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Sign Up Successful')));


      setState(() {
        _isLoading = false;
      });


    }
  }

  @override
  void initState() {
    super.initState();

    _formController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _formController,
      curve: Curves.easeOut,
    ));
    _formController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(
          0.95,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Form(
                  key: _formKey,
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
                      Hero(
                        tag: 'Icon',
                        child: Image.asset(
                          'assets/images/Store.png',
                          width: 200,
                          height: 200,
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
                      SlideTransition(
                        position: _slideAnimation,
                        child: CustomTextField(
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
                            child: Image.asset(
                              'assets/icons/email.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                          text: 'enter email',
                        ),
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
                      SlideTransition(
                        position: _slideAnimation,
                        child: CustomTextField(
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
                            child: Image.asset(
                              'assets/icons/user.jpeg',
                              width: 20,
                              height: 20,
                            ),
                          ),
                          text: 'enter email',
                        ),
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
                      SlideTransition(
                        position: _slideAnimation,
                        child: CustomTextField(
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
                            child: Image.asset(
                              'assets/icons/password.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                          text: 'enter password',
                        ),
                      ),
                      ButtonWidgets(
                        isLoading: _isLoading ? true : false,
                        buttonChange: () {
                          if (_formKey.currentState!.validate()) {
                            registerUser();
                          } else {
                            print('faile');
                          }
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
                              Get.to(
                                () => LoginScreen(),
                                transition: Transition.fadeIn,
                                duration: Duration(milliseconds: 1500),
                              );
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
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return VendorLoginScreen();
                              }));
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
