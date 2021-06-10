import 'package:flutter/material.dart';

import 'src/screen/dice/dice_screen.dart';
import 'src/bloc/dice_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  final DiceBloc diceBloc = DiceBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice Roller',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DiceScreen(
        title: 'Dice Roller',
        bloc: this.diceBloc,
      ),
    );
  }
}
