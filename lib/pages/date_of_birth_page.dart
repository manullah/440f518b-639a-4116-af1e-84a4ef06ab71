import 'package:flutter/material.dart';
import 'package:flutter_bmi/pages/calculate_page.dart';
import 'package:intl/intl.dart';

class DateOfBirthPage extends StatefulWidget {
  const DateOfBirthPage({
    super.key,
    required this.gender,
  });

  final String gender;

  @override
  State<DateOfBirthPage> createState() => _DateOfBirthPageState();
}

class _DateOfBirthPageState extends State<DateOfBirthPage> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date of Birth'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please select your date of birth:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () => _selectDate(context),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Date of Birth',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'Not selected'
                          : DateFormat('MMMM d, yyyy').format(_selectedDate!),
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_selectedDate != null)
              Text(
                'Your age: ${DateTime.now().year - _selectedDate!.year} years old',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedDate == null
                    ? null
                    : () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CalculatePage(
                            gender: widget.gender,
                            dateOfBirth: _selectedDate!,
                          ),
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
