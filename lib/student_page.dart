import 'package:flutter/material.dart';
import 'student_questionnaire_page.dart';

class StudentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bienvenue Élève", style: TextStyle(color: Colors.white))),
      body: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Prêt à évaluer ta charge mentale pour la semaine?",
              style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 10), // Ajout d'un petit espace pour mieux séparer les textes
            Text(
              "Tu vas répondre à 5 questions qui te prendra seulement 2 minutes.",
              style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StudentQuestionnairePage()),
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
