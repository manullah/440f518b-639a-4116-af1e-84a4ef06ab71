import 'package:flutter/material.dart';

class BmiCard extends StatelessWidget {
  const BmiCard({
    super.key,
    required this.bmi,
  });

  final double bmi;

  String get bmiCategory {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  Color get bmiColor {
    if (bmi < 18.5) return Colors.blue;
    if (bmi < 25) return Colors.green;
    if (bmi < 30) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: bmiColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your BMI',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  _getBMIIcon(),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                bmi.toStringAsFixed(1),
                style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                bmiCategory,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                _getBMIMessage(),
                style: const TextStyle(fontSize: 14, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getBMIIcon() {
    IconData icon;
    double size = 40;
    if (bmi < 18.5) {
      icon = Icons.fitness_center;
    } else if (bmi < 25) {
      icon = Icons.favorite;
    } else if (bmi < 30) {
      icon = Icons.restaurant;
    } else {
      icon = Icons.warning;
    }
    return Icon(icon, size: size, color: Colors.white);
  }

  String _getBMIMessage() {
    if (bmi < 18.5) {
      return "You're in the underweight range. Focus on nutrient-rich foods and consider consulting a nutritionist.";
    } else if (bmi < 25) {
      return "Great job! You're in the healthy weight range. Keep maintaining a balanced diet and regular exercise.";
    } else if (bmi < 30) {
      return "You're in the overweight range. Consider increasing physical activity and making dietary adjustments.";
    } else {
      return "You're in the obese range. It's recommended to consult with a healthcare professional for personalized advice.";
    }
  }
}
