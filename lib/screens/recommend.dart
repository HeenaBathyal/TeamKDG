import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecommendScreen extends StatefulWidget {
  final Map<String, dynamic> userPrefs;

  const RecommendScreen({Key? key, required this.userPrefs}) : super(key: key);

  @override
  _RecommendScreenState createState() => _RecommendScreenState();
}

class _RecommendScreenState extends State<RecommendScreen> {
  List<Map<String, dynamic>> recommendations = [];

  @override
  void initState() {
    super.initState();
    _loadRoommates();
  }

  Future<void> _loadRoommates() async {
    final String response = await rootBundle.loadString('assets/roommates.json');
    final data = json.decode(response) as List;
    List<Map<String, dynamic>> roommates = data.cast<Map<String, dynamic>>();

    for (var r in roommates) {
      int score = _calculateScore(r, widget.userPrefs);
      r['score'] = score;
    }

    roommates.sort((a, b) => b['score'].compareTo(a['score']));

    setState(() {
      recommendations = roommates;
    });
  }

  int _calculateScore(Map<String, dynamic> r, Map<String, dynamic> prefs) {
    int score = 0;

    if (r['city'].toLowerCase() == prefs['city'].toLowerCase()) score += 20;
    if ((r['budget'] - prefs['budget']).abs() <= 5000) score += 10;
    if (r['gender'].toLowerCase() == prefs['gender'].toLowerCase()) score += 10;

    List<String> keys = ['diet', 'sleepHabit', 'smoke', 'noiseTolerance', 'personality'];
    for (var key in keys) {
      if (r.containsKey(key) && prefs[key] == r[key]) {
        score += 5;
      }
    }

    return score;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recommended Matches')),
      body: recommendations.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          final r = recommendations[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(child: Text(r['name'][0])),
              title: Text(r['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('City: ${r['city']} | Budget: ₹${r['budget']}'),
                  Text('Compatibility: ${r['score']}%'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
