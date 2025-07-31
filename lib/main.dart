import 'package:flutter/material.dart';
import 'screens/splash.dart';
import 'screens/login.dart';
import 'screens/profile.dart';
import 'screens/dashboard_screen.dart';
import 'screens/survey_screen.dart';
import 'screens/matches_screen.dart';
import 'screens/roommate_details.dart';
import 'screens/chatroom_screen.dart';
import 'screens/ask_question_screen.dart';

void main() {
  runApp(SarthiApp());
}

class SarthiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SarthiApp',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white, // White background
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white, // AppBar text color
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white, // Button text color
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black87),
          titleLarge: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/profile': (context) => ProfileSetupScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/survey': (context) => SurveyScreen(),
        '/matches': (context) => MatchesScreen(),
        '/details': (context) => RoommateDetails(),
        '/chatroom': (context) => ChatroomScreen(),
        '/ask': (context) => AskQuestionScreen(),
      },
    );
  }
}
