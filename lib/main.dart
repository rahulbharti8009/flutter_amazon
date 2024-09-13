import 'package:flutter/material.dart';
import 'package:flutter_amazon/ui/Dashboard/DashboardUI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 74, 109, 154)),
        useMaterial3: true,
      ),
      home: const DashboardUI(title: 'Flutter'),
    );
  }
}
