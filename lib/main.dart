import 'package:flutter/material.dart';
import 'screens/splash.dart';

void main() {
  runApp(const SarthiApp());
}

class SarthiApp extends StatelessWidget {
  const SarthiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sarthi App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFAE9),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF47417),
          foregroundColor: Colors.white,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
