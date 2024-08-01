# MindMelter Quiz Game

**MindMelter** is an engaging quiz game built with Flutter. It features a user-friendly interface, allows for high score tracking, and includes settings for customizing the experience.
MindMelter is an interactive quiz app designed to challenge your knowledge with multiple-choice questions. The app features various functionalities like user profile management, high score tracking, and customizable settings.

## Features

- **Home Screen**: Displays a welcome message and provides navigation to the `PlayPage` and `SettingsPage`.
- **Settings Page**: Allows users to toggle dark mode, sound settings, change password, sign out, report problems, and delete their account.
- **Profile Page**: Users can view and edit their profile, upload a profile picture, and see their high score.
- **Play Page**: Users can start the quiz, answer questions, and view their score.







![image](https://github.com/user-attachments/assets/42fada20-c5dd-40c0-bccc-f604981250f1)


## Screens

### 1. Home Screen

The `HomeScreen` displays a welcome message and provides buttons to navigate to the `PlayPage` and `SettingsPage`.

![image](https://github.com/user-attachments/assets/eb6b879c-c709-4864-b73e-04c38527b77c)

### 2. Settings Page

The `SettingsPage` allows users to:
- Toggle Dark Mode.
- Enable/Disable Sound.
- Change Password.
- Sign Out.
- Report Problems.
- Delete Account.
  
![image](https://github.com/user-attachments/assets/e57ec1b9-c8dc-4e4e-afee-eac5757473b9)

### 3. Profile Page

The `ProfilePage` includes:
- Profile picture (click to update).
- Profile name (editable).
- Display of high score.
  
![image](https://github.com/user-attachments/assets/f64b3365-1a24-4205-9bee-56e6e054c6ec)

### 4. Play Page

The `PlayPage` displays:
- The current question and options.
  
![image](https://github.com/user-attachments/assets/42c477f3-4665-4d46-804f-2e2785a9eaf0)

![image](https://github.com/user-attachments/assets/6e30b2c7-81c4-465e-8105-ea488d51bf4d)

- A score counter.
- A result dialog after finishing the quiz.

![image](https://github.com/user-attachments/assets/48cdc529-982a-4487-9dbc-0d50dfb92bc2)

### 5. Help Page (New)

The `HelpPage` provides:
- Instructions on how to play the game.
- Tips for answering questions.
- Contact information for support.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- An IDE such as Android Studio, IntelliJ IDEA, or VSCode

### Setup

1. **Clone the Repository**

   ```bash
   git clone https://github.com/oum-beep/MindMelter.git

2. **Navigate to Project Directory**

   - cd your-repository

3. **Install Dependencies**
   - flutter pub get

4. **Run the Application**
   -flutter run

## Project Structure

### Main Entry Point

- **`main.dart`**: Contains the `MyApp` widget, the main entry point of the application.

### Widgets

- **`MyApp`**: The root widget that sets up the theme and home page.
- **`MyWidget`**: The landing page with navigation to play the game or access settings.
- **`SettingsPage`**: Allows users to toggle dark mode and sound settings, and manage account settings.
- **`Profil`**: Allows users to update their profile name and picture, and view their high score.
- **`PlayPage`**: Handles the quiz gameplay, question fetching, and score tracking.
- **`QuestionWidget`**: Displays the current question.
- **`OptionCard`**: Represents an answer option for the current question.
- **`ResultBox`**: Displays the result after completing the quiz.

### Models

- **`Question`**: Defines the structure for quiz questions and their options.

### Dependencies

- **`flutter/material.dart`**: For building the UI with Material Design components.
- **`image_picker`**: For picking images from the gallery.
- **`path_provider`**: For accessing the device's file system.
- **`shared_preferences`**: For storing user preferences and high scores.
- **`http`**: For making network requests.
- **`dart:convert`**: For decoding JSON responses.



### API Integration

The app fetches quiz questions from the Open Trivia Database API:

```dart
final url = Uri.parse('https://opentdb.com/api.php?amount=6&category=18&difficulty=easy&type=multiple');

# Contribution
