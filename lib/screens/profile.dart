import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatefulWidget {
  @override
  _ProfileSetupScreenState createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneController = TextEditingController();
  String? gender;
  final _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Setup')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: _ageController, decoration: InputDecoration(labelText: 'Age'), keyboardType: TextInputType.number),
            DropdownButtonFormField<String>(
              value: gender,
              items: ['Female', 'Male'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => setState(() => gender = val),
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            TextField(controller: _phoneController, decoration: InputDecoration(labelText: 'Phone'), keyboardType: TextInputType.phone),
            TextField(controller: _cityController, decoration: InputDecoration(labelText: 'City')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/dashboard'),
              child: Text('Next'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}
