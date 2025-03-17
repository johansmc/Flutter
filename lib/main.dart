import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mr. Homero',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mr. Homero"),
          backgroundColor: Colors.amber,
        ),
        body: Center(child: Text("pruebeme la hamburguesa")),
      ),
    );
  }
}
