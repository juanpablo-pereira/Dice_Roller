import 'bloc.dart';

abstract class IDiceBloc extends Bloc {
  Stream<List<int>> get valuesStream;
  Stream<String> get scoreStream;

  void roll();
}
