import 'package:flutter/material.dart';
import 'views/splash_view.dart';
import 'views/login_view.dart';
import 'views/home_view.dart';
import 'views/timeline_view.dart';
import 'views/profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perpustakaan App',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primaryColor: const Color.fromARGB(221, 218, 179, 222),
        scaffoldBackgroundColor: const Color(0xFFF8F4FF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(221, 218, 179, 222),
          foregroundColor: Colors.white,
          elevation: 4,
          centerTitle: true,
        ),
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const SplashView(),
        '/login': (context) => const LoginView(),
        '/home': (context) => const HomeView(),
        '/timeline': (context) => const TimelineView(),
        '/profile': (context) => const ProfileView(),
      },

      onUnknownRoute: (settings) => MaterialPageRoute(builder: (_) => const SplashView()),
    );
  }
}
