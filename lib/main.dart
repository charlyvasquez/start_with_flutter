import 'package:flutter/material.dart';
import 'package:start_with_flutter_again/Charly/main_charly.dart';
import 'package:start_with_flutter_again/Charly/pages/pages70.dart';
import 'package:start_with_flutter_again/Milton/main_milton.dart';
import 'package:start_with_flutter_again/Sebastian/main_sebastian.dart';

//void main() => runApp(const MiApp());
void main() {
  runApp(const MiApp());

  /* WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(const MiApp());
  }); */
}

class MiApp extends StatelessWidget {
  const MiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      myService: MyService(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Mi App Trio Dinamico",
        home: InicioDeTodo(),
        /* theme: ThemeData(
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.red))) */
      ),
    );
  }
}

class InicioDeTodo extends StatefulWidget {
  const InicioDeTodo({super.key});

  @override
  State<InicioDeTodo> createState() => _InicioDeTodoState();
}

class _InicioDeTodoState extends State<InicioDeTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF5e1deb).withOpacity(0.7),
        appBar: AppBar(
          backgroundColor: Color(0xFF5e1deb),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/logos/hublab.png',
                    scale: 3.0,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: "wi",
                        style:
                            TextStyle(color: Color(0xFFfec052), fontSize: 22)),
                    TextSpan(
                        text: "th ",
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                    TextSpan(
                        text: "Dynamic",
                        style:
                            TextStyle(color: Color(0xFFfec052), fontSize: 22)),
                    TextSpan(
                        text: "Trio",
                        style: TextStyle(color: Colors.white, fontSize: 22))
                  ])),
                  const SizedBox(
                    height: 5.0,
                  )
                ],
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botonPageCharly(context),
              botonPageMilton(context),
              botonPageSebastian(context)
            ],
          ),
        ));
  }
}

Widget botonPageCharly(context) {
  return RawMaterialButton(
    textStyle: TextStyle(color: Colors.white),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Color(0xFF5e1deb),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => const Inicio(),
          // Pagina80(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 3000),
        ),
      );
    },
    child: RichText(
        text: const TextSpan(children: [
      TextSpan(
          text: "Sección ",
          style: TextStyle(color: Color(0xFFfec052), fontSize: 22)),
      TextSpan(
          text: "d", style: TextStyle(color: Color(0xFFfec052), fontSize: 22)),
      TextSpan(text: "e ", style: TextStyle(color: Colors.white, fontSize: 22)),
      TextSpan(
          text: "Charly", style: TextStyle(color: Colors.white, fontSize: 22))
    ])),
  );
}

Widget botonPageMilton(context) {
  return RawMaterialButton(
    textStyle: const TextStyle(color: Colors.white),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Color(0xFF5e1deb),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => const MainMilton(),
          // Pagina80(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 3000),
        ),
      );
    },
    child: RichText(
        text: const TextSpan(children: [
      TextSpan(
          text: "Sección ",
          style: TextStyle(color: Color(0xFFfec052), fontSize: 22)),
      TextSpan(
          text: "d", style: TextStyle(color: Color(0xFFfec052), fontSize: 22)),
      TextSpan(text: "e ", style: TextStyle(color: Colors.white, fontSize: 22)),
      TextSpan(
          text: "Milton", style: TextStyle(color: Colors.white, fontSize: 22))
    ])),
  );
}

Widget botonPageSebastian(context) {
  return RawMaterialButton(
    textStyle: const TextStyle(color: Colors.white),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Color(0xFF5e1deb),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => const MainSebastian(),
          // Pagina80(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 3000),
        ),
      );
    },
    child: RichText(
        text: const TextSpan(children: [
      TextSpan(
          text: "Sección ",
          style: TextStyle(color: Color(0xFFfec052), fontSize: 22)),
      TextSpan(
          text: "d", style: TextStyle(color: Color(0xFFfec052), fontSize: 22)),
      TextSpan(text: "e ", style: TextStyle(color: Colors.white, fontSize: 22)),
      TextSpan(
          text: "Sebastian",
          style: TextStyle(color: Colors.white, fontSize: 22))
    ])),
  );
}
