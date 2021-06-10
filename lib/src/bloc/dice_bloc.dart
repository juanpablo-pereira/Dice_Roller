import 'dart:async';
import 'dart:math';

import 'i_dice_bloc.dart';
import '../utils/constants.dart';

class DiceBloc extends IDiceBloc {
  List<int> _diceValues = [];
  StreamController<List<int>> _valuesStreamController =
      StreamController<List<int>>.broadcast();
  StreamController<String> _scoreController =
      StreamController<String>.broadcast();

  @override
  void initialize() {}

  @override
  void dispose() {
    _valuesStreamController.close();
    _scoreController.close();
  }

  @override
  Stream<List<int>> get valuesStream => _valuesStreamController.stream;

  @override
  Stream<String> get scoreStream => _scoreController.stream;

  @override
  void roll() {
    this._diceValues.clear();
    int totalScore = 0;

    for (int i = 0; i < Constants.diceAmount; i++) {
      final temporaryDiceValue = Random().nextInt(Constants.maxDiceValue) + 1;
      this._diceValues.add(temporaryDiceValue);
      totalScore += temporaryDiceValue;
    }

    this._valuesStreamController.sink.add(this._diceValues);
    this._scoreController.sink.add('$totalScore');
  }
}
