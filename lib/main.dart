import 'package:flutter/material.dart';

import '12.dart';
import 'estilete.dart';
import 'espadalonga.dart';
import 'faca.dart';
import 'katana.dart';
import 'selecao.dart';
import 'treinoDiario.dart';
import 'facadupla.dart';

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
        'treinoDiario.dart': (context) => diario(),
        '12.dart': (context) => Exercise12Page(),
        'katana.dart': (context) => ExerciseKatanaPage(),
        'estilete.dart': (context) => ExerciseEstiletePage(),
        'faca.dart': (context) => ExercicioFacaPage(),
        'espadalonga.dart': (context) => ExerciseespadaPage(),
        'main.dart': (context) => HomePageIndex(),
        'facadupla.dart': (context) => ExerciceFacaduplaPage(),
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
                Navigator.pushReplacementNamed(context, 'treinoDiario.dart');
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
