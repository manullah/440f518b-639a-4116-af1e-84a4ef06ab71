import 'package:flutter/material.dart';
import 'package:flutter_bmi/pages/gender_selection_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Scale App,\nyour personal health tracker!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text('Get Started'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const GenderSelectionPage(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
