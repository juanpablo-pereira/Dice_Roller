import 'package:flutter/material.dart';
import 'package:flutter_bloc_counter/src/bloc/counter_bloc.dart';
// import 'package:flutter_bloc_counter/src/screen/dice/dice_screen.dart';

import 'src/bloc/contract/bloc.dart';
import 'src/screen/dice/counter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _blocs = <Bloc>[];

  @override
  void initState() {
    super.initState();
    CounterBloc bloc = CounterBloc();
    _blocs.add(bloc);
    _blocs.forEach((bloc) {
      bloc.initialize();
    });
  }

  @override
  void dispose() {
    _blocs.forEach((bloc) {
      bloc.dispose();
    });
    super.dispose();
  }

  T getDesireBloc<T extends Bloc>() {
    return _blocs.firstWhere(
      (bloc) {
        return (bloc is T);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice Roller',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CounterScreen(
          title: 'Dice Roller', counterBloc: getDesireBloc<CounterBloc>(),
      ),
      // home: DiceScreen(
      //   title: 'Dice Roller',
      // ),
    );
  }
}
