import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/game_bloc.dart';
import '../bloc/game_event.dart';
import 'guess_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController nController = TextEditingController();
  final TextEditingController mController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Начните игру')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nController,
              decoration: InputDecoration(labelText: 'Введите диапазон (n)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: mController,
              decoration: InputDecoration(labelText: 'Введите попытки (m)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final n = int.tryParse(nController.text);
                final m = int.tryParse(mController.text);
                if (n != null && m != null) {
                  BlocProvider.of<GameBloc>(context).add(GameStarted(n, m));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => GuessScreen()),
                  );
                }
              },
              child: Text('Начать игру'),
            ),
          ],
        ),
      ),
    );
  }
}
