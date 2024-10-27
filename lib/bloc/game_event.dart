import 'package:equatable/equatable.dart';

abstract class GameEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GameStarted extends GameEvent {
  final int maxNumber;
  final int maxAttempts;
  
  GameStarted(this.maxNumber, this.maxAttempts);
}

class NumberGuessed extends GameEvent {
  final int guessedNumber;

  NumberGuessed(this.guessedNumber);
}

class GameReset extends GameEvent {}
