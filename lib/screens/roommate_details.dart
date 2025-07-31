import 'package:flutter/material.dart';
import '../models/roommate.dart';

class RoommateDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final r = ModalRoute.of(context)!.settings.arguments as Roommate;

    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${r.name}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Age: ${r.age}'),
            Text('City: ${r.city}'),
            Text('Gender: ${r.gender}'),
            SizedBox(height: 10),
            Text('Rent: ₹${r.rent}', style: TextStyle(fontSize: 16, color: Colors.green)),
            Text('Compatibility: ${r.compatibility}%', style: TextStyle(fontSize: 16, color: Colors.blue)),
            SizedBox(height: 10),
            Text('Lifestyle: ${r.description}'),
            Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/chatroom', arguments: r.name),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: Text('Start Anonymous Chat'),
            ),
          ],
        ),
      ),
    );
  }
}
