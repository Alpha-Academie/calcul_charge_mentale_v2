import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart';
import 'security_page.dart'; // Importez la page de sécurité
import 'about_page.dart'; // Importez la page à propos

class SettingsPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? user;

  SettingsPage({this.user});

  Future<void> _signOut(BuildContext context) async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => MyApp()),
      (Route<dynamic> route) => false,
    );
  }

  void _confirmSignOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer le dialogue
              },
              child: Text('Non'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer le dialogue
                _signOut(context); // Effectuer la déconnexion
              },
              child: Text('Oui'),
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
        title: Text('Paramètres', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Compte'),
            subtitle: Text('${user?.displayName}\n${user?.email}'),
            isThreeLine: true,
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Sécurité et Confidentialité'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SecurityPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('À propos'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Déconnexion'),
            onTap: () => _confirmSignOut(context),
          ),
        ],
      ),
    );
  }
}
