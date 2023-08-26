import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:talachas_app/screens/workers_screen.dart';


class CronometerScreen extends StatelessWidget {
  final String workerName;
  final int minutes;

  CronometerScreen({required this.workerName, required this.minutes});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Talachero: $workerName',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),// Reducir el tamaño de fuente
            ),
             const SizedBox(height: 10),
             const Text(
              'Tiempo de llegada: ',
               style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10), // Espacio más pequeño
                CountdownTimer(
              endTime: DateTime.now().millisecondsSinceEpoch + minutes * 60000,
              textStyle: TextStyle(fontSize: 24, color: Colors.white), // Reducir el tamaño de fuente
            ),
            const SizedBox(height: 10), // Espacio más pequeño
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkerScreen(),
                  ),
                );
              },
              child: const Text('Cancelar'), // Texto más grande
            ),
          ],
        ),
      ),
    );
  }
}