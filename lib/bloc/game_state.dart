import 'package:equatable/equatable.dart';

abstract class GameState extends Equatable {
  @override
  List<Object> get props => [];
}

class GameInitial extends GameState {}

class GameInProgress extends GameState {
  final int remainingAttempts;
  
  GameInProgress(this.remainingAttempts);
}

class GameWon extends GameState {}

class GameLost extends GameState {
  final int correctNumber;
  
  GameLost(this.correctNumber);
}
