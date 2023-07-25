import 'package:flutter/material.dart';

class MainMilton extends StatefulWidget {
  const MainMilton({super.key});

  @override
  State<MainMilton> createState() => _MainMiltonState();
}

class _MainMiltonState extends State<MainMilton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sección de Milton'),
        backgroundColor: Colors.blue.shade600,
      ),
      body: const Center(child: Text('Texto Centrado')),
    );
  }
}
