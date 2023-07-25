import 'package:flutter/material.dart';

class TextFieldWidgetJD extends StatelessWidget {
  final String label, placeholder;
  final IconData icon;
  const TextFieldWidgetJD({
    super.key,
    required this.label,
    required this.placeholder,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label),
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          padding: const EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0)),
          child: TextField(
            decoration: InputDecoration(
                hintText: placeholder,
                suffixIcon: Icon(
                  icon,
                  color: Colors.grey,
                ),
                border: InputBorder.none),
          ),
        )
      ],
    );
  }
}
