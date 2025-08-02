import 'package:flutter/material.dart';
import 'recommend.dart';

class RoommateScreen extends StatefulWidget {
  final String username;
  final Map<String, String> surveyData;

  const RoommateScreen({Key? key, required this.username, required this.surveyData}) : super(key: key);

  @override
  _RoommateScreenState createState() => _RoommateScreenState();
}

class _RoommateScreenState extends State<RoommateScreen> {
  String city = '';
  double budget = 10000;
  String gender = '';

  void _submitRoommatePrefs() {
    if (city.isEmpty || gender.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all fields')),
      );
      return;
    }

    // Combine survey and roommate prefs
    Map<String, dynamic> userPrefs = {
      ...widget.surveyData,
      'city': city,
      'budget': budget,
      'gender': gender,
    };

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RecommendScreen(userPrefs: userPrefs)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBE9),
      appBar: AppBar(
        title: const Text('Roommate Preferences'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'City'),
              onChanged: (val) => city = val,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Budget:'),
                Expanded(
                  child: Slider(
                    value: budget,
                    min: 5000,
                    max: 50000,
                    divisions: 9,
                    label: budget.toInt().toString(),
                    onChanged: (val) => setState(() => budget = val),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Gender Preference'),
              items: ['Male', 'Female', 'Doesn’t Matter']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => gender = val!,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _submitRoommatePrefs,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF47417),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text('Find Matches', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
