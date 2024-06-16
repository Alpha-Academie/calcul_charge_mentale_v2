import 'package:flutter/material.dart';
import 'student_results_page.dart';

class StudentQuestionnairePage extends StatefulWidget {
  const StudentQuestionnairePage({super.key}); // Ajout du super paramètre pour la clé

  @override
  StudentQuestionnairePageState createState() => StudentQuestionnairePageState();
}

class StudentQuestionnairePageState extends State<StudentQuestionnairePage> {
  final PageController _controller = PageController();
  final List<TextEditingController> _controllers = List.generate(5, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(5, (index) => FocusNode());

  final List<String> questions = const [
    "Combien d'heures de cours as-tu dans ta semaine ?",
    "Combien d'heures de sport ou activité de loisir as-tu en dehors des cours ?",
    "Combien d'heures d'évaluations as-tu cette semaine en classe ?",
    "Combien d'heures de cours particuliers as-tu cette semaine ?",
    "Combien d'heures de travail personnel fais-tu en moyenne le soir et le weekend sur la semaine ?"
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.page != null && _controller.page!.round() == _controller.page) {
        FocusScope.of(context).requestFocus(_focusNodes[_controller.page!.round()]);
      }
    });
    for (var controller in _controllers) {
      controller.addListener(() {
        setState(() {}); // Redessine l'interface quand le texte change
      });
    }
  }

  double calculateTotalHours() {
    return _controllers.map((controller) => double.tryParse(controller.text) ?? 0.0).reduce((a, b) => a + b);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questionnaire Élève", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        color: const Color(0xFFFFF5DC), // Couleur de fond de la page
        child: PageView.builder(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(), // Empêche le défilement manuel entre les pages
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 40), // Écart en haut de la page
                    Text(
                      'Question ${index + 1}/${questions.length}',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'MerriweatherSans-Bold',
                        fontWeight: FontWeight.bold, // Texte en gras
                        color: Theme.of(context).primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10), // Ajout d'un écart entre le numéro de la question et la jauge
                    LinearProgressIndicator(
                      value: (index + 1) / questions.length,
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFE5000)),
                      backgroundColor: Colors.grey[300],
                      minHeight: 10,
                    ),
                    const SizedBox(height: 40), // Plus grand écart entre la jauge et la question
                    Text(
                      questions[index],
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'MerriweatherSans-Regular',
                        color: Colors.black, // Couleur noire pour les questions
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20), // Écart entre la question et le champ de saisie
                    TextField(
                      focusNode: _focusNodes[index],
                      controller: _controllers[index],
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(
                        fontFamily: 'MerriweatherSans-Light',
                      ),
                      decoration: const InputDecoration(
                        hintText: "Entrez le nombre d'heures",
                        border: OutlineInputBorder(),
                      ),
                      autofocus: true,
                    ),
                    const SizedBox(height: 20), // Écart entre le champ de saisie et le bouton
                    Center(
                      child: ElevatedButton(
                        onPressed: _controllers[index].text.isNotEmpty
                            ? () {
                                if (index < questions.length - 1) {
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                } else {
                                  double totalHours = calculateTotalHours();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => StudentResultsPage(totalHours: totalHours),
                                    ),
                                  );
                                }
                              }
                            : null, // Désactiver le bouton si le champ est vide
                        child: Text(
                          index < questions.length - 1 ? 'Suivant' : 'Terminer',
                          style: const TextStyle(
                            fontFamily: 'MerriweatherSans-Light',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40), // Écart avant l'image en bas
                     Image.asset(
                      'assets/images/logo_alpha_academie_orange.png',
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    _controller.dispose();
    super.dispose();
  }
}
