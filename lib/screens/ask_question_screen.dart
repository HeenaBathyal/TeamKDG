import 'package:flutter/material.dart';

class AskQuestionScreen extends StatefulWidget {
  @override
  _AskQuestionScreenState createState() => _AskQuestionScreenState();
}

class _AskQuestionScreenState extends State<AskQuestionScreen> {
  final _questionController = TextEditingController();
  final List<String> questions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ask a Question')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _questionController,
              decoration: InputDecoration(labelText: 'Your Question', border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_questionController.text.trim().isNotEmpty) {
                  setState(() {
                    questions.add(_questionController.text);
                    _questionController.clear();
                  });
                }
              },
              child: Text('Post'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) => ListTile(title: Text(questions[index])),
              ),
            )
          ],
        ),
      ),
    );
  }
}
