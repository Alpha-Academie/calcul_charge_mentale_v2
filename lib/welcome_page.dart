import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'settings_page.dart'; // Importez la nouvelle page des paramètres
import 'teacher_page.dart';
import 'student_page.dart';

class WelcomePage extends StatelessWidget {
  final User? user;

  WelcomePage({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenue', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SettingsPage(user: user)),
              );
            },
          ),
        ],
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
                Spacer(flex: 3),  // Pour pousser le texte de bienvenue vers le haut
                Text(
                  "Bonjour ${user?.displayName ?? "Cher utilisateur"} 😊",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'MerriweatherSans-Bold',
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold, // Mettre en gras
                  ),
                  textAlign: TextAlign.center,
                ),
                Spacer(flex: 1),  // Ajouter de l'espace après le texte de bienvenue
                Text(
                  "Choisissez votre rôle :",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'MerriweatherSans-Regular',
                    color: Colors.black, // Changer la couleur en noir
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => TeacherPage()),
                          );
                        },
                        child: Text(
                          'Je suis professeur',
                          style: TextStyle(
                            fontFamily: 'MerriweatherSans-Light',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Plus d'espace entre les boutons
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => StudentPage()),
                          );
                        },
                        child: Text(
                          'Je suis élève',
                          style: TextStyle(
                            fontFamily: 'MerriweatherSans-Light',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 4),  // Ajouter de l'espace après les boutons
              ],
            ),
          ),
        ],
      ),
    );
  }
}
