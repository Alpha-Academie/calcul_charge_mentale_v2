import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'welcome_page.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _auth.signInWithCredential(credential);

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        bool hasSeenNewsletterMessage = prefs.getBool('hasSeenNewsletterMessage_${googleUser.id}') ?? false;

        if (!hasSeenNewsletterMessage) {
          await _showNewsletterDialog(context, googleUser.email);
          await prefs.setBool('hasSeenNewsletterMessage_${googleUser.id}', true);
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomePage(user: FirebaseAuth.instance.currentUser),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur de connexion : ${e.toString()}'),
        ),
      );
    }
  }

  Future<void> _showNewsletterDialog(BuildContext context, String? email) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Inscription à la Newsletter',
            style: TextStyle(fontFamily: 'MerriweatherSans-Bold'),
          ),
          content: Text(
            'En vous connectant, vous acceptez que votre adresse e-mail (${email ?? 'non fournie'}) soit utilisée pour vous inscrire à notre newsletter. Si vous ne le souhaitez pas, veuillez nous contacter.',
            style: TextStyle(fontFamily: 'MerriweatherSans-Light'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _signInWithGoogle,
      icon: Icon(Icons.login, color: Colors.white),
      label: Text('Se connecter avec Google', style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
