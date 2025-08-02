import 'package:flutter/material.dart';

class SarthiScreen extends StatelessWidget {
  const SarthiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sarthi"),
        backgroundColor: const Color(0xFFF47417),
      ),
      body: const Center(
        child: Text(
          "Welcome to Sarthi!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
