import 'package:flutter/material.dart';

class ChatroomScreen extends StatefulWidget {
  @override
  _ChatroomScreenState createState() => _ChatroomScreenState();
}

class _ChatroomScreenState extends State<ChatroomScreen> {
  final _controller = TextEditingController();
  final List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Chat with $name')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) => ListTile(title: Text(messages[index])),
            ),
          ),
          Row(
            children: [
              Expanded(child: TextField(controller: _controller, decoration: InputDecoration(hintText: 'Type a message'))),
              IconButton(
                icon: Icon(Icons.send, color: Colors.deepPurple),
                onPressed: () {
                  setState(() {
                    if (_controller.text.trim().isNotEmpty) {
                      messages.add(_controller.text);
                      _controller.clear();
                    }
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
