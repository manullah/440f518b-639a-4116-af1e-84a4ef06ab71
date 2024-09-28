import 'package:flutter/material.dart';
import 'package:flutter_bmi/pages/date_of_birth_page.dart';

class GenderSelectionPage extends StatefulWidget {
  const GenderSelectionPage({super.key});

  @override
  State<GenderSelectionPage> createState() => _GenderSelectionPageState();
}

class _GenderSelectionPageState extends State<GenderSelectionPage> {
  String? _selectedGender;

  Widget _buildGenderRadio(String gender, IconData icon) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: Colors.grey[400],
      ),
      child: RadioListTile<String>(
        title: Row(
          children: [
            Icon(icon,
                size: 30,
                color: _selectedGender == gender
                    ? Theme.of(context).primaryColor
                    : Colors.grey),
            const SizedBox(width: 16),
            Text(
              gender,
              style: TextStyle(
                fontSize: 18,
                fontWeight: _selectedGender == gender
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ],
        ),
        value: gender,
        groupValue: _selectedGender,
        onChanged: (String? value) {
          setState(() {
            _selectedGender = value;
          });
        },
        activeColor: Theme.of(context).primaryColor,
        selected: _selectedGender == gender,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gender'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Please select your gender:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            _buildGenderRadio('Male', Icons.male),
            _buildGenderRadio('Female', Icons.female),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedGender == null
                    ? null
                    : () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DateOfBirthPage(gender: _selectedGender!),
                        ));
                      },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
