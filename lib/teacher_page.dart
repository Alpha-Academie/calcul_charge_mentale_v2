import 'package:flutter/material.dart';
import 'teacher_questionnaire_page.dart';

class TeacherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bienvenue")),
      body: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Prêt à évaluer votre charge mentale pour la semaine ?",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10), // Ajout d'un petit espace pour mieux séparer les textes
            Text("Vous allez répondre à 6 questions qui vous prendrons seulement 2 minutes.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TeacherQuestionnairePage()),
                );
              },
              child: Text("Commencer le questionnaire"),
            ),
          ],
        ),
      ),
    );
  }
}
