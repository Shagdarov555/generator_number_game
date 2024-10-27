import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/game_bloc.dart';
import '../bloc/game_event.dart';
import '../bloc/game_state.dart';
import 'result_screen.dart';

class GuessScreen extends StatelessWidget {
  final TextEditingController guessController = TextEditingController();

  GuessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Угадай число')),
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          if (state is GameInProgress) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Попыток осталось: ${state.remainingAttempts}'),
                  TextField(
                    controller: guessController,
                    decoration: const InputDecoration(labelText: 'Ваше предположение'),
                    keyboardType: TextInputType.number,
                  ),
                  const  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final guess = int.tryParse(guessController.text);
                      if (guess != null) {
                        BlocProvider.of<GameBloc>(context)
                            .add(NumberGuessed(guess));
                            guessController.clear();
                      }
                    },
                    child: const Text('Проверить'),
                  ),
                ],
              ),
            );
          } else if (state is GameWon) {
            return const ResultScreen(
              message: 'Поздравляем! Вы угадали число!',
              color: Colors.green,
            );
          } else if (state is GameLost) {
            return ResultScreen(
              message: 'Вы проиграли. Загаданное число: ${state.correctNumber}',
              color: Colors.red,
            );
          }
          return Container();
        },
      ),
    );
  }
}
