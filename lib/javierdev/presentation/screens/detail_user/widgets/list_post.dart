import 'package:flutter/material.dart';

class ListPostWidget extends StatelessWidget {
  const ListPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Lista de posts',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Card(
          elevation: 20.0,
          child: SizedBox(
            height: 250.0,
            child: ListView.separated(
              itemCount: 3,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                return const ListTile(
                  leading: Icon(Icons.file_copy),
                  title: Text('Nombre de post'),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
