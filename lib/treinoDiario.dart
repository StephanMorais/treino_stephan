import 'package:flutter/material.dart';
import 'espadalonga.dart';
import '12.dart';
import 'estilete.dart';
import 'katana.dart';
import 'faca.dart';
import 'main.dart';
import 'facadupla.dart';

void main() {
  runApp(diario());
}

class diario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redirecionamento de Páginas Externas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '12.dart': (context) => Exercise12Page(),
        'katana.dart': (context) => ExerciseKatanaPage(),
        'estilete.dart': (context) => ExerciseEstiletePage(),
        'faca.dart': (context) => ExercicioFacaPage(),
        'espadalonga.dart': (context) => ExerciseespadaPage(),
        'main.dart': (context) => HomePageIndex(),
        'facadupla.dart': (context) => ExerciceFacaduplaPage(),
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String dayOfWeek = DateTime.now().weekday.toString();
    String dayMessage = '';

    switch (dayOfWeek) {
      case '1':
        dayMessage = 'ESPADAS EUROPEIAS';
        break;
      case '2':
        dayMessage = 'SHOTGUN';
        break;
      case '3':
        dayMessage = 'ESTILETE';
        break;
      case '4':
        dayMessage = 'FACA';
        break;
      case '5':
        dayMessage = 'KENJUTSU';
        break;
      case '6':
        dayMessage = 'LAMINAS DUPLAS';
        break;
      case '7':
        dayMessage = 'DIA DE DESCANSO';
        break;
      default:
        dayMessage = '';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
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
            Text(
              '$dayMessage',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                switch (dayOfWeek) {
                  case '1':
                    Navigator.pushReplacementNamed(context, 'espadalonga.dart');
                    break;
                  case '2':
                    Navigator.pushReplacementNamed(context, '12.dart');
                    break;
                  case '3':
                    Navigator.pushReplacementNamed(context, 'estilete.dart');
                    break;
                  case '4':
                    Navigator.pushReplacementNamed(context, 'faca.dart');
                    break;
                  case '5':
                    Navigator.pushReplacementNamed(context, 'katana.dart');
                    break;
                  case '6':
                    Navigator.pushReplacementNamed(context, 'facadupla.dart');
                    break;
                  default:
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('DEIXE SUAS PATAS DESCANSAREM!'),
                      ),
                    );
                }
              },
              child: const Text(
                'INICIAR',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'main.dart');
              },
              child: const Text(
                'VOLTAR',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
