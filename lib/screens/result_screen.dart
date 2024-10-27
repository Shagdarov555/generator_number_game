import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/game_bloc.dart';
import '../bloc/game_event.dart';

class ResultScreen extends StatelessWidget {
  final String message;
  final Color color;

  const ResultScreen({super.key, required this.message, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: const TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<GameBloc>(context).add(GameReset());
                Navigator.pop(context);
              },
              child: const Text('Начать игру заново'),
            ),
          ],
        ),
      ),
    );
  }
}
