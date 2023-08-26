import 'package:flutter/material.dart';
import 'package:talachas_app/screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0x0000000),
        appBarTheme: const AppBarTheme(
          color: Colors.black
        ),
        textTheme: const TextTheme(
            headlineSmall: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            bodySmall: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold),
          ),
        useMaterial3: true,
      ),
      home: StartScreen(),
    );
  }
}
