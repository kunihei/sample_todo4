import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_todo4/controllers/controllers.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterController = context.watch<CounterController>();
    return Scaffold(
      appBar: AppBar(title: const Text('カウントアップ')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counterController.count.toString(),
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: counterController.decrement,
                  child: const Text('-'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: counterController.increment,
                  child: const Text('+'),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: counterController.reset,
              child: const Text('0に戻す'),
            ),
          ],
        ),
      ),
    );
  }
}
