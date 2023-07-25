import 'package:flutter/material.dart';
import 'package:start_with_flutter_again/Charly/javierdev/presentation/screens/screens.dart';
// import 'package:start_with_flutter_again/javierdev/presentation/screens/home/HomeScreenJD.dart';

class JavierDev extends StatelessWidget {
  const JavierDev({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JavierDev',
      theme: ThemeData(
          primaryColor: Colors.green,
          primaryColorLight: Colors.amber,
          primarySwatch: Colors.red),
      initialRoute: HomeScreenJD.routeName,
      routes: {
        HomeScreenJD.routeName: (_) => const HomeScreenJD(),
        NewUserScreenJD.routeName: (_) => const NewUserScreenJD(),
        DetailUserScreenJD.routeName: (_) => const DetailUserScreenJD(),
      },
    );
  }
}
