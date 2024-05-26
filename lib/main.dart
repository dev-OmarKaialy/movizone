import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color(0xff242A32),
            selectedLabelStyle: TextStyle(
              color: Color(0xff12CDD9),
            ),
            selectedItemColor: Color(0xff12cdd9),
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: TextStyle(color: Colors.grey)),
        scaffoldBackgroundColor: const Color(0xff1F1D2B),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff1F1D2B), foregroundColor: Colors.white),
      ),
      home: Scaffold(body: Center(child: Text('MOVIZONE Project'))),
    );
  }
}
