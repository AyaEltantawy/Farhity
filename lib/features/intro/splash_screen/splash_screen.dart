import 'dart:async';
import 'package:flutter/material.dart';

import '../onboarding_screen/onboaring_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 1.0;
  bool _showFirstImage = true;
  late Timer _animationTimer;

  @override
  void initState() {
    super.initState();
    _startAnimation();

    Future.delayed(const Duration(seconds: 6), () {
      _navigateToOnboarding();
    });
  }

  void _startAnimation() {
    _animationTimer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        _opacity = 0.0;
      });

      Future.delayed(const Duration(milliseconds: 1500), () {
        setState(() {
          _showFirstImage = !_showFirstImage;
          _opacity = 1.0;
        });
      });
    });
  }

  void _navigateToOnboarding() {
    _animationTimer.cancel();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingScreen()),
    );
  }

  @override
  void dispose() {
    _animationTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(milliseconds: 1500),
            child: _showFirstImage
                ? Image.asset(
                    'assets/images/background2.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
                : Image.asset(
                    'assets/images/background1.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(milliseconds: 1500),
              child: _showFirstImage
                  ? Image.asset('assets/images/frame2.png', fit: BoxFit.contain)
                  : Image.asset(
                      'assets/images/frame3.png',
                      fit: BoxFit.contain,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
