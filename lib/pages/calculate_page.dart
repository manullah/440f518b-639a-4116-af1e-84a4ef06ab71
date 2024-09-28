import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bmi/pages/profile_page.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({
    super.key,
    required this.gender,
    required this.dateOfBirth,
  });

  final String gender;
  final DateTime dateOfBirth;

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _bodyFatController = TextEditingController();
  final _muscleMassController = TextEditingController();
  final _visceralFatController = TextEditingController();
  final _basalMetabolismController = TextEditingController();

  final Map<String, String?> _errors = {
    'weight': null,
    'height': null,
    'bodyFat': null,
    'muscleMass': null,
    'visceralFat': null,
    'basalMetabolism': null,
  };

  String? _validateWeight(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your weight';
    }
    final weight = double.tryParse(value);
    if (weight == null || weight <= 0 || weight >= 999.9) {
      return 'Please enter a valid weight';
    }
    return null;
  }

  String? _validateHeight(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your height';
    }
    final height = double.tryParse(value);
    if (height == null || height <= 0 || height >= 999.9) {
      return 'Please enter a valid height';
    }
    return null;
  }

  String? _validateOptionalDouble(String? value, double min, double max) {
    if (value == null || value.isEmpty) return null;
    final number = double.tryParse(value);
    if (number == null || number < min || number > max) {
      return 'Please enter a valid value between $min and $max';
    }
    return null;
  }

  String? _validateOptionalInt(String? value, int min, int max) {
    if (value == null || value.isEmpty) return null;
    final number = int.tryParse(value);
    if (number == null || number < min || number > max) {
      return 'Please enter a valid value between $min and $max';
    }
    return null;
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required String fieldName,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.number,
    List<TextInputFormatter>? inputFormatters,
    String? suffixText,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixText: suffixText,
        ),
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        validator: validator,
        onChanged: (value) {
          setState(() {
            _errors[fieldName] = validator(value);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculate Weight'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Please enter your body measurements:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _weightController,
                  label: 'Berat Badan (Kg)',
                  icon: Icons.fitness_center,
                  fieldName: 'weight',
                  validator: _validateWeight,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,1}')),
                  ],
                  suffixText: 'kg',
                ),
                _buildTextField(
                  controller: _heightController,
                  label: 'Tinggi Badan (Cm)',
                  icon: Icons.height,
                  fieldName: 'height',
                  validator: _validateHeight,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,1}')),
                  ],
                  suffixText: 'cm',
                ),
                _buildTextField(
                  controller: _bodyFatController,
                  label: 'Body Fat (%) - Optional',
                  icon: Icons.opacity,
                  fieldName: 'bodyFat',
                  validator: (value) => _validateOptionalDouble(value, 0, 99.9),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,1}')),
                  ],
                  suffixText: '%',
                ),
                _buildTextField(
                  controller: _muscleMassController,
                  label: 'Muscle Mass (Kg) - Optional',
                  icon: Icons.fitness_center,
                  fieldName: 'muscleMass',
                  validator: (value) => _validateOptionalDouble(value, 0, 99.9),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,1}')),
                  ],
                  suffixText: 'kg',
                ),
                _buildTextField(
                  controller: _visceralFatController,
                  label: 'Visceral Fat (1-12) - Optional',
                  icon: Icons.accessibility_new,
                  fieldName: 'visceralFat',
                  validator: (value) => _validateOptionalInt(value, 1, 12),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                _buildTextField(
                  controller: _basalMetabolismController,
                  label: 'Basal Metabolism (Kcal) - Optional',
                  icon: Icons.local_fire_department,
                  fieldName: 'basalMetabolism',
                  validator: (value) => _validateOptionalInt(value, 0, 9999),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  suffixText: 'kcal',
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          !_errors.values.any((error) => error != null)) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProfilePage(
                            gender: widget.gender,
                            dateOfBirth: widget.dateOfBirth,
                            weight: double.parse(_weightController.text),
                            height: double.parse(_heightController.text),
                            bodyFat: double.tryParse(_bodyFatController.text),
                            muscleMass:
                                double.tryParse(_muscleMassController.text),
                            visceralFat:
                                int.tryParse(_visceralFatController.text),
                            basalMetabolism:
                                int.tryParse(_basalMetabolismController.text),
                          ),
                        ));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
