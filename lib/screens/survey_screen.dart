import 'package:flutter/material.dart';

class SurveyScreen extends StatefulWidget {
  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final Map<String, dynamic> surveyData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lifestyle Survey')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          buildDropdown('Eating Habits', 'eating', ['Veg', 'Non-Veg']),
          buildDropdown('Sleeping Schedule', 'sleep', ['Early Bird', 'Night Owl']),
          buildDropdown('Cleaning Preference', 'cleaning', ['Clean Freak', 'Moderate']),
          buildDropdown('Personality', 'personality', ['Introvert', 'Extrovert']),
          buildDropdown('Smoking/Drinking', 'smoking', ['Yes', 'No']),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/matches', arguments: surveyData);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            child: Text('See Matches'),
          ),
        ],
      ),
    );
  }

  Widget buildDropdown(String label, String key, List<String> options) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
        items: options.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: (val) => setState(() => surveyData[key] = val),
      ),
    );
  }
}
