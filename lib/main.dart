import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Importez le fichier de configuration Firebase
import 'google_sign_in_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Utilisation du super paramètre pour la clé

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF10069F), // Couleur primaire
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFFE5000), // Couleur secondaire
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF5DC), // Blanc cassé
        appBarTheme: const AppBarTheme(
          color: Color(0xFF10069F), // Couleur primaire pour le header
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20), // Texte blanc pour le header
          iconTheme: IconThemeData(color: Colors.white), // Icônes blanches pour le header
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF10069F), // Couleur primaire pour les boutons
            foregroundColor: Colors.white, // Couleur du texte des boutons
            textStyle: const TextStyle(
              fontFamily: 'MerriweatherSans',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key}); // Utilisation du super paramètre pour la clé

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OctoStress'), // Ajout de const ici
      ),
      body: Stack(
        children: [
          Positioned(
            top: 125,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/logo.png',
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
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
          const Center(
            child: MyHomePageContent(), // Ajout de const ici
          ),
        ],
      ),
    );
  }
}

class MyHomePageContent extends StatelessWidget {
  const MyHomePageContent({super.key}); // Utilisation du super paramètre pour la clé

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 50), // Espace pour les images en haut
          const Text(
            'Bienvenue sur votre application de calcul de charge mentale OctoStress !',
            style: TextStyle(
              fontFamily: 'MerriweatherSans',
              fontSize: 24, // Taille plus grande
              fontWeight: FontWeight.bold, // Police en gras
              color: Color(0xFF10069F), // Couleur primaire pour le texte
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'Vous allez pouvoir mesurer votre charge mentale pour la semaine à venir',
            style: TextStyle(
              fontFamily: 'MerriweatherSans',
              fontSize: 16, // Taille un peu plus grande
              color: Colors.black, // Couleur noire pour le texte
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          GoogleSignInButton(), // Suppression de const ici
        ],
      ),
    );
  }
}
