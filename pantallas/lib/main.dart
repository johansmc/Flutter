import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: body(),
    );
  }
}




class body extends StatefulWidget {
  const body({super.key});

  @override
  State<body> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla 1'),
        leading: null,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hola Mundo', style: TextStyle(fontSize: 30)),
            Text('Bienvenidos a Flutter', style: TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pantalla2()),
                );
              },
              child: Text('Ir a la pantalla 2'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pantalla3()),
                );
              },
              child: Text('Ir a la pantalla 3'),
            ),
          ],
        ),
      ),
    );
  }
}

//pantalla 2

class Pantalla2 extends StatefulWidget {
  const Pantalla2({super.key});

  @override
  _Pantalla2State createState() => _Pantalla2State();
}

class _Pantalla2State extends State<Pantalla2> {
 
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();

  int result = 0; 

  
  void operar(String operacion) {
    setState(() {
      int num1 = int.tryParse(num1Controller.text) ?? 0;
      int num2 = int.tryParse(num2Controller.text) ?? 0;

      switch (operacion) {
        case 'sumar':
          result = num1 + num2;
          break;
        case 'restar':
          result = num1 - num2;
          break;
        case 'multiplicar':
          result = num1 * num2;
          break;
        case 'dividir':
          result = (num2 != 0) ? (num1 ~/ num2) : 0; 
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla 2'), leading: null),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Calculadora', style: TextStyle(fontSize: 30)),
            SizedBox(height: 10),

            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Primer Número',
              ),
            ),
            SizedBox(height: 10),

            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Segundo Número',
              ),
            ),
            SizedBox(height: 10),

            Text('Resultado: $result', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),

            Wrap(
              spacing: 10,
              alignment: WrapAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => operar('sumar'),
                  child: Icon(FontAwesomeIcons.plus, size: 15),
                  mini: true,
                ),
                FloatingActionButton(
                  onPressed: () => operar('restar'),
                  child: Icon(FontAwesomeIcons.minus, size: 15),
                  mini: true,
                ),
                FloatingActionButton(
                  onPressed: () => operar('multiplicar'),
                  child: Icon(FontAwesomeIcons.xmark, size: 15),
                  mini: true,
                ),
                FloatingActionButton(
                  onPressed: () => operar('dividir'),
                  child: Icon(FontAwesomeIcons.divide, size: 15),
                  mini: true,
                ),
              ],
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pantalla3()),
                );
              },
              child: Text('Ir a la pantalla 3'),
            ),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => body()),
                );
              },
              child: Text('Ir a la pantalla 1'),
            ),
          ],
        ),
      ),
    );
  }
}

void sumar() {

}

class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla 3'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hola Pantalla 3', style: TextStyle(fontSize: 30)),
            Text('Bienvenidos a la pantalla 3', style: TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => body()),
                );
              },
              child: Text('Ir a la pantalla 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pantalla2()),
                );
              },
              child: Text('Ir a la pantalla 2'),
            ),
          ],
        ),
      ),
    );
  }
}
