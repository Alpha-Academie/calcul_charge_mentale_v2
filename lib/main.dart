import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';  // Importez le fichier de configuration Firebase
import 'google_sign_in_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF10069F), // Couleur primaire
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFFFE5000), // Couleur secondaire
        ),
        scaffoldBackgroundColor: Color(0xFFFFF5DC), // Blanc cassé
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF10069F), // Couleur primaire pour les boutons
            foregroundColor: Colors.white, // Couleur du texte des boutons
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Home Page'),
      ),
      body: Center(
        child: MyHomePageContent(),
      ),
    );
  }
}

class MyHomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Bienvenue sur votre application de calcul de charge mentale',
            style: TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.bold, 
              color: Color(0xFF10069F), // Couleur primaire pour le texte
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'Vous allez pouvoir mesurer votre charge mentale pour la semaine à venir',
            style: TextStyle(
              fontSize: 16, 
              color: Color(0xFF10069F), // Couleur primaire pour le texte
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          GoogleSignInButton(),
        ],
      ),
    );
  }
}
