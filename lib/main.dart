import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movizone/features/home/bloc/home_bloc.dart';
import 'package:movizone/features/home/data/model/movie_details_model.dart';
import 'package:movizone/features/onboarding/pages/splash_screen.dart';
import 'package:movizone/features/wishlist/bloc/wishlist_bloc.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieDetailsResponseModelAdapter());
  Hive.registerAdapter(GenreAdapter());
  await Hive.openBox<MovieDetailsResponseModel>('wishlist');
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => WishlistBloc(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 18, 16, 36),
              foregroundColor: const Color(0xff12cdd9)),
        ),
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
      home: const Scaffold(body: SplashScreen()),
    );
  }
}
