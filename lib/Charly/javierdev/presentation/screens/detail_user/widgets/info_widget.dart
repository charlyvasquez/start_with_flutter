import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Información del usuario',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Card(
          elevation: 20.0,
          child: Column(
            children: [
              Item('Nombre', Icons.person),
              Item('correo@correo.com', Icons.email),
              Item('Masculino', Icons.supervised_user_circle_rounded),
              Item('Activo', Icons.circle),
            ],
          ),
        ),
      ],
    );
  }

  Widget Item(String label, IconData icon) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: Colors.green,
            size: 40.0,
          ),
          trailing: Text(label),
        ),
        const Divider()
      ],
    );
  }
}
