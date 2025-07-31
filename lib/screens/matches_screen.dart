import 'package:flutter/material.dart';
import '../services/match_service.dart';
import '../models/roommate.dart';

class MatchesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userSurvey = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final matches = MatchService.getDummyMatches(userSurvey);

    return Scaffold(
      appBar: AppBar(title: Text('Your Matches')),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          final r = matches[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text('${r.name}, ${r.age} (${r.city})'),
              subtitle: Text('Rent: ₹${r.rent} | Compatibility: ${r.compatibility}%'),
              trailing: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/details', arguments: r),
                child: Text('View'),
              ),
            ),
          );
        },
      ),
    );
  }
}



