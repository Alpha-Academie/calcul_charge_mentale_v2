import 'package:flutter/material.dart';

class ResultsDisplayPage extends StatelessWidget {
  final double totalHours;

  ResultsDisplayPage({Key? key, required this.totalHours}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String result;
    List<String> advice;
    String imagePath;
    Color backgroundColor;

    if (totalHours <= 22) {
      result = "Aucune ou très peu de charge mentale ressentie. Le travail est perçu comme facile, sans stress ni pression.";
      advice = [
        "- Profitez de ce moment de faible charge mentale pour vous détendre et prendre du temps pour vous-même.",
        "- Utilisez ce temps pour planifier et organiser vos tâches à venir afin de maintenir une charge mentale minimale."
      ];
      imagePath = 'assets/images/smiley_happy.png'; // Happy smiley image
      backgroundColor = Colors.green[200]!;
    } else if (totalHours <= 27) {
      result = "Faible : Une charge mentale légèrement perceptible, mais gérable.";
      advice = [
        "- Restez concentré sur vos tâches, mais n'hésitez pas à prendre des pauses régulières pour vous reposer et vous ressourcer.",
        "- Utilisez des techniques de gestion du temps pour optimiser votre efficacité et réduire le stress associé aux tâches à accomplir."
      ];
      imagePath = 'assets/images/smiley_slightly.png'; // Slightly happy smiley image
      backgroundColor = Colors.yellow[200]!;
    } else if (totalHours <= 32) {
      result = "Modérée : Une charge mentale notable, mais encore gérable.";
      advice = [
        "- Priorisez vos tâches en fonction de leur importance et de leur urgence pour mieux gérer votre charge mentale.",
        "- Prenez des pauses stratégiques pour vous détendre et recharger vos batteries, en évitant les distractions inutiles."
      ];
      imagePath = 'assets/images/smiley_neutral.png'; // Neutral smiley image
      backgroundColor = Colors.orange[200]!;
    } else if (totalHours <= 37) {
      result = "Élevée : Une charge mentale significative et perceptible.";
      advice = [
        "- Décomposez vos tâches en petites étapes plus gérables et concentrez-vous sur une chose à la fois pour réduire le sentiment d'overwhelm.",
        "- N'hésitez pas à demander de l'aide à vos collègues ou à votre supérieur si vous vous sentez dépassé par la charge de travail."
      ];
      imagePath = 'assets/images/smiley_sad.png'; // Sad smiley image
      backgroundColor = Colors.red[200]!;
    } else {
      result = "Très Élevée : Une charge mentale extrêmement élevée et difficile à gérer.";
      advice = [
        "- Prenez du recul et identifiez les tâches les plus urgentes et importantes à accomplir, en mettant de côté celles qui peuvent être reportées.",
        "- Accordez-vous du temps pour vous reposer et récupérer, même si cela signifie ajuster votre emploi du temps ou déléguer certaines tâches."
      ];
      imagePath = 'assets/images/smiley_very_sad.png'; // Very sad smiley image
      backgroundColor = Colors.red[300]!;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Résultat de votre évaluation", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        color: backgroundColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centrer verticalement
              crossAxisAlignment: CrossAxisAlignment.center, // Centrer horizontalement
              children: <Widget>[
                Image.asset(imagePath, height: 100), // Afficher le smiley correspondant
                SizedBox(height: 20),
                Text(result, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center), // Centrer le texte horizontalement
                SizedBox(height: 20),
                ...advice.map((e) => Text(e, style: TextStyle(fontSize: 18), textAlign: TextAlign.center)).toList(), // Centrer chaque conseil horizontalement
              ],
            ),
          ),
        ),
      ),
    );
  }
}
