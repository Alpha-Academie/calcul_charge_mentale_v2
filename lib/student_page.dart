import 'package:flutter/material.dart';
import 'student_questionnaire_page.dart';

class StudentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenue Élève", style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/trace_orange.png',
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/trace_bleue.png',
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(flex: 2), // Pour pousser le texte vers le haut
                Text(
                  "Prêt à évaluer ta charge mentale pour la semaine ?",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'MerriweatherSans-Bold',
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/eleve.png',
                  height: 150, // Taille de l'image
                  fit: BoxFit.contain,
                ),
                Spacer(flex: 1),
                Column(
                  children: [
                    Text(
                      "Tu vas répondre à 5 questions qui te prendront seulement 2 minutes.",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'MerriweatherSans-Regular',
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => StudentQuestionnairePage()),
                        );
                      },
                      child: Text(
                        "Commencer le questionnaire",
                        style: TextStyle(
                          fontFamily: 'MerriweatherSans-Light',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
