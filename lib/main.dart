import 'package:flutter/material.dart';
// Replace direct import from dart:ui
import 'dart:ui' as ui show Canvas, Paint, Path, lerpDouble;
import 'package:image_picker/image_picker.dart';
import 'package:my_projetct_quiz_game/question_model.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Use Flutter framework equivalent imports
import 'package:flutter/widgets.dart' show Canvas, Paint, Path;
import 'package:flutter/foundation.dart' show lerpDouble;
import '\constants.dart';
import 'question_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 3, 62, 66),
        useMaterial3: true,
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 35, 
        title: const Text('MindMelter',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
        titleTextStyle: const TextStyle(color: Colors.black),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          },
          icon: const Icon(Icons.menu, size: 40),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profil()),
              );
            },
            icon: const Icon(Icons.account_circle, size: 45),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share, size: 40),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to MindMelter !',
                style: TextStyle(fontSize: 30.0, fontFamily: 'Poppins')),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/first_images4.png',
              width: 300,
              height: 300,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PlayPage()),
                );
              },
              child: const Text(
                'Play',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _isSoundOn = true;
  
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(padding: const EdgeInsets.all(16.0), children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: _darkMode,
            onChanged: (bool value) {
              setState(() {
                _darkMode = value;
              });
            },
            secondary: const Icon(Icons.brightness_4),
          ),
          SwitchListTile(
            title: const Text('Sound'),
            value: _isSoundOn,
            onChanged: (bool value) {
              setState(() {
                _isSoundOn = true;
              });
            },
            secondary: const Icon(Icons.volume_up),
          ),
          ListTile(
            title: const Text('Change Password'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.lock,
                  color: Color.fromARGB(255, 19, 109, 212), size: 35),
            ),
          ),
          ListTile(
            title: const Text('Sign Out'),
            
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.exit_to_app, size: 35),
            ),
          ),
          ListTile(
            title: const Text('Report a Problem'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.report, color: Colors.yellow, size: 35),
            ),
          ),
          ListTile(
            title: const Text('Delete account'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.cancel, color: Colors.red, size: 35),
            ),
          ),
        ]));
  }
}

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}
////////////////////////////////////////////
Future<void> saveHighScore(int score) async {
  final prefs = await SharedPreferences.getInstance();
  int? highScore = prefs.getInt('highScore') ?? 0;

  if (score > highScore) {
    await prefs.setInt('highScore', score);
  }
}

Future<int> loadHighScore() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('highScore') ?? 0;
}
class _ProfilState extends State<Profil> {
  final TextEditingController _controller = TextEditingController();
  String _profileName = '';
  File? _image;
  int _highScore = 0;

  
  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int highScore = await loadHighScore();
    setState(() {
      _profileName = prefs.getString('profileName') ?? '';
      String imagePath = prefs.getString('profileImage') ?? '';
      if (imagePath.isNotEmpty) {
        _image = File(imagePath);
      }
       _highScore = highScore;
    
    });
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _saveImageToDisk(_image!); 
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _saveImageToDisk(File imageFile) async {
    try {
      final directory = await getApplicationDocumentsDirectory();

      String filePath =
          '${directory.path}/my_image.png';
      File newImage = File(filePath);

      await newImage.writeAsBytes(await imageFile.readAsBytes());

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('profileImage', filePath);

      print('Image saved to: $filePath');
    } catch (e) {
      print('Error saving image: $e');
    }
  }

  Future<void> _saveProfileName(String profileName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('profileName', profileName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: _getImage,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                backgroundImage: _image != null
                    ? FileImage(_image!) 
                    : const AssetImage('assets/images/default_avatar.png'),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Text(
                _profileName.isNotEmpty
                    ? _profileName
                    : 'Enter your profile name',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter your profile name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _profileName = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                await _saveProfileName(_profileName);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Saved: $_profileName')),
                );
              },
              child: const Text('Save Profile Name'),
            ),
             const SizedBox(height: 16.0),
            Center(
              child: Container(
                padding: EdgeInsets.all(10.0), 
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 214, 134, 128), width: 2.0),  
                  borderRadius: BorderRadius.circular(10.0), 
                ),
                child: Text(
                  'High Score: $_highScore',
                  style: TextStyle(
                    fontSize: 24.0,  
                    fontWeight: FontWeight.bold,  
                    color: const Color.fromARGB(255, 16, 123, 159),  
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

//··················Play·························
class PlayPage extends StatefulWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  List<Question> _questions = [];
  int index = 0;
  int _highScore = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;

  @override
  void initState() {
    super.initState();
    _loadHighScore();
    fetchQuestions();
  }

 
  Future<void> _loadHighScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _highScore = prefs.getInt('highScore') ?? 0;
    });
  }

  Future<void> _saveHighScore(int newHighScore) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('highScore', newHighScore);
    setState(() {
      _highScore = newHighScore;
    });
  }

  void updateHighScore(int newScore) {
    if (newScore > _highScore) {
      _saveHighScore(newScore);
    }
  }
  
  Future<void> fetchQuestions() async {
    final url = Uri.parse('https://opentdb.com/api.php?amount=10&category=18&difficulty=easy');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final List<Map<String, dynamic>> results =
            List<Map<String, dynamic>>.from(jsonResponse['results']);

        setState(() {
          _questions = results.map((q) => Question.fromJson(q)).toList();
        });
      } else {
        throw Exception('Failed to load questions');
      }
    } catch (e) {
      print('Error fetching questions: $e');
    }
  }

  void checkAnswerAndUpdate(String selectedOption) {
    if (isAlreadySelected) {
      return;
    } else {
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });

      if (selectedOption == _questions[index].correctAnswer) {
        setState(() {
          score++;
          updateHighScore(score);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Incorrect! The correct answer is: ${_questions[index].correctAnswer}',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 30.0),
        ));
      }
    }
  }

  void nextQuestion() {
    if (index == _questions.length - 1) {
      showDialog(
        context: context,
        builder: (ctx) => ResultBox(
          result: score,
          questionLength: _questions.length,
          onReplay: replayQuiz,
        ),
      );
    } else {
      setState(() {
        index++;
        isPressed = false;
        isAlreadySelected = false;
      });
    }
  }

  void replayQuiz() {
    Navigator.of(context).pop();
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MindMenter'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Score: $score',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          
        ],
      ),
      body: _questions.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                QuestionWidget(
                  indexAction: index,
                  question: _questions[index].question,
                  totalquestion: _questions.length,
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                ..._questions[index].options.map(
                  (option) => GestureDetector(
                    onTap: () => checkAnswerAndUpdate(option),
                    child: OptionCard(
                      option: option,
                      color: isPressed
                          ? option == _questions[index].correctAnswer
                              ? Colors.green
                              : Colors.red
                          : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: nextQuestion,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    required this.question,
    required this.indexAction,
    required this.totalquestion,
  }) : super(key: key);

  final String question;
  final int indexAction;
  final int totalquestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Question ${indexAction + 1}/$totalquestion: $question',
        style: const TextStyle(
          fontSize: 24.0,
          color: Colors.black,
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    required this.option,
    required this.color,
  }) : super(key: key);

  final String option;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          option,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22.0, color: Colors.black),
        ),
      ),
    );
  }
}

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key? key,
    required this.result,
    required this.questionLength,
    required this.onReplay,
  }) : super(key: key);

  final int result;
  final int questionLength;
  final VoidCallback onReplay;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Result',
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 55.0,
              backgroundColor: Colors.blue,
              child: Text(
                '$result/$questionLength',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onReplay,
              child: Text('Replay'),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<String> options;

  Question({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    List<String> allOptions = List<String>.from(json['incorrect_answers']);
    allOptions.add(json['correct_answer']);
    allOptions.shuffle();

    return Question(
      category: json['category'],
      type: json['type'],
      difficulty: json['difficulty'],
      question: json['question'],
      correctAnswer: json['correct_answer'],
      options: allOptions,
    );
  }
}