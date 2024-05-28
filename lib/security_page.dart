import 'package:flutter/material.dart';

class SecurityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sécurité et Confidentialité', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Protection des données',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 10),
            Text(
              'Nous mettons en œuvre diverses mesures de sécurité pour protéger vos données personnelles lorsque vous utilisez notre application.',
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            SizedBox(height: 20),
            Text(
              'Collecte de données',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 10),
            Text(
              'Nous collectons les types de données suivants :\n'
              '- Informations personnelles (nom, email, etc.)\n'
              '- Données d\'utilisation de l\'application',
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            SizedBox(height: 20),
            Text(
              'Utilisation des données',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 10),
            Text(
              'Les données collectées sont utilisées pour :\n'
              '- Améliorer notre application\n'
              '- Personnaliser votre expérience\n'
              '- Fournir un support client efficace',
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            SizedBox(height: 20),
            Text(
              'Partage des données',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 10),
            Text(
              'Nous ne partageons vos données qu\'avec :\n'
              '- Nos partenaires de confiance\n'
              '- Les fournisseurs de services nécessaires à l\'application',
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            SizedBox(height: 20),
            Text(
              'Droits des utilisateurs',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 10),
            Text(
              'Vous avez le droit d\'accéder, de corriger ou de supprimer vos données personnelles. Pour exercer ces droits, veuillez nous contacter.',
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            SizedBox(height: 20),
            Text(
              'Sécurité',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 10),
            Text(
              'Nous utilisons des technologies de sécurité avancées pour protéger vos données, y compris le cryptage et l\'authentification.',
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            SizedBox(height: 20),
            Text(
              'Modifications de la politique',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 10),
            Text(
              'Nous pouvons mettre à jour cette politique de confidentialité de temps à autre. Nous vous informerons de tout changement en publiant la nouvelle politique sur cette page.',
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }
}
