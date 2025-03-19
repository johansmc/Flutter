import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String carta = "/preview.jpg";
  String carta2 = "/preview.jpg";
  String carta3 = "/preview.jpg";
  final List<String> imagenes = [
    "/image1.jpg",
    "/image2.jpg",
    "/image3.jpg",
  ];

  late List<String> imagenesActuales;
  String message = "Presione el botón para tirar";

  @override
  void initState() {
    super.initState();
    imagenesActuales = List.from(imagenes);
  }

  void jugar() {
    setState(() {
      Random random = Random();
      imagenesActuales = List.generate(
        3,
        (index) => imagenes[random.nextInt(3)],
      );

      if (imagenesActuales[0] == imagenesActuales[1] &&
          imagenesActuales[0] == imagenesActuales[2] &&
          imagenesActuales[1] == imagenesActuales[2]) {
        message = "¡Ganaste!";
      } else {
        message = "Usted perdió ";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Casino',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Prueba tu suerte"),
          backgroundColor: Colors.red,
          foregroundColor: Colors.orangeAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var imagen in imagenesActuales)
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(
                          color: Colors.orangeAccent,
                          width: 3,
                        ),
                      ),
                      child: Image.asset(imagen, fit: BoxFit.cover),
                    ),
                ],
              ),

              SizedBox(height: 20),

              Text(
                message,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),

              SizedBox(height: 20),

              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.orangeAccent,
                  side: BorderSide(color: Colors.orangeAccent, width: 2),
                ),
                onPressed: jugar,
                child: Text('Jugar', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
