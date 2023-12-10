import 'package:flutter/material.dart';
import 'package:wubrg_app/screens/gamePhrase.dart';
import 'package:share/share.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const EndGame());
}

class EndGame extends StatelessWidget {
  const EndGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EndGamePhrase Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        useMaterial3: false,
      ),
      home: const EndGamePhrase(title: 'End Game Phrase'),
    );
  }
}

class EndGamePhrase extends StatefulWidget {
  const EndGamePhrase({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<EndGamePhrase> createState() => _EndGamePhrase();
}

class _EndGamePhrase extends State<EndGamePhrase> {
  // Function to share the game result
  void _shareOnSocialMedia(int score) async {
    String currentDate = DateFormat.yMd().format(DateTime.now());
    String message = "Today $currentDate I scored $score on WUBRG Drafter";

    // Share on Facebook
    Share.share(message, subject: 'WUBRG Drafter Score');

    // // Share on Twitter
    // String twitterUrl = 'https://twitter.com/intent/tweet?text=${Uri.encodeComponent(message)}';
    // if (await canLaunch(twitterUrl)) {
    //   await launch(twitterUrl);
    // } else {
    //   print('Could not launch Twitter');
    // }

    // // Share on Instagram
    // String instagramUrl = 'https://www.instagram.com/create/story/?text=${Uri.encodeComponent(message)}';
    // if (await canLaunch(instagramUrl)) {
    //   await launch(instagramUrl);
    // } else {
    //   print('Could not launch Instagram');
    // }
  }

  // Function to share the game result
  void _shareOnTwitter(int score) async {
    String currentDate = DateFormat.yMd().format(DateTime.now());
    String message = "Today $currentDate I scored $score on WUBRG Drafter";

    // String twitterUrl = 'https://twitter.com/intent/tweet?text=${Uri.encodeComponent(message)}';
    // if (await canLaunch(twitterUrl)) {
    //   await launch(twitterUrl);
    // } else {
    //   print('Could not launch Twitter');
    // }
    Share.share('Twitter: $message', subject: 'WUBRG Drafter Score');
  }

  void _shareOnFacebook(int score) async {
    String currentDate = DateFormat.yMd().format(DateTime.now());
    String message = "Today $currentDate I scored $score on WUBRG Drafter";

    // String facebookUrl = 'https://www.facebook.com/sharer/sharer.php?u=${Uri.encodeComponent(message)}';
    // if (await canLaunch(facebookUrl)) {
    //   await launch(facebookUrl);
    // } else {
    //   print('Could not launch Facebook');
    // }
    Share.share('Facebook: $message', subject: 'WUBRG Drafter Score');
  }

  void _shareOnInstagram(int score) async {
    String currentDate = DateFormat.yMd().format(DateTime.now());
    String message = "Today $currentDate I scored $score on WUBRG Drafter";

    // String instagramUrl = 'https://www.instagram.com/create/story/?text=${Uri.encodeComponent(message)}';
    // if (await canLaunch(instagramUrl)) {
    //   await launch(instagramUrl);
    // } else {
    //   print('Could not launch Instagram');
    // }
    Share.share('Instagram: $message', subject: 'WUBRG Drafter Score');
  }

  @override
  Widget build(BuildContext context) {
    int finalScore = 97; // Replace with your actual final score

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Your Score:',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    '97',
                    style: TextStyle(fontSize: 70),
                  ),
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Share on Social Media',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _shareOnTwitter(finalScore),
                      child: const Text('Twitter'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => _shareOnFacebook(finalScore),
                      child: const Text('Facebook'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => _shareOnInstagram(finalScore),
                      child: const Text('Instagram'),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    // Navigate to the GamePhrase widget when the button is pressed
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const GamePhrase()),
                    );
                  },
                  child: const Text(
                    'Play again',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.center,
                  child: ExpansionTile(
                    title: Text('What you could have done better'),
                    children: <Widget>[
                      ListTile(
                        title: Text('This is what the AI picked.'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
