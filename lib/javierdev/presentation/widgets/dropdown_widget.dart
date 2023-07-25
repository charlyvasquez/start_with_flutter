import 'package:flutter/material.dart';
import 'package:start_with_flutter_again/javierdev/models/models.dart';

class DropdownWidgetJD extends StatefulWidget {
  final String label;
  final List<ItemDropdown> list;
  const DropdownWidgetJD({super.key, required this.label, required this.list});

  @override
  State<DropdownWidgetJD> createState() => _DropdownWidgetJDState();
}

class _DropdownWidgetJDState extends State<DropdownWidgetJD> {
  ItemDropdown? _select;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(widget.label),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            padding: const EdgeInsets.only(left: 5.0),
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(5.0)),
            child: DropdownButton(
                isExpanded: true,
                underline: SizedBox(),
                iconEnabledColor: Colors.orange,
                dropdownColor: Colors.amber,
                focusColor: Colors.red,
                hint: const Text('Seleccione...'),
                value: _select,
                items: widget.list.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item.label),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _select = value as ItemDropdown?;
                  });
                }),
          )
        ],
      ),
    );
  }
}
