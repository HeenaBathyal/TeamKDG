import 'package:flutter/material.dart';

class CompatibilityScreen extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String gender;
  final int age;
  final String address;
  final String score;

  const CompatibilityScreen({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.gender,
    required this.age,
    required this.address,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Compatibility Details'), backgroundColor: const Color(0xFFF47417)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(radius: 60, backgroundImage: NetworkImage(imageUrl)),
            const SizedBox(height: 16),
            Text(name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('$gender, $age years'),
            const SizedBox(height: 8),
            Text(address),
            const SizedBox(height: 16),
            Text('Compatibility Score: $score', style: const TextStyle(fontSize: 18, color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
