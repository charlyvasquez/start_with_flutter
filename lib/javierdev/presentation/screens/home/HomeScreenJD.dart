import 'package:flutter/material.dart';
import 'package:start_with_flutter_again/javierdev/presentation/screens/screens.dart';

class HomeScreenJD extends StatefulWidget {
  static String routeName = '/';
  const HomeScreenJD({super.key});

  @override
  State<HomeScreenJD> createState() => _HomeScreenJDState();
}

class _HomeScreenJDState extends State<HomeScreenJD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JavierDev Users List'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: /* Column(
        children: [Text('Prueba'), ButtonWidget()],
      ), */
          ListView.separated(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Nombre: ' + index.toString()),
            subtitle: Text('Correo: ' + index.toString()),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () =>
                Navigator.pushNamed(context, DetailUserScreenJD.routeName),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NewUserScreenJD.routeName);
        },
        child: const Icon(Icons.person_add),
      ),
    );
  }
}

Widget ButtonWidget() {
  return FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.person_add),
  );
}
