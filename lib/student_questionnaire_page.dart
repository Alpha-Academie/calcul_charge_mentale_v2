import 'package:flutter/material.dart';
import 'student_results_page.dart';

class StudentQuestionnairePage extends StatefulWidget {
  @override
  _StudentQuestionnairePageState createState() => _StudentQuestionnairePageState();
}

class _StudentQuestionnairePageState extends State<StudentQuestionnairePage> {
  final PageController _controller = PageController();
  final List<TextEditingController> _controllers = List.generate(5, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(5, (index) => FocusNode());

  final List<String> questions = [
    "Combien d'heures de cours as-tu dans ta semaine ?",
    "Combien d'heures de sport ou activité de loisir as-tu en dehors des cours ?",
    "Combien d'heures d'évaluations as-tu cette semaine en classe ?",
    "Combien d'heure de cours particuliers as-tu cette semaine ?",
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
    _controllers.forEach((controller) {
      controller.addListener(() {
        setState(() {}); // Redessine l'interface quand le texte change
      });
    });
  }

  double calculateTotalHours() {
    return _controllers.map((controller) => double.tryParse(controller.text) ?? 0.0).reduce((a, b) => a + b);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questionnaire Élève"),
      ),
      body: PageView.builder(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),  // Empêche le défilement manuel entre les pages
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    questions[index],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    focusNode: _focusNodes[index],
                    controller: _controllers[index],
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      hintText: "Entrez le nombre d'heures",
                      border: OutlineInputBorder(),
                    ),
                    autofocus: true,
                  ),
                  SizedBox(height: 20),
                  if (index == 0)
                    Center(
                      child: ElevatedButton(
                        onPressed: _controllers[index].text.isNotEmpty
                            ? () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                            : null,  // Désactiver le bouton si le champ est vide
                        child: Text('Suivant'),
                      ),
                    ),
                  if (index > 0 && index < questions.length - 1)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _controller.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text('Précédent'),
                        ),
                        ElevatedButton(
                          onPressed: _controllers[index].text.isNotEmpty
                              ? () {
                            _controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                              : null,  // Désactiver le bouton si le champ est vide
                          child: Text('Suivant'),
                        ),
                      ],
                    ),
                  if (index == questions.length - 1)
                    ElevatedButton(
                      onPressed: _controllers[index].text.isNotEmpty
                          ? () {
                        double totalHours = calculateTotalHours();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentResultsPage(totalHours: totalHours),
                          ),
                        );
                      }
                          : null,  // Désactiver le bouton si le champ est vide
                      child: Text('Terminer'),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((node) => node.dispose());
    _controller.dispose();
    super.dispose();
  }
}
