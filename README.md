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

![image](https://github.com/user-attachments/assets/eb6b879c-c709-4864-b73e-04c38527b77c)

![image](https://github.com/user-attachments/assets/f64b3365-1a24-4205-9bee-56e6e054c6ec)

![image](https://github.com/user-attachments/assets/e57ec1b9-c8dc-4e4e-afee-eac5757473b9)

![image](https://github.com/user-attachments/assets/42c477f3-4665-4d46-804f-2e2785a9eaf0)

![image](https://github.com/user-attachments/assets/6e30b2c7-81c4-465e-8105-ea488d51bf4d)

![image](https://github.com/user-attachments/assets/48cdc529-982a-4487-9dbc-0d50dfb92bc2)

![image](https://github.com/user-attachments/assets/42fada20-c5dd-40c0-bccc-f604981250f1)




### API Integration

The app fetches quiz questions from the Open Trivia Database API:

```dart
final url = Uri.parse('https://opentdb.com/api.php?amount=6&category=18&difficulty=easy&type=multiple');

# Contribution
