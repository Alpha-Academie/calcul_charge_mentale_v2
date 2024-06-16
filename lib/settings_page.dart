import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart';
import 'about_page.dart';
import 'security_page.dart';

class SettingsPage extends StatefulWidget {
  final User? user;

  const SettingsPage({super.key, this.user}); // Ajout du super paramètre

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const MyApp()), // Ajout de const
      (Route<dynamic> route) => false,
    );
  }

  void _confirmSignOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Confirmation',
            style: TextStyle(fontFamily: 'MerriweatherSans-Bold', color: Colors.white),
          ),
          content: const Text(
            'Êtes-vous sûr de vouloir vous déconnecter ?',
            style: TextStyle(fontFamily: 'MerriweatherSans-Light', color: Colors.white),
          ),
          backgroundColor: const Color(0xFF10069F),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer le dialogue
              },
              child: const Text('Non'), // Ajout de const
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer le dialogue
                _signOut(context); // Effectuer la déconnexion
              },
              child: const Text('Oui'), // Ajout de const
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres', style: TextStyle(color: Colors.white)), // Ajout de const
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.account_circle), // Ajout de const
            title: const Text('Compte'), // Ajout de const
            subtitle: Text('${widget.user?.displayName}\n${widget.user?.email}'),
            isThreeLine: true,
          ),
          ListTile(
            leading: const Icon(Icons.security), // Ajout de const
            title: const Text('Sécurité et Confidentialité'), // Ajout de const
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SecurityPage()), // Ajout de const
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info), // Ajout de const
            title: const Text('À propos'), // Ajout de const
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AboutPage()), // Ajout de const
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app), // Ajout de const
            title: const Text('Déconnexion'), // Ajout de const
            onTap: () => _confirmSignOut(context),
          ),
        ],
      ),
    );
  }
}
