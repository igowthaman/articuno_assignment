import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class StatefulColorfulTile extends StatefulWidget {
  StatefulColorfulTile(
      {Key? key, required this.myColorList, required this.condition})
      : super(key: key);

  bool condition;
  List<Color> myColorList;
  @override
  State<StatefulColorfulTile> createState() => _StatefulColorfulTileState();
}

class _StatefulColorfulTileState extends State<StatefulColorfulTile> {
  late Color myColor;
  @override
  void initState() {
    super.initState();
    myColor = Color(
      (math.Random().nextDouble() * 0xFFFFFF).toInt(),
    ).withOpacity(
      1.0,
    );
    widget.myColorList.add(myColor);
  }

  @override
  void didUpdateWidget(covariant StatefulColorfulTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.condition) {
      setState(() {
        widget.myColorList.insert(1, widget.myColorList.removeAt(0));
        widget.condition = false;
      });
      myColor = widget.myColorList[0];
    } else {
      setState(() {
        widget.myColorList.insert(1, widget.myColorList.removeAt(0));
        widget.condition = true;
      });
      myColor = widget.myColorList[1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColor,
      child: const Padding(
        padding: EdgeInsets.all(70.0),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> myColorList = [];
  bool condition = true;
  var containers;

  @override
  void initState() {
    super.initState();
    containers = [
      Padding(
        padding: const EdgeInsets.all(10),
        child: StatefulColorfulTile(
          myColorList: myColorList,
          condition: condition,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: StatefulColorfulTile(
          myColorList: myColorList,
          condition: condition,
        ),
      )
    ];
  }

  void swapColour() {
    setState(() {
      containers.insert(1, containers.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: containers,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => swapColour(),
        child: const Icon(Icons.change_circle_outlined),
      ),
    );
  }
}
