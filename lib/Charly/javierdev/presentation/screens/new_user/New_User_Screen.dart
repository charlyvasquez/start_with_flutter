import 'package:flutter/material.dart';
import '../../../models/models.dart';
import '../../widgets/widgets.dart';

class NewUserScreenJD extends StatefulWidget {
  static String routeName = 'new_user';
  const NewUserScreenJD({super.key});

  @override
  State<NewUserScreenJD> createState() => _NewUserScreenJDState();
}

class _NewUserScreenJDState extends State<NewUserScreenJD> {
  final List<ItemDropdown> listSex = [
    ItemDropdown(label: 'Femenino', value: 'Female'),
    ItemDropdown(label: 'Masculino', value: 'Male'),
  ];
  final List<ItemDropdown> listStatus = [
    ItemDropdown(label: 'Activo', value: 'Active'),
    ItemDropdown(label: 'Inactivo', value: 'Inactive'),
  ];
  ItemDropdown? _selectSex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Nuevo Usuario'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const TextFieldWidgetJD(
              label: 'Nombre',
              placeholder: 'Nombre',
              icon: Icons.person,
            ),
            const SizedBox(height: 15.0),
            const TextFieldWidgetJD(
              label: 'Correo',
              placeholder: 'Correo',
              icon: Icons.email,
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownWidgetJD(
                  label: 'Género',
                  list: listSex,
                ),
                DropdownWidgetJD(
                  label: 'Estado',
                  list: listStatus,
                ),
              ],
            ),
            const Spacer(),
            Container(
                width: 100,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5.0)),
                child: const Center(
                  child: Text(
                    'Guardar',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
