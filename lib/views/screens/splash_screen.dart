import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../animations/loading_dots.dart';
import '../../animations/pulsating_logo.dart';
import '../../animations/shimmer_text.dart';

import 'authentication_screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _spinController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Main animation controller for fade and scale
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Spinner animation controller
    _spinController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
        reverseCurve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        reverseCurve: const Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.repeat(reverse: true);
    _spinController.repeat();

    Future.delayed(const Duration(seconds: 3), () {
      _controller.stop();
      _spinController.stop();
      checkAuthState();
    });
  }

  void checkAuthState() {
    Get.offAll(() => LoginScreen());
  }

  @override
  void dispose() {
    _controller.dispose();
    _spinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PulsatingLogo(),
                    const SizedBox(height: 30),
                    LoadingDots(),
                    const SizedBox(height: 30),
                    const ShimmerText('Welcome to Shop Hub'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
