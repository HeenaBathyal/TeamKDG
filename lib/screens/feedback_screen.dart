import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  final _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feedback')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _feedbackController,
              maxLines: 5,
              decoration: InputDecoration(labelText: 'Your Feedback'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/login'));
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
