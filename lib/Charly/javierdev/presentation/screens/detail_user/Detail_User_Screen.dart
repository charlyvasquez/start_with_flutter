import 'package:flutter/material.dart';
import 'package:start_with_flutter_again/Charly/javierdev/presentation/screens/detail_user/widgets/info_widget.dart';
import 'package:start_with_flutter_again/Charly/javierdev/presentation/screens/detail_user/widgets/list_post.dart';

class DetailUserScreenJD extends StatelessWidget {
  static String routeName = 'detail_user';
  const DetailUserScreenJD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle usuario'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_outline_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              InfoWidget(),
              SizedBox(
                height: 15.0,
              ),
              ListPostWidget()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add_comment,
          color: Theme.of(context).primaryColorDark,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
