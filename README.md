# Flutter BMI Calculator

This is a BMI (Body Mass Index) calculator application built with Flutter. It allows users to input their personal data and body measurements to calculate their BMI, providing a visual representation of their health status.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Make sure you have Flutter installed on your machine. For installation instructions, see the official [Flutter website](https://flutter.dev/docs/get-started/install).
- An IDE of your choice (e.g., Android Studio, VS Code)

### Installing

1. Clone the repository:
   ```
   git clone https://github.com/manullah/440f518b-639a-4116-af1e-84a4ef06ab71
   ```
2. Navigate to the project directory:
   ```
   cd 440f518b-639a-4116-af1e-84a4ef06ab71
   ```
3. Get the dependencies:
   ```
   flutter pub get
   ```

### Running the app

To run the app, use the following command in the project directory:

```
flutter run
```

Make sure you have an emulator running or a device connected to your machine.

## Packages Used

This project uses the following packages:

1. **intl: ^0.17.0**

   - Purpose: For internationalization and date formatting.
   - Usage: We use this to format the date of birth in the profile page.

2. **flutter/material.dart**
   - Purpose: This is the core Flutter framework for building the UI.
   - Usage: Used throughout the app for creating the user interface.

## Features

- Onboarding flow with gender selection and date of birth input
- Body measurements input form
- BMI calculation
- Visual representation of BMI status
- Profile page displaying all user information

## Project Structure

- `main.dart`: Entry point of the application
- `welcome_page.dart`: Welcome screen
- `gender_selection_page.dart`: Gender selection screen
- `date_of_birth_page.dart`: Date of birth input screen
- `calculation_page.dart`: Body measurements input form
- `profile_page.dart`: Profile page with BMI calculation and visualization
