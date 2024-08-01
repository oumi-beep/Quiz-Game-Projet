# MindMelter Quiz Game

**MindMelter** is an engaging quiz game built with Flutter. It features a user-friendly interface, allows for high score tracking, and includes settings for customizing the experience.

## Features

- **Play Mode**: Users can play a quiz game with multiple-choice questions.
- **Profile Management**: Users can manage their profile, including updating their profile picture and name.
- **Settings**: Options for dark mode and sound settings.
- **High Score Tracking**: Tracks and displays the highest score achieved.

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

If you would like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a feature branch.
3. Make your changes.
4. Submit a pull request.
 
