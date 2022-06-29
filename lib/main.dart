import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Articuno'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var color1 = Colors.green;
  var color2 = Colors.yellow;
  var state = 0;
  void swap() {
    if (state == 0) {
      setState(() {
        color1 = Colors.yellow;
        color2 = Colors.green;
        state = 1;
      });
    } else {
      setState(() {
        color1 = Colors.green;
        color2 = Colors.yellow;
        state = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                color: color1,
                width: 150,
                height: 150,
              ),
              Container(
                color: color2,
                width: 150,
                height: 150,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swap,
        child: const Icon(Icons.swap_vert_circle),
      ),
    );
  }
}
