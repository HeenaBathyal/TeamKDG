import 'package:flutter/material.dart' as flutter;
import 'account.dart';
import 'dashboard.dart';

class LoginScreen extends flutter.StatefulWidget {
  const LoginScreen({flutter.Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends flutter.State<LoginScreen> {
  final _formKey = flutter.GlobalKey<flutter.FormState>();
  final flutter.TextEditingController _emailController = flutter.TextEditingController();
  final flutter.TextEditingController _passwordController = flutter.TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      flutter.ScaffoldMessenger.of(context).showSnackBar(
        const flutter.SnackBar(content: flutter.Text('Login successful!')),
      );
      flutter.Navigator.pushReplacement(
        context,
        flutter.MaterialPageRoute(
          builder: (context) => DashboardScreen(username: _emailController.text),
        ),
      );
    }
  }

  @override
  flutter.Widget build(flutter.BuildContext context) {
    return flutter.Scaffold(
      backgroundColor: const flutter.Color(0xFFFFFBE9),
      appBar: flutter.AppBar(
        backgroundColor: flutter.Colors.transparent,
        elevation: 0,
        leading: flutter.IconButton(
          icon: const flutter.Icon(flutter.Icons.arrow_back, color: flutter.Colors.black),
          onPressed: () => flutter.Navigator.pop(context),
        ),
      ),
      body: flutter.SingleChildScrollView(
        padding: const flutter.EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: flutter.Form(
          key: _formKey,
          child: flutter.Column(
            crossAxisAlignment: flutter.CrossAxisAlignment.center,
            children: [
              flutter.Image.asset(
                'assets/images/logo.png',
                width: 120,
                height: 120,
                fit: flutter.BoxFit.contain,
              ),
              const flutter.SizedBox(height: 20),

              const flutter.Text(
                'LOGIN',
                style: flutter.TextStyle(fontSize: 28, fontWeight: flutter.FontWeight.bold),
              ),
              const flutter.SizedBox(height: 10),
              const flutter.Text(
                'Please login with your email and password',
                textAlign: flutter.TextAlign.center,
                style: flutter.TextStyle(fontSize: 16, color: flutter.Colors.black54),
              ),
              const flutter.SizedBox(height: 30),

              // Email field
              flutter.TextFormField(
                controller: _emailController,
                keyboardType: flutter.TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your email';
                  }
                  return null;
                },
                decoration: flutter.InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: flutter.Colors.white,
                  border: flutter.OutlineInputBorder(borderRadius: flutter.BorderRadius.circular(8)),
                ),
              ),
              const flutter.SizedBox(height: 16),

              // Password field
              flutter.TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your password';
                  }
                  return null;
                },
                decoration: flutter.InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: flutter.Colors.white,
                  border: flutter.OutlineInputBorder(borderRadius: flutter.BorderRadius.circular(8)),
                ),
              ),
              const flutter.SizedBox(height: 30),

              // Log In Button
              flutter.ElevatedButton(
                style: flutter.ElevatedButton.styleFrom(
                  backgroundColor: const flutter.Color(0xFFF47417),
                  shape: flutter.RoundedRectangleBorder(
                    borderRadius: flutter.BorderRadius.circular(40),
                  ),
                  minimumSize: const flutter.Size(double.infinity, 55),
                ),
                onPressed: _login,
                child: const flutter.Text(
                  'Log In',
                  style: flutter.TextStyle(color: flutter.Colors.white, fontSize: 18),
                ),
              ),
              const flutter.SizedBox(height: 20),

              // Create Account Button
              flutter.GestureDetector(
                onTap: () {
                  flutter.Navigator.push(
                    context,
                    flutter.MaterialPageRoute(builder: (context) =>  CreateAccountScreen()),
                  );
                },
                child: flutter.Container(
                  width: double.infinity,
                  height: 55,
                  alignment: flutter.Alignment.center,
                  decoration: flutter.BoxDecoration(
                    color: flutter.Colors.white,
                    borderRadius: flutter.BorderRadius.circular(40),
                    border: flutter.Border.all(color: const flutter.Color(0xFFF47417), width: 2),
                  ),
                  child: const flutter.Text(
                    'Create Account',
                    style: flutter.TextStyle(color: flutter.Color(0xFFF47417), fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
