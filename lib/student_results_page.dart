import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentResultsPage extends StatelessWidget {
  final double totalHours;

  StudentResultsPage({required this.totalHours});

  @override
  Widget build(BuildContext context) {
    String result;
    List<String> advice;
    String imagePath;
    Color backgroundColor;

    if (totalHours < 25) {
      result = "Très faible charge mentale";
      advice = [
        "Profitez de votre temps libre pour vous engager dans des activités de loisir qui vous détendent et vous ressourcent, comme le sport, la lecture ou les passe-temps créatifs.",
        "Utilisez le temps supplémentaire disponible pour approfondir vos connaissances dans les matières qui vous intéressent particulièrement, sans vous surcharger."
      ];
      imagePath = 'assets/images/smiley_happy.png';
      backgroundColor = Colors.green[200]!;
    } else if (totalHours < 30) {
      result = "Faible charge mentale";
      advice = [
        "Planifiez vos heures d'étude et de révision de manière efficace pour éviter de procrastiner et maximiser votre temps de travail personnel.",
        "Prenez des pauses régulières pendant vos sessions d'étude pour maintenir votre concentration et votre bien-être mental."
      ];
      imagePath = 'assets/images/smiley_slightly.png';
      backgroundColor = Colors.yellow[200]!;
    } else if (totalHours < 35) {
      result = "Charge mentale modérée";
      advice = [
        "Priorisez vos tâches et établissez un calendrier de travail réaliste pour gérer vos devoirs, évaluations et cours particuliers sans vous sentir dépassé.",
        "Communiquez avec vos enseignants si vous rencontrez des difficultés pour obtenir de l'aide supplémentaire ou des conseils sur la manière de mieux gérer votre charge de travail."
      ];
      imagePath = 'assets/images/smiley_neutral.png';
      backgroundColor = Colors.orange[200]!;
    } else if (totalHours < 40) {
      result = "Charge mentale élevée";
      advice = [
        "Pratiquez des techniques de gestion du stress telles que la méditation, la respiration profonde ou le yoga pour vous détendre et réduire l'anxiété liée à votre charge de travail.",
        "Organisez des sessions d'étude en groupe avec vos camarades de classe pour partager les charges de travail et bénéficier du soutien mutuel."
      ];
      imagePath = 'assets/images/smiley_sad.png';
      backgroundColor = Colors.red[200]!;
    } else {
      result = "Très haute charge mentale";
      advice = [
        "Assurez-vous de maintenir un équilibre entre votre travail scolaire et votre bien-être en prenant soin de votre santé physique par une alimentation saine et suffisamment de sommeil.",
        "Apprenez à déléguer certaines tâches non essentielles ou à demander de l'aide à votre entourage pour alléger votre charge mentale et éviter l'épuisement."
      ];
      imagePath = 'assets/images/smiley_very_sad.png';
      backgroundColor = Colors.red[300]!;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Résultat de votre évaluation", style: TextStyle(color: Colors.white)),
        backgroundColor: backgroundColor,
      ),
      body: Container(
        color: backgroundColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(imagePath, height: 100),
                SizedBox(height: 20),
                Text(result, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 20),
                ...advice.map((e) => Text(e, style: TextStyle(fontSize: 18, color: Colors.white))),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _launchURL('https://www.alphaacademie.fr/'),
                  child: Text(
                    "Allez sur Alpha Académie, c'est gratuit!",
                    style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue, fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Prochainement : une application de gestion du temps pour professeur et élève !",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
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
