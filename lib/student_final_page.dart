import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentFinalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OctoStress", style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor, // Couleur du header uniforme
      ),
      body: Container(
        color: Color(0xFFFFF5DC), // Couleur de fond de la page
        child: Column(
          children: <Widget>[
            SizedBox(height: 20), // Petite marge par rapport au point le plus haut
            Image.asset(
              'assets/images/banniere.jpg', // Afficher l'image banniere.jpg
              fit: BoxFit.cover,
            ),
            SizedBox(height: 5), // Espace après l'image
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Nous sommes ravis de vous annoncer le lancement prochain de notre nouvelle application de gestion du temps, spécialement conçue pour les professeurs et les étudiants. Cette application vous permettra de gérer efficacement votre planning, d'organiser vos tâches quotidiennes et d'optimiser votre emploi du temps pour une meilleure productivité.",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'MerriweatherSans-Bold',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Icon(Icons.arrow_downward, color: Color(0xFFFE5000), size: 66.0), // Flèche plus grosse
                SizedBox(height: 10), // Espace entre la flèche et le texte
                GestureDetector(
                  onTap: () => _launchURL('https://www.alphaacademie.fr/'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Allez sur Alpha Académie, c'est gratuit!",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFF10069F), // Couleur du lien
                          fontSize: 18,
                          fontFamily: 'MerriweatherSans-Regular',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Icon(Icons.arrow_forward, color: Color(0xFF10069F)),
                    ],
                  ),
                ),
                SizedBox(height: 100), // Espace par rapport au bas de la page
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }
}
