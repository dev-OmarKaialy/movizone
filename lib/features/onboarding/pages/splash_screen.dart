import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const OnBoardingScreen();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset('assets/splash.png'),
        const SizedBox(
          height: 15,
        ),
        const Text('MOVIZONE',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Color(0xff12CDD9)))
      ]),
    ));
  }
}
