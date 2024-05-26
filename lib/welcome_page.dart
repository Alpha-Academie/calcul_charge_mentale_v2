import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'teacher_page.dart';
import 'student_page.dart';

class WelcomePage extends StatelessWidget {
  final GoogleSignInAccount? user;

  WelcomePage({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bienvenue')),
      body: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Bonjour et bienvenue, ${user?.displayName ?? "Cher utilisateur"}!",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text("Choisissez votre fonction :"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TeacherPage()),
                );
              },
              child: Text('Je suis professeur'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StudentPage()),
                );
              },
              child: Text('Je suis élève'),
            ),
          ],
        ),
      ),
    );
  }
}
