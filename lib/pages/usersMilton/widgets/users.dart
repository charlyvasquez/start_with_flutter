import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_with_flutter_again/pages/usersMilton/bloc/users/bloc/users_bloc.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
      return Container(); /* ListView.builder(
        itemCount: state.,
        itemBuilder: (BuildContext context, int index) {
          ;
        },
      ); */
    });
  }
}
