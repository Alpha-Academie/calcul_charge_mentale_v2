import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À propos', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'OctoStress',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 10),
            const Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 10),
            const Text(
              'Cette application vous permet de mesurer votre charge mentale pour la semaine à venir. Utilisez-la pour mieux comprendre et gérer votre charge de travail.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              'Développeurs',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 10),
            const Text(
              'Zakaria OURAMDANI',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Text(
              'Mucahit CELIK',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              'Mentions légales',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 10),
            const Text(
              '© 2024 OctoStress. Tous droits réservés.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              'Liens utiles',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Ouvrir le lien vers le site web officiel
              },
              child: Text(
                'Site web officiel',
                style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
