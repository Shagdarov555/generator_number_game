import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  int _targetNumber = 0;
  int _remainingAttempts = 0;

  GameBloc() : super(GameInitial()) {
    on<GameStarted>((event, emit) {
      _targetNumber = Random().nextInt(event.maxNumber) + 1;
      _remainingAttempts = event.maxAttempts;
      emit(GameInProgress(_remainingAttempts));
    });

    on<NumberGuessed>((event, emit) {
      if (event.guessedNumber == _targetNumber) {
        emit(GameWon());
      } else {
        emit(GameInitial());
        _remainingAttempts -= 1;
        print("progress count is: ${_remainingAttempts}");
        if (_remainingAttempts > 0) {
          emit(GameInProgress(_remainingAttempts));
        } else {
          emit(GameLost(_targetNumber));
        }
      }
    });

    on<GameReset>((event, emit) {
      emit(GameInitial());
    });
  }
}
