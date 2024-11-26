import 'package:flutter/material.dart';
import 'dart:async';

import 'main.dart';

void main() {
  runApp(MyApp());
}

class Exercise {
  final String name;
  final String type;

  Exercise(this.name, this.type);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        'main.dart': (context) => HomePageIndex(),
      },
      home: ExerciseespadaPage(),
    );
  }
}

class ExerciseespadaPage extends StatefulWidget {
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExerciseespadaPage> {
  List<Exercise> exercises = [
    Exercise("GIRO DA ESPADA PARA FRENTE (MÃO ESQUERDA)", "tempo"),
    Exercise("DESCANSO", "descanso"),
    Exercise("GIRO DA ESPADA PARA FRENTE (MÃO DIREITA)", "tempo"),
    Exercise("DESCANSO", "descanso"),
    Exercise("CORTE FENDENTE CURTO (MÃO ESQUERDA)", "tempo"),
    Exercise("DESCANSO", "descanso"),
    Exercise("CORTE FENDENTE CURTO (MÃO DIREITA)", "tempo"),
    Exercise("DESCANSO", "descanso"),
    Exercise("CORTE VOLANTE CURTO (MÃO ESQUERDA)", "tempo"),
    Exercise("DESCANSO", "descanso"),
    Exercise("CORTE VOLANTE CURTO (MÃO DIREITA)", "tempo"),
    Exercise("DESCANSO", "descanso"),
    Exercise("CORTE MEZZANO CURTO (MÃO ESQUERDA)", "tempo"),
    Exercise("DESCANSO", "descanso"),
    Exercise("CORTE MEZZANO CURTO (MÃO DIREITA)", "tempo"),
    Exercise("DESCANSO", "descanso"),
    Exercise("COVERTA COM CORTE (MÃO ESQUERDA)", "tempo"),
    Exercise("DESCANSO", "descanso"),
    Exercise("COVERTA COM CORTE (MÃO DIREITA", "tempo"),
    Exercise("TROQUE PARA ESPADA LONGA", "TROCA"),
    Exercise("GIRO DA ESPADA PARA FRENTE (GUARDA INVERTIDA", "tempo"),
    Exercise("DESCANSO", "descanso"),
    Exercise("GIRO DA ESPADA PARA FRENTE (GUARDA COMUM)", "tempo"),
    Exercise("DESCANSO", "descanso"),
    Exercise("CORTE FENDENTE CURTO (GUARDA INVERTIDA)", "tempo"),
    Exercise("DESCANSO", "descanso"),
    Exercise("CORTE FENDENTE CURTO (GUARDA COMUM)", "tempo"),
    Exercise("DESCANSO", "descanso"),
    Exercise("CORTE VOLANTE CURTO (GUARDA INVERTIDA)", "tempo"),
    Exercise("DESCANSO", "descanso"),
    Exercise("CORTE VOLANTE CURTO (GUARDA COMUM)", "tempo"),
    Exercise("DESCANSO", "descanso"),
    Exercise("CORTE MEZZANO CURTO (GUARDA INVERTIDA)", "tempo"),
    Exercise("DESCANSO", "descanso"),
    Exercise("CORTE MEZZANO CURTO (GUARDA COMUM)", "tempo"),
    Exercise("DESCANSO", "descanso"),
    Exercise("COVERTA COM CORTE (GUARDA INVERTIDA)", "tempo"),
    Exercise("DESCANSO", "descanso"),
    Exercise("COVERTA COM CORTE GUARDA COMUM)", "tempo"),
    Exercise("EXERCÍCIO CONCLUÍDO, PODE FECHAR O APLICATIVO!", 'final')
  ];

  int currentExerciseIndex = 0;
  Timer? _timer;
  int _tempoSeconds = 60;
  int _descansoSeconds = 10;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (exercises[currentExerciseIndex].type == "tempo") {
          if (_tempoSeconds > 0) {
            _tempoSeconds--;
          } else {
            _tempoSeconds = 60;
            _nextExercise();
          }
        } else if (exercises[currentExerciseIndex].type == "descanso") {
          if (_descansoSeconds > 0) {
            _descansoSeconds--;
          } else {
            _descansoSeconds = 10;
            _nextExercise();
          }
        }
      });
    });
  }

  void _nextExercise() {
    setState(() {
      currentExerciseIndex++;
      if (currentExerciseIndex >= exercises.length) {
        currentExerciseIndex = 0;
      }
    });
  }

  void _previousExercise() {
    setState(() {
      if (currentExerciseIndex > 0) {
        currentExerciseIndex--;
        if (currentExerciseIndex >= exercises.length) {
          currentExerciseIndex = 0;
        }
      } else {
        currentExerciseIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String nextExerciseName = currentExerciseIndex + 1 < exercises.length
        ? exercises[currentExerciseIndex + 1].name
        : 'Nenhum';

    return Scaffold(
        appBar: AppBar(
          title:
              Text('Exercício ${currentExerciseIndex + 1}/${exercises.length}'),
        ),
        body: Column(
          children: [
            if (exercises[currentExerciseIndex].type != "final")
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Próximo: $nextExerciseName',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      exercises[currentExerciseIndex].name,
                      style: TextStyle(fontSize: 18.0),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30.0),
                    if (exercises[currentExerciseIndex].type == "tempo")
                      Text(
                        '$_tempoSeconds',
                        style: TextStyle(fontSize: 30.0),
                        textAlign: TextAlign.center,
                      ),
                    if (exercises[currentExerciseIndex].type == "troca")
                      Text(
                        'ESPADA LONGA',
                        style: TextStyle(fontSize: 30.0),
                        textAlign: TextAlign.center,
                      ),
                    if (exercises[currentExerciseIndex].type == "descanso")
                      Text(
                        '$_descansoSeconds',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    if (exercises[currentExerciseIndex].type == "repeticao")
                      SizedBox(height: 18.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _previousExercise();
                          },
                          child: Text('<ANTERIOR'),
                          style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 0, 0)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _nextExercise();
                          },
                          child: Text('PROXIMO >'),
                          style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'main.dart');
                      },
                      child: const Text(
                        'INÍCIO',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
