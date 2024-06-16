import 'package:flutter/material.dart';
import 'teacher_final_page.dart';

class TeacherResultsPage extends StatelessWidget {
  final double totalHours;

  const TeacherResultsPage({super.key, required this.totalHours});

  @override
  Widget build(BuildContext context) {
    String result;
    List<String> advice;
    String imagePath;

    if (totalHours <= 22) {
      result = "Aucune ou très peu de charge mentale ressentie. Le travail est perçu comme facile, sans stress ni pression.";
      advice = [
        "Profitez de ce moment de faible charge mentale pour vous détendre et prendre du temps pour vous-même.",
        "Utilisez ce temps pour planifier et organiser vos tâches à venir afin de maintenir une charge mentale minimale."
      ];
      imagePath = 'assets/images/smiley_happy.png';
    } else if (totalHours <= 27) {
      result = "Faible : Une charge mentale légèrement perceptible, mais gérable.";
      advice = [
        "Restez concentré sur vos tâches, mais n'hésitez pas à prendre des pauses régulières pour vous reposer et vous ressourcer.",
        "Utilisez des techniques de gestion du temps pour optimiser votre efficacité et réduire le stress associé aux tâches à accomplir."
      ];
      imagePath = 'assets/images/smiley_slightly.png';
    } else if (totalHours <= 32) {
      result = "Modérée : Une charge mentale notable, mais encore gérable.";
      advice = [
        "Priorisez vos tâches en fonction de leur importance et de leur urgence pour mieux gérer votre charge mentale.",
        "Prenez des pauses stratégiques pour vous détendre et recharger vos batteries, en évitant les distractions inutiles."
      ];
      imagePath = 'assets/images/smiley_neutral.png';
    } else if (totalHours <= 37) {
      result = "Élevée : Une charge mentale significative et perceptible.";
      advice = [
        "Décomposez vos tâches en petites étapes plus gérables et concentrez-vous sur une chose à la fois pour réduire le sentiment d'overwhelm.",
        "N'hésitez pas à demander de l'aide à vos collègues ou à votre supérieur si vous vous sentez dépassé par la charge de travail."
      ];
      imagePath = 'assets/images/smiley_sad.png';
    } else {
      result = "Très Élevée : Une charge mentale extrêmement élevée et difficile à gérer.";
      advice = [
        "Prenez du recul et identifiez les tâches les plus urgentes et importantes à accomplir, en mettant de côté celles qui peuvent être reportées.",
        "Accordez-vous du temps pour vous reposer et récupérer, même si cela signifie ajuster votre emploi du temps ou déléguer certaines tâches."
      ];
      imagePath = 'assets/images/smiley_very_sad.png';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Résultat de votre évaluation", style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor, // Couleur du header uniforme
      ),
      body: Container(
        color: const Color(0xFFFFF5DC), // Couleur de fond de la page
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(imagePath, height: 100),
                const SizedBox(height: 20),
                Text(
                  result,
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'MerriweatherSans-Bold',
                    color: Colors.red, // Texte de résultat en rouge
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Conseils:',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'MerriweatherSans-Bold',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...advice.map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "- ",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'MerriweatherSans-Light',
                              color: Colors.black,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              e,
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'MerriweatherSans-Light',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const TeacherFinalPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF10069F), // Couleur de fond du bouton
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Poursuivez',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'MerriweatherSans-Light',
                      color: Colors.white, // Couleur de l'écriture blanche
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
