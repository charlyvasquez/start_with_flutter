import 'package:flutter/material.dart';

class MainSebastian extends StatefulWidget {
  const MainSebastian({super.key});

  @override
  State<MainSebastian> createState() => _MainSebastianState();
}

class _MainSebastianState extends State<MainSebastian> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sección de Sebastian'),
        backgroundColor: Colors.blue.shade300,
      ),
      body: const Center(child: Text('Texto Centrado')),
    );
  }
}
