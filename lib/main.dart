import 'package:flutter/material.dart';

import 'package:treino_stephan/12.dart';
import 'package:treino_stephan/dao.dart';
import 'package:treino_stephan/espadalonga.dart';
import 'package:treino_stephan/faca.dart';
import 'package:treino_stephan/katana.dart';
import 'package:treino_stephan/selecao.dart';
import 'package:treino_stephan/treinoDiario.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redirecionamento de Páginas Externas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'selecao.dart': (context) => selecao(),
        'treino_stephan/treinoDiario.dart': (context) => diario(),
        '12.dart': (context) => Exercise12Page(),
        'katana.dart': (context) => ExercisekatanaPage(),
        'dao.dart': (context) => ExercisedaoPage(),
        'faca.dart': (context) => ExercisefacaPage(),
        'espadalonga.dart': (context) => ExerciseespadaPage(),
        'main.dart': (context) => HomePageIndex(),
      },
      home: HomePageIndex(),
    );
  }
}

class HomePageIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'TREINO MARCIAL',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'selecao.dart');
              },
              child: Text(
                'ESCOLHA SEU TREINO',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, 'treino_stephan/treinoDiario.dart');
              },
              child: Text(
                'FAÇA O TREINO DIÁRIO',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
