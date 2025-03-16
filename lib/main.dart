import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_hub/views/login_screen.dart';
import 'package:shop_hub/views/profile_screen.dart';
import 'package:shop_hub/views/register_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Hub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/customer_register': (context) => RegisterScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void moveToLogin() {

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/login');
    });
  }
  @override
  Widget build(BuildContext context) {
    moveToLogin();
    return SafeArea(child: Scaffold(
      body: Center(
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
            Text('Loading...',
              style: GoogleFonts.roboto(
                color: Color(0xFF0d120E),
                fontSize: 14,
                letterSpacing: 0.2,
              )),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    ));
  }
}
