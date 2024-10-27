
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/game_bloc.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const GuessNumberGameApp());
}

class GuessNumberGameApp extends StatelessWidget {
  const GuessNumberGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GameBloc(),
      child: MaterialApp(
        title: 'Угадай число',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}
