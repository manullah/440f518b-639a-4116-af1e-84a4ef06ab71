import 'package:flutter/material.dart';
import 'package:flutter_bmi/components/bmi_card.dart';
import 'package:flutter_bmi/components/info_row.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.gender,
    required this.dateOfBirth,
    required this.weight,
    required this.height,
    this.bodyFat,
    this.muscleMass,
    this.visceralFat,
    this.basalMetabolism,
  });

  final String gender;
  final DateTime dateOfBirth;
  final double weight;
  final double height;
  final double? bodyFat;
  final double? muscleMass;
  final int? visceralFat;
  final int? basalMetabolism;

  double get bmi => weight / ((height / 100) * (height / 100));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile Overview',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildInfoCard(),
            const SizedBox(height: 24),
            Text(
              'BMI Calculation',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            BmiCard(bmi: bmi)
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoRow(
              label: 'Gender',
              value: gender,
            ),
            InfoRow(
              label: 'Date of Birth',
              value: DateFormat('yyyy-MM-dd').format(dateOfBirth),
            ),
            InfoRow(
              label: 'Weight',
              value: '$weight kg',
            ),
            InfoRow(
              label: 'Height',
              value: '$height cm',
            ),
            if (bodyFat != null)
              InfoRow(
                label: 'Body Fat',
                value: '$bodyFat%',
              ),
            if (muscleMass != null)
              InfoRow(
                label: 'Muscle Mass',
                value: '$muscleMass kg',
              ),
            if (visceralFat != null)
              InfoRow(
                label: 'Visceral Fat',
                value: '$visceralFat',
              ),
            if (basalMetabolism != null)
              InfoRow(
                label: 'Basal Metabolism',
                value: '$basalMetabolism kcal',
              ),
          ],
        ),
      ),
    );
  }
}
