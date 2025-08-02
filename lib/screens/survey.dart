import 'package:flutter/material.dart';
import 'roommate.dart';

class SurveyScreen extends StatefulWidget {
  final String username;

  const SurveyScreen({Key? key, required this.username}) : super(key: key);

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  String diet = '';
  String sleepHabit = '';
  String smoke = '';
  String noiseTolerance = '';
  String personality = '';

  void _submitSurvey() {
    if (diet.isEmpty || sleepHabit.isEmpty || smoke.isEmpty || noiseTolerance.isEmpty || personality.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please answer all questions')),
      );
      return;
    }

    Map<String, String> surveyData = {
      'diet': diet,
      'sleepHabit': sleepHabit,
      'smoke': smoke,
      'noiseTolerance': noiseTolerance,
      'personality': personality,
    };

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RoommateScreen(username: widget.username, surveyData: surveyData)),
    );
  }

  Widget _buildOption(String title, String selectedValue, List<String> options, void Function(String) onSelect) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Color(0xFFF47417), fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 12,
          runSpacing: 10,
          children: options.map((option) {
            bool isSelected = selectedValue == option;
            return GestureDetector(
              onTap: () => setState(() => onSelect(option)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFF47417) : Colors.grey[600],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(option, style: const TextStyle(color: Colors.white)),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBE9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Preference Survey', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/survey.png',
                    height: 180,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Fill these questions carefully for better match!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildOption('Diet', diet, ['Veg', 'Non-Veg', 'Vegan', 'Doesn’t Matter'], (val) => diet = val),
            _buildOption('Sleep Habit', sleepHabit, ['Early Riser', 'Night Owl', 'Not Certain'], (val) => sleepHabit = val),
            _buildOption('Smoke/Alcohol', smoke, ['Yes', 'No', 'Doesn’t Matter'], (val) => smoke = val),
            _buildOption('Noise Tolerance', noiseTolerance, ['Low', 'Moderate', 'Loud', 'Doesn’t Matter'], (val) => noiseTolerance = val),
            _buildOption('Personality', personality, ['Introvert', 'Ambivert', 'Extrovert'], (val) => personality = val),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF47417),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: _submitSurvey,
                child: const Text('Submit & Continue', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
