import 'package:flutter/material.dart';
import 'teacher_results_page.dart';

class TeacherQuestionnairePage extends StatefulWidget {
  @override
  _TeacherQuestionnairePageState createState() => _TeacherQuestionnairePageState();
}

class _TeacherQuestionnairePageState extends State<TeacherQuestionnairePage> {
  final PageController _controller = PageController();
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  final List<String> questions = [
    "Combien d’heures de cours assurez-vous devant les élèves ?",
    "Combien d’heures de préparation de cours ?",
    "Combien d’heures de correction de copies ?",
    "Combien d’heures de Conseils de classe ou de réunions ?",
    "Combien d’heure de rendez-vous avec les parents ?",
    "Combien d’heures de formation ?"
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
        title: Text("Questionnaire sur la charge mentale"),
      ),
      body: PageView.builder(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        onPressed: _controllers[index].text.isNotEmpty ? () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } : null,
                        child: Text('Suivant'),
                      ),
                    ),
                  if (index > 0)
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
                          onPressed: _controllers[index].text.isNotEmpty ? () {
                            if (index < questions.length - 1) {
                              _controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              final totalHours = calculateTotalHours();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultsDisplayPage(totalHours: totalHours),
                                ),
                              );
                            }
                          } : null,
                          child: Text(index < questions.length - 1 ? 'Suivant' : 'Terminer'),
                        ),
                      ],
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
