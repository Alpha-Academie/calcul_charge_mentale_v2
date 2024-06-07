import 'package:flutter/material.dart';
import 'student_final_page.dart'; // Importez la nouvelle page

class StudentResultsPage extends StatelessWidget {
  final double totalHours;

  StudentResultsPage({required this.totalHours});

  @override
  Widget build(BuildContext context) {
    String result;
    List<String> advice;
    String imagePath;

    if (totalHours < 25) {
      result = "Très faible charge mentale";
      advice = [
        "Profitez de votre temps libre pour vous engager dans des activités de loisir qui vous détendent et vous ressourcent, comme le sport, la lecture ou les passe-temps créatifs.",
        "Utilisez le temps supplémentaire disponible pour approfondir vos connaissances dans les matières qui vous intéressent particulièrement, sans vous surcharger."
      ];
      imagePath = 'assets/images/smiley_happy.png';
    } else if (totalHours < 30) {
      result = "Faible charge mentale";
      advice = [
        "Planifiez vos heures d'étude et de révision de manière efficace pour éviter de procrastiner et maximiser votre temps de travail personnel.",
        "Prenez des pauses régulières pendant vos sessions d'étude pour maintenir votre concentration et votre bien-être mental."
      ];
      imagePath = 'assets/images/smiley_slightly.png';
    } else if (totalHours < 35) {
      result = "Charge mentale modérée";
      advice = [
        "Priorisez vos tâches et établissez un calendrier de travail réaliste pour gérer vos devoirs, évaluations et cours particuliers sans vous sentir dépassé.",
        "Communiquez avec vos enseignants si vous rencontrez des difficultés pour obtenir de l'aide supplémentaire ou des conseils sur la manière de mieux gérer votre charge de travail."
      ];
      imagePath = 'assets/images/smiley_neutral.png';
    } else if (totalHours < 40) {
      result = "Charge mentale élevée";
      advice = [
        "Pratiquez des techniques de gestion du stress telles que la méditation, la respiration profonde ou le yoga pour vous détendre et réduire l'anxiété liée à votre charge de travail.",
        "Organisez des sessions d'étude en groupe avec vos camarades de classe pour partager les charges de travail et bénéficier du soutien mutuel."
      ];
      imagePath = 'assets/images/smiley_sad.png';
    } else {
      result = "Très haute charge mentale";
      advice = [
        "Assurez-vous de maintenir un équilibre entre votre travail scolaire et votre bien-être en prenant soin de votre santé physique par une alimentation saine et suffisamment de sommeil.",
        "Apprenez à déléguer certaines tâches non essentielles ou à demander de l'aide à votre entourage pour alléger votre charge mentale et éviter l'épuisement."
      ];
      imagePath = 'assets/images/smiley_very_sad.png';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Résultat de votre évaluation", style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor, // Couleur du header uniforme
      ),
      body: Container(
        color: Color(0xFFFFF5DC), // Couleur de fond de la page
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(imagePath, height: 100),
                SizedBox(height: 20),
                Text(
                  result,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'MerriweatherSans-Bold',
                    color: Colors.red, // Texte de résultat en rouge
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Conseils:',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'MerriweatherSans-Bold',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    ...advice.map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
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
                              style: TextStyle(
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => StudentFinalPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF10069F), // Couleur de fond du bouton
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
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
