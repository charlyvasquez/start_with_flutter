/*import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:start_with_flutter_again/javierdev/presentation/app.dart';
import 'package:start_with_flutter_again/pages/gol-ball.dart';
import 'package:start_with_flutter_again/pages/page_web_socket.dart';
import 'package:start_with_flutter_again/pages/pages02.dart';
import 'package:start_with_flutter_again/pages/pages10.dart';
import 'package:start_with_flutter_again/pages/pages20.dart';
import 'package:start_with_flutter_again/pages/pages200.dart';
import 'package:start_with_flutter_again/pages/pages30.dart';
import 'package:start_with_flutter_again/pages/pages300.dart';
import 'package:start_with_flutter_again/pages/pages40.dart';
import 'package:start_with_flutter_again/pages/pages50.dart';
import 'package:start_with_flutter_again/pages/pages60.dart';
import 'package:start_with_flutter_again/pages/pages70.dart';
import 'package:start_with_flutter_again/pages/pages80.dart';
import 'package:start_with_flutter_again/pages/pages90.dart';
import 'package:start_with_flutter_again/src/pages/animaciones_page91.dart';
import 'package:start_with_flutter_again/src/pages/headers_page90.dart';
import 'package:start_with_flutter_again/src/pages/tester_page.dart';

//void main() => runApp(const MiApp());
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(const MiApp());
  });
}

class MiApp extends StatelessWidget {
  const MiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      myService: MyService(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Mi App",
        home: Inicio(),
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

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  TextEditingController _textoController = TextEditingController(text: "");
  TextEditingController _textoController1 = TextEditingController(text: "");
  TextEditingController _textoControllerDimayor = TextEditingController();

  List _usuarios = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUsers();
    _textoControllerDimayor.addListener(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textoControllerDimayor.dispose();
  }

  void _getUsers() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("users");
    QuerySnapshot users = await collectionReference.get();
    if (users.docs.length > 0) {
      for (var doc in users.docs) {
        print("Esta es la data");
        print(doc.data().toString());
        _usuarios.add(doc.data());
        print(_usuarios.toString());
      }
    } else {
      print("No hay data");
      print(users.docs.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    //TextEditingController _textoController = TextEditingController(text: "");
    return Scaffold(
        appBar: AppBar(
          title: const Text("Listado de Emisoras"),
        ),
        body: cuerpoContainer(context, _textoController, _textoController1,
            _textoControllerDimayor, _usuarios)); //cuerpo());
  }

  ListView cuerpo() {
    return ListView(
      padding: const EdgeInsets.only(top: 10.0),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/Activa%20Online.png?alt=media&token=02d1702b-265d-4a1a-8324-f2a235861b30"),
            ),
            Container(
              width: 100.0,
              height: 100.0,
              child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/106.7%20Oye%20FM.png?alt=media&token=38e10efa-efdc-4ded-ae17-09bfeca982f6"),
              color: const Color(0x0011000a),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/93.5%20Oye%20FM.png?alt=media&token=70cc913c-f6ba-4226-8802-1b033d234b35"),
                ),
                Container(
                  width: 100.0,
                  height: 100.0,
                  child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/95.1%20Oye%20FM.png?alt=media&token=5c5f0d40-a75d-4a33-a881-c88d39a33375"),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/AGN%20107.5%20FM.png?alt=media&token=609bcaec-db68-4e0b-8d5a-7c947f1a4991",
                //fit: BoxFit.fill,
              ),
            ),
            Container(
              width: 100.0,
              height: 100.0,
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/Accion%20104.5%20FM.png?alt=media&token=d7e8ee42-79de-4cdc-9af9-c84a51153e98",
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/Adulto%20Joven%2088.1%20FM.png?alt=media&token=73e53ce2-a778-43fa-878a-3141a890f780"),
            ),
            Container(
              width: 100.0,
              height: 100.0,
              child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/Advanta%2098.7%20FM.png?alt=media&token=4a302389-4f98-489b-a026-44665e5fc18a"),
            ),
          ],
        ),
        Column(
          children: const [
            Text("Emisoras20"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Emisoras1"),
            SizedBox(width: 10),
            Text("Emisoras3"),
            SizedBox(width: 10),
            Text("Emisoras5"),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  var timeNow = DateTime.now();
                  print(timeNow);
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.access_alarm,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Time2",
                      textScaleFactor: 1.0,
                    ),
                  ],
                )),
          ],
        ),
        /* cuerpoContainer(context, _textoController, _textoController1,
            _textoControllerDimayor, _usuarios) */
      ],
    );
  }
}

Widget cuerpoContainer(
  context,
  _textoController,
  _textoController1,
  _textoControllerDimayor,
  _usuarios,
) {
  //TextEditingController _textoController = TextEditingController(text: "");
  return Column(
    children: [
      Expanded(
        child: ListView(/* physics: ClampingScrollPhysics(),  */
            children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://webdeimagenes.com/wp-content/uploads/2018/02/14-5.jpg"),
                      fit: BoxFit.cover)),
              //width: 200,
              //height: 200,

              //alignment: Alignment.center,
              //color: Colors.black,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  nombreCuerpo(),
                  campoUsuario(_textoController1),
                  campoContrasena(),
                  botonEntrar(context),
                  botonPage2(context),
                  botonPage3(context),
                  botonPage4(context),
                  botonOtro5(context),
                  botonOtro6(context),
                  botonPage10(context),
                  botonPage11(context),
                  botonPage12(context),
                  botonPage13(context),
                  botonPage14(context),
                  botonPage15(context),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: _textoController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Ingresa Infromación",
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: Color(0xFFD6D6D6),
                          filled: true),
                      cursorColor: Colors.grey,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      //controller: _textoControllerDimayor,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          //border: InputBorder.none,
                          labelText: "Ingresa Nombre onChanged",
                          //hintText: "Ingresa Nombre",
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: Color(0xFFD6D6D6),
                          filled: true),
                      onChanged: (changeOk) {
                        print("Text $changeOk");
                      },
                      cursorColor: Colors.grey,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: _textoControllerDimayor,
                      decoration: const InputDecoration(
                          //border: OutlineInputBorder(),
                          border: InputBorder.none,
                          labelText: "Ingresa Nombre controller",
                          //hintText: "Ingresa Nombre",
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: Color(0xFFD6D6D6),
                          filled: true),
                      onChanged: (changeOk) {
                        print("Text $changeOk");
                      },
                      cursorColor: Colors.grey,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.yellow,
                          onPrimary: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10)),
                      onPressed: () {
                        print(_textoController.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PageStateLes(_textoController.text)));
                      },
                      child: const Text("Enviar a Page StateLes")),
                  botonPageStateFull(
                      context, _textoController, _textoController1),
                  botonPage16(context, _usuarios),
                  botonPage18(context),
                  botonPage19(context),
                  botonPageWebSocket(context),
                  clipRRectBorderRadius(),
                  containerBorderRadius(),
                  containerShapeCircleShadow(),
                  containerShapeBorder(),
                  containerBorderRadiusBorder(),
                  botonPage20(context),
                  botonPage21(context),
                  botonPage22(context),
                  botonPage23(context),
                  botonPage24(context),
                  botonPage25(context),
                  botonPage26(context),
                  botonPage27(context),
                  botonPage28(context),
                  botonPage29(context),
                  botonPage30(context),
                  botonPage31(context),
                  botonPage32(context),
                  botonPage33(context),
                  botonPage34(context),
                  botonPage35(context),
                  botonPage40(context),
                  botonPage41(context),
                  botonPage42(context),
                  botonPage43(context),
                  botonPage44(context),
                  botonPage45(context),
                  botonPage46(context),
                  botonPage47(context),
                  botonPage48(context),
                  botonPage49(context),
                  botonPage50(context),
                  botonPage51(context),
                  botonPage52(context),
                  botonPage53(context),
                  botonPage54(context),
                  botonPage55(context),
                  botonPage56(context),
                  botonPage57(context),
                  botonPage58(context),
                  botonPage59(context),
                  botonPage60(context),
                  botonPage61(context),
                  botonPage62(context),
                  botonPage63(context),
                  botonPage64(context),
                  botonPage65(context),
                  botonPage66(context),
                  botonPage67(context),
                  botonPage68(context),
                  botonPage69(context),
                  botonPage70(context),
                  botonPage71(context),
                  botonPage72(context),
                  botonPage73(context),
                  botonPage74(context),
                  botonPage75(context),
                  botonPage80(context),
                  botonPage90(context),
                  botonPage91(context),
                  botonPage92(context),
                  botonPage93(context),
                  botonPage200(context),
                  botonPage201(context),
                  botonPage202(context),
                  botonPage203(context),
                  botonPage300(context),
                  botonPage301(context),
                ],
              ))),
        ]
            /* child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://webdeimagenes.com/wp-content/uploads/2018/02/14-5.jpg"),
                      fit: BoxFit.cover)),
              //width: 200,
              //height: 200,
        
              //alignment: Alignment.center,
              //color: Colors.black,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  nombreCuerpo(),
                  campoUsuario(),
                  campoContrasena(),
                  botonEntrar(context),
                  botonPage2(context),
                  botonPage3(context),
                  botonPage4(context),
                  botonOtro5(context),
                  botonPage10(context),
                  botonPage11(context),
                  botonPage12(context),
                  botonPage13(context),
                  botonPage14(context),
                  botonPage15(context),
                  Container(
                    //color: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: const TextField(
                      //controller: _textoController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Ingresa Infromación",
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: Color(0xFFD6D6D6),
                          filled: true),
                      cursorColor: Colors.grey,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.yellow,
                          onPrimary: Colors.black,
                          padding:
                              const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                      onPressed: () {
                        print(_textoController);
                        /* Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Pagina01())); */
                      },
                      child: const Text("Login Page_01"))
                ],
              ))),
         */
            ),
      ),
      Expanded(child: cuerpo())
    ],
  );
}

Widget botonPage301(context) {
  return RawMaterialButton(
    textStyle: TextStyle(color: Colors.white),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Colors.purple,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => const LoginHypersoftWorkflow(),
          // pageBuilder: (c, a1, a2) => const HomePageHypersoftWorkFlow(),
          // Pagina80(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 3000),
        ),
      );
    },
    child: const Text("Hypersoft WorkFlow"),
  );
}

Widget botonPage300(context) {
  return RawMaterialButton(
    textStyle: TextStyle(color: Colors.white),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Colors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => const CorrientesDeMallas(),
          // Pagina80(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 3000),
        ),
      );
    },
    child: const Text("Corrientes de Mallas"),
  );
}

Widget botonPage203(context) {
  return RawMaterialButton(
    textStyle: TextStyle(color: Colors.white),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Colors.red,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => const FileGLBtesHomerStl(),
          // Pagina80(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 3000),
        ),
      );
    },
    child: const Text("Archivo STL 3D babylonjs_viewer HomerStl"),
  );
}

Widget botonPage202(context) {
  return RawMaterialButton(
    textStyle: TextStyle(color: Colors.white),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Colors.red.shade100,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => const FileGLBtestHouseObj(),
          // Pagina80(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 3000),
        ),
      );
    },
    child: const Text("Archivo OBJ 3D flutter_cube HouseObj"),
  );
}

Widget botonPage201(context) {
  return RawMaterialButton(
    textStyle: TextStyle(color: Colors.white),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Colors.red.shade900,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => const FileGLBtestHouse(),
          // Pagina80(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 3000),
        ),
      );
    },
    child: const Text("Archivo GLP 3D babylonjs_viewer House"),
  );
}

Widget botonPage200(context) {
  return RawMaterialButton(
    textStyle: TextStyle(color: Colors.white),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Colors.red.shade800,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => const FileGLBtest(),
          // Pagina80(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 3000),
        ),
      );
    },
    child: const Text("Archivo GLP 3D babylonjs_viewer"),
  );
}

Widget botonPage93(context) {
  return RawMaterialButton(
    textStyle: TextStyle(color: Colors.white),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Colors.red.shade700,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => const JavierDev(),
          // Pagina80(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 3000),
        ),
      );
    },
    child: const Text("JavierDev listAPI"),
  );
}

Widget botonPage92(context) {
  return RawMaterialButton(
    textStyle: TextStyle(color: Colors.black),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Colors.orange.shade700,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => WebViewExample(),
          // Pagina80(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 3000),
        ),
      );
    },
    child: const Text("WebViewExample Page_92"),
  );
}

Widget botonPage91(context) {
  return RawMaterialButton(
    textStyle: TextStyle(color: Colors.black),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Colors.orange.shade700,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => AnimacionesPage91(),
          // Pagina80(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 3000),
        ),
      );
    },
    child: const Text("CustomAnimation Page_91"),
  );
}

Widget botonPage90(context) {
  return RawMaterialButton(
    textStyle: TextStyle(color: Colors.black),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Colors.orange.shade600,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => HeadersPage90(),
          // Pagina80(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 3000),
        ),
      );
    },
    child: const Text("CustomPainter Page_90"),
  );
}

Widget botonPage80(context) {
  return RawMaterialButton(
    textStyle: TextStyle(color: Colors.black),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Colors.orange.shade500,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => SplashGolBall(), //MainPage(indexOpen: 0),
          // Pagina80(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 3000),
        ),
      );
    },
    child: const Text("Gol-Ball Page_80"),
  );
}

Widget botonPage75(context) {
  return RawMaterialButton(
    textStyle: TextStyle(color: Colors.black),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Colors.orange.shade50,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => Pagina75(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 3000),
        ),
      );
    },
    child: const Text("twilio_programmable_video Page_75"),
  );
}

Widget botonPage74(context) {
  return RawMaterialButton(
    textStyle: TextStyle(color: Colors.black),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Colors.orange.shade400,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => Pagina74(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 3000),
        ),
      );
    },
    child: const Text("agora_rtc_engine Page_74"),
  );
}

Widget botonPage73(context) {
  return RawMaterialButton(
    textStyle: TextStyle(color: Colors.black),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Colors.orange.shade300,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => Pagina73(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 3000),
        ),
      );
    },
    child: const Text("flutter_phone_direct_caller Page_73"),
  );
}

Widget botonPage72(context) {
  return RawMaterialButton(
    textStyle: TextStyle(color: Colors.black),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Colors.orange.shade200,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => Pagina72(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 3000),
        ),
      );
    },
    child: const Text("Ciclos de Vida Page_72"),
  );
}

Widget botonPage71(context) {
  return RawMaterialButton(
    textStyle: TextStyle(color: Colors.black),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Colors.orange.shade100,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => Pagina71(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 3000),
        ),
      );
    },
    child: const Text("InheritedWidget Listen Page_71"),
  );
}

Widget botonPage70(context) {
  return RawMaterialButton(
    textStyle: TextStyle(color: Colors.white),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Colors.orange.shade900,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => Pagina70(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 3000),
        ),
      );
    },
    child: const Text("InheritedWidget Page_70"),
  );
}

Widget botonPage69(context) {
  return RawMaterialButton(
    textStyle: TextStyle(color: Colors.white),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: Colors.blue.shade900,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    onPressed: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => Pagina69(),
          transitionsBuilder: (c, anim, a2, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 3000),
        ),
      );
    },
    child: const Text("SplashScreen Page_69"),
  );
}

Widget botonPage68(context) {
  return RawMaterialButton(
      textStyle: TextStyle(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      fillColor: Colors.blue.shade700,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => Pagina68(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 3000),
          ),
        );
      },
      child: const Text("Api Calling DummyJson Page_68"));
}

Widget botonPage67(context) {
  return RawMaterialButton(
      textStyle: TextStyle(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      fillColor: Colors.blue.shade500,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => Pagina67(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 3000),
          ),
        );
      },
      child: const Text("StreamBuilderFetch Page_67"));
}

Widget botonPage66(context) {
  return RawMaterialButton(
      textStyle: TextStyle(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      fillColor: Colors.blue.shade300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => Pagina66(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 3000),
          ),
        );
      },
      child: const Text("StreamBuilder Page_66"));
}

Widget botonPage65(context) {
  return RawMaterialButton(
      textStyle: TextStyle(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      fillColor: Colors.red.shade300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => Pagina65(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 3000),
          ),
        );
      },
      child: const Text("Scanning QR Code Page_65"));
}

Widget botonPage64(context) {
  return RawMaterialButton(
      textStyle: TextStyle(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      fillColor: Colors.red.shade500,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => Pagina64(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 3000),
          ),
        );
      },
      child: const Text("Generate QR Code Page_64"));
}

Widget botonPage63(context) {
  return RawMaterialButton(
      textStyle: TextStyle(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      fillColor: Colors.red.shade700,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => Pagina63(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 3000),
          ),
        );
      },
      child: const Text("Pomodoro Clock Page_63"));
}

Widget botonPage62(context) {
  return RawMaterialButton(
      textStyle: TextStyle(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      fillColor: Colors.red.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => Pagina62(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 3000),
          ),
        );
      },
      child: const Text("Compass App, Page_62"));
}

Widget botonPage61(context) {
  return RawMaterialButton(
      textStyle: TextStyle(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      fillColor: Colors.redAccent.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => /* HomePagePDF(), //  */ Pagina61(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 3000),
          ),
        );
      },
      child: const Text("PDF Reader, Page_61"));
}

Widget botonPage60(context) {
  return RawMaterialButton(
      textStyle: TextStyle(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      fillColor: Colors.redAccent.shade200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => Pagina60(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 3000),
          ),
        );
      },
      child: const Text("Flip Card Animation, Page_60"));
}

Widget botonPage59(context) {
  return RawMaterialButton(
      textStyle: TextStyle(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      fillColor: Colors.redAccent.shade700,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => Pagina59(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 3000),
          ),
        );
      },
      child: const Text("3D Card Animation, Page_59"));
}

Widget botonPage58(context) {
  return RawMaterialButton(
      textStyle: TextStyle(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      fillColor: Colors.redAccent.shade400,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => Pagina58(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 3000),
          ),
        );
      },
      child: const Text("Wordle Clone, Page_58"));
}

Widget botonPage57(context) {
  return RawMaterialButton(
      textStyle: TextStyle(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      fillColor: AppColorHangman.primaryColor, //Colors.redAccent.shade400,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => Pagina57(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 3000),
          ),
        );
      },
      child: const Text("Hangman Game, Page_57"));
}

Widget botonPage56(context) {
  return RawMaterialButton(
      textStyle: TextStyle(color: Colors.red),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      fillColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => Pagina56(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 2000),
          ),
        );
        /* Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina45())); */
      },
      child: const Text("3D Navigation Drawer, Page_56"));
  /* return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.lightGreenAccent,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => Pagina56(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 2000),
          ),
        );
        /* Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina45())); */
      },
      child: const Text("3D Navigation Drawer, Page_56")); */
}

Widget botonPage55(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.red,
          onPrimary: Colors.greenAccent,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.of(context).push(_createRoute());

        /* Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina55())); */
      },
      child: const Text("Header hidden Page 55"));
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Pagina55(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curve = Curves.ease;
      var curveTween = CurveTween(curve: curve);

      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      // final tween = Tween(begin: begin, end: end);
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

Widget botonPage54(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.grey,
          onPrimary: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => Pagina54(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 5000),
          ),
        );
        /* Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina54())); */
      },
      child: const Text("Pagination Example Page 54"));
}

Widget botonPage53(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.greenAccent,
          onPrimary: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Pagina53()));
      },
      child: const Text("Game Sneak Page 53"));
}

Widget botonPage52(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple,
          onPrimary: Colors.white.withRed(100),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        /* Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Pagina52())); */
        Navigator.of(context).push(SecondPage52Route());
      },
      child: const Text("CardCustom Image Page 52"));
}

class SecondPage52Route extends CupertinoPageRoute {
  SecondPage52Route()
      : super(builder: (BuildContext context) => const Pagina52());

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(opacity: animation, child: const Pagina52());
  }
}

Widget botonPage51(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.deepOrangeAccent,
          onPrimary: Colors.white.withRed(100),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        /* Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina49())); */
        Navigator.of(context).push(SecondPage51Route());
      },
      child: const Text("Move Background Image Page 51"));
}

class SecondPage51Route extends CupertinoPageRoute {
  SecondPage51Route()
      : super(builder: (BuildContext context) => const Pagina51());

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return RotationTransition(
        turns: animation,
        child: ScaleTransition(
          alignment: Alignment.topCenter,
          scale: animation,
          child: FadeTransition(
            opacity: animation,
            child: const Pagina51(),
          ),
        ));
  }
}

Widget botonPage50(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.deepOrange,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Pagina50(), fullscreenDialog: true));
      },
      child: const Text("3D Ball Page 50"));
}

Widget botonPage49(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.lightGreen,
          onPrimary: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(context, PageRouteBuilder(pageBuilder:
            (BuildContext context, Animation<double> a1, Animation<double> a2) {
          return Pagina49();
        }));
        /* Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina49())); */
      },
      child: const Text("Circular and Linear Progress Page 49"));
}

Widget botonPage48(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.lightGreenAccent,
          onPrimary: Colors.blue,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(context, BouncyPageRoute(widget: Pagina48()));
        /* Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina48())); */
      },
      child: const Text("Ticket Booking App Page 48"));
}

class BouncyPageRoute extends PageRouteBuilder {
  final Widget widget;

  BouncyPageRoute({required this.widget})
      : super(
            transitionDuration: const Duration(seconds: 2),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.elasticInOut);
              return ScaleTransition(
                  scale: animation,
                  // alignment: Alignment.topCenter,
                  child: child);
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            });
}

Widget botonPage47(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.lightGreenAccent,
          onPrimary: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.of(context).push(CustomPageRoute(
            child: const Pagina47() /* , direction: AxisDirection.down */));
        /* Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina47())); */
      },
      child: const Text("FittedBox, Page_47"));
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  // final AxisDirection direction;

  CustomPageRoute({
    required this.child,
    // this.direction = AxisDirection.right,
  }) : super(
            transitionDuration: const Duration(seconds: 2),
            reverseTransitionDuration: const Duration(seconds: 5),
            pageBuilder: (context, animation, secondaryAnimation) {
              return child;
            });

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
        position: Tween<Offset>(
                begin: Offset(-1.0, 0),
                /* Offset(-1.0, 0) De Izq a Der */
                /* Offset(1.0, 0) De Der a Izq */
                /* Offset(0.0, -1) De Arriba hacia Abajo */
                /* Offset(0, 1.0) De Abajo hacia Arriba */

                //otra forma con el AxisDirection
                // begin: getBeginOffset(),
                end: Offset.zero)
            .animate(animation),
        child: child);
    // super.buildTransitions(context, animation, secondaryAnimation, child);
  }

  /* Offset getBeginOffset() {
    switch (direction) {
      case AxisDirection.up:
        return Offset(0, 1.0);
      case AxisDirection.down:
        return Offset(0.0, -1);
      case AxisDirection.right:
        return Offset(-1.0, 0);
      case AxisDirection.left:
        return Offset(1.0, 0);
    }
  } */
}

Widget botonPage46(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.lightGreenAccent,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina46()));
      },
      child: const Text("Permisos en iOS, Page_46"));
}

Widget botonPage45(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.lightGreen,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => Pagina45(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 5000),
          ),
        );
        /* Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina45())); */
      },
      child: const Text("Lista de Tareas, Page_45"));
}

Widget botonPage44(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.lightBlue,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina44()));
      },
      child: const Text("DropDown AppBar2, Page_44"));
}

Widget botonPage43(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.lightBlue,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina43()));
      },
      child: const Text("DropDown AppBar, Page_43"));
}

Widget botonPage42(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.blueGrey,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina42()));
      },
      child: const Text("Scroll Horiz mitad, Page_42"));
}

Widget botonPage41(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.blueGrey,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina41()));
      },
      child: const Text("Generate, Dismissible, ListTile Page_41"));
}

Widget botonPage40(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.blueAccent,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ListadoProductos(titulo: "ListView && SnackBar Page_40")));
      },
      child: const Text("ListView Page_40"));
}

Widget botonPage35(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black87,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina35()));
      },
      child: const Text("Wrap con chip Page_35"));
}

Widget botonPage34(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black54,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina34()));
      },
      child: const Text("SafeArea ListGenerate Page_34"));
}

Widget botonPage33(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black45,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina33()));
      },
      child: const Text("Wheel Scroll Page_33"));
}

Widget botonPage32(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black38,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina32()));
      },
      child: const Text("Time Picker Page_32"));
}

Widget botonPage31(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black26,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina31()));
      },
      child: const Text("Date Picker Page_31"));
}

Widget botonPage30(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black12,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina30()));
      },
      child: const Text("Simple Slider Page_30"));
}

Widget botonPage29(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina29()));
      },
      child: const Text("Icon Animated Page_29"));
}

Widget botonPage28(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.amberAccent,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina28()));
      },
      child: const Text("User Input Page_28"));
}

Widget botonPage27(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.amber,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Pagina27())); //Pagina16(_usuarios)));
      },
      child: const Text("StackWidgets Page_27"));
}

Widget botonPage26(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.grey,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Pagina26())); //Pagina16(_usuarios)));
      },
      child: const Text("Timer Page_26"));
}

Widget botonPage25(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.deepOrangeAccent,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Pagina25())); //Pagina16(_usuarios)));
      },
      child: const Text("RichText Page_25"));
}

Widget botonPage24(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.green,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Pagina24())); //Pagina16(_usuarios)));
      },
      child: const Text("MediaQuery & TextStyle Page_24"));
}

Widget botonPage23(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Pagina23())); //Pagina16(_usuarios)));
      },
      child: const Text("TabBar Page_23"));
}

Widget botonPage22(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.deepPurpleAccent,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Pagina22())); //Pagina16(_usuarios)));
      },
      child: const Text("SliverAppBar Page_22"));
}

Widget botonPage21(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.deepOrange,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Pagina21())); //Pagina16(_usuarios)));
      },
      child: const Text("GridView Page_21"));
}

Widget clipRRectBorderRadius() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: Container(
        alignment: Alignment.center,
        height: 70,
        width: 70,
        color: Colors.deepPurple,
        child: const Text(
          "Sign in",
          style: TextStyle(
              /* color: Colors.white, */ fontSize: 10,
              fontWeight: FontWeight.bold),
        )),
  );
}

Widget containerBorderRadius() {
  return Container(
      padding: EdgeInsets.only(right: 5, bottom: 5),
      alignment: Alignment(1, -1),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.yellow,
      ),
      child: const Text(
        "Sign in",
        style: TextStyle(
            /* color: Colors.white, */ fontSize: 10,
            fontWeight: FontWeight.bold),
      ));
}

Widget containerShapeCircleShadow() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.0),
    color: Colors.grey[300],
    height: 150,
    width: 150,
    child: Center(
      child: Container(
          /* margin: EdgeInsets.symmetric(vertical: 10.0),
          padding: EdgeInsets.symmetric(vertical: 10.0), */
          alignment: Alignment(0, 0),
          height: 70,
          // width: 70,
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
                const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0)
              ]),
          child: const Text(
            "Sign in",
            style: TextStyle(
                color: Colors.red, fontSize: 10, fontWeight: FontWeight.bold),
          )),
    ),
  );
}

Widget containerShapeBorder() {
  return Container(
      height: 70,
      // width: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.red /* , width: 1 */),
      ),
      child: const Center(
        child: Text(
          "Sign in",
          style: TextStyle(
              color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ));
}

Widget containerBorderRadiusBorder() {
  return Container(
    height: 70,
    width: 70,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: Colors.red,
        border: Border.all(color: Colors.red, width: 65)),
  );
}

Widget botonPage20(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.red,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Pagina20())); //Pagina16(_usuarios)));
      },
      child: const Text("ListView Post Personalizado Page_20"));
}

Widget nombreCuerpo() {
  return const Text(
    "Sign in",
    style: TextStyle(
        color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
  );
}

Widget campoUsuario(_textoController1) {
  return Container(
    //color: Colors.green,
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    child: TextField(
      controller: _textoController1,
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Name User",
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Colors.white,
          filled: true),
      cursorColor: Colors.grey,
      style: TextStyle(color: Colors.black),
    ),
  );
}

Widget campoContrasena() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    child: const TextField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Colors.white,
          filled: true),
      cursorColor: Colors.grey,
      style: TextStyle(color: Colors.black),
    ),
  );
}

Widget botonEntrar(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Pagina01()));
      },
      child: const Text("Login Page_01"));
}

Widget botonOtro5(context) {
  return TextButton(
      style: TextButton.styleFrom(
          primary: Colors.black, backgroundColor: Colors.yellow),
      onPressed: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Pagina05()))
          },
      child: const Text(
        "Touch Me Page_05",
        //style: TextStyle(color: Colors.white),
      ));
}

Widget botonOtro6(context) {
  return TextButton(
      style: TextButton.styleFrom(
          primary: Colors.black, backgroundColor: Colors.yellow),
      onPressed: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Pagina06()))
          },
      child: const Text(
        "PageView Page_06",
        //style: TextStyle(color: Colors.white),
      ));
}

Widget botonPage2(context) {
  return TextButton(
      style: TextButton.styleFrom(
          primary: Colors.black, backgroundColor: Colors.yellow),
      onPressed: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Pagina02()))
          },
      child: const Text(
        "Page_02",
        //style: TextStyle(color: Colors.white),
      ));
}

Widget botonPage3(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Pagina03()));
      },
      child: const Text("ListView Page_03"));
}

Widget botonPage4(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Pagina04()));
      },
      child: const Text("API REST Page_04"));
}

Widget botonPage10(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina10()));
      },
      child: const Text("API REST continue Page_10"));
}

Widget botonPage11(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina11()));
      },
      child: const Text("Giphy Page_11"));
}

Widget botonPage12(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina12()));
      },
      child: const Text("AppBar & Bottom Navigation Bar Page_12"));
}

Widget botonPage13(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina13()));
      },
      child: const Text("Container Animation Page_13"));
}

Widget botonPage14(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina14()));
      },
      child: const Text("Carrusel Swiper Page_14"));
}

Widget botonPage15(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Pagina15()));
      },
      child: const Text("Shared Preferences Page_15"));
}

Widget botonPageStateFull(context, _textoController, _textoController1) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PageStateFull(
                    _textoController1.text == _textoController.text
                        ? "Son iguales"
                        : "Son Diferentes")));
      },
      child: const Text("Enviar a Page StateFull"));
}

Widget botonPage16(context, _usuarios) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Pagina17())); //Pagina16(_usuarios)));
      },
      child: const Text("Usuarios Firebase Page_17"));
}

Widget botonPage18(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Pagina18())); //Pagina16(_usuarios)));
      },
      child: const Text("Drawer Page_18"));
}

Widget botonPage19(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Pagina19())); //Pagina16(_usuarios)));
      },
      child: const Text("Fade Transition Page_19"));
}

Widget botonPageWebSocket(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PageWebSocket())); //Pagina16(_usuarios)));
      },
      child: const Text("Page Web Socket Demo"));
}


/* import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// import 'package:flutter_inappwebview_example/chrome_safari_browser_example.screen.dart';
// import 'package:flutter_inappwebview_example/headless_in_app_webview.screen.dart';
// import 'package:flutter_inappwebview_example/in_app_webiew_example.screen.dart';
// import 'package:flutter_inappwebview_example/in_app_browser_example.screen.dart';
import 'package:start_with_flutter_again/pages/chrome_safari_browser_example.screen.dart';
import 'package:start_with_flutter_again/pages/headless_in_app_webview.screen.dart';
import 'package:start_with_flutter_again/pages/in_app_browser_example.screen.dart';
// import 'package:start_with_flutter_again/pages/in_app_webiew_example.screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

// InAppLocalhostServer localhostServer = new InAppLocalhostServer();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.camera.request();
  await Permission.microphone.request();
  await Permission.storage.request();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

    var swAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
    var swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

    if (swAvailable && swInterceptAvailable) {
      AndroidServiceWorkerController serviceWorkerController =
          AndroidServiceWorkerController.instance();

      await serviceWorkerController
          .setServiceWorkerClient(AndroidServiceWorkerClient(
        shouldInterceptRequest: (request) async {
          print(request);
          return null;
        },
      ));
    }
  }

  runApp(MiApp());
}

Drawer myDrawer({required BuildContext context}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('flutter_inappbrowser example'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('InAppBrowser'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/InAppBrowser');
          },
        ),
        ListTile(
          title: Text('ChromeSafariBrowser'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/ChromeSafariBrowser');
          },
        ),
        ListTile(
          title: Text('InAppWebView'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        ListTile(
          title: Text('HeadlessInAppWebView'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/HeadlessInAppWebView');
          },
        ),
      ],
    ),
  );
}

class MiApp extends StatefulWidget {
  @override
  _MiAppState createState() => new _MiAppState();
}

class _MiAppState extends State<MiApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      // '/': (context) => InAppWebViewExampleScreen(),
      '/': (context) => InAppBrowserExampleScreen(),
      '/InAppBrowser': (context) => InAppBrowserExampleScreen(),
      '/ChromeSafariBrowser': (context) => ChromeSafariBrowserExampleScreen(),
      '/HeadlessInAppWebView': (context) => HeadlessInAppWebViewExampleScreen(),
    });
  }
} */




//VideoSdk
// import 'package:flutter/material.dart';
// import 'api.dart';
// import 'join_screen.dart';
// import 'meeting_screen.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       title: 'VideoSDK QuickStart',
//       home: VideoSDKQuickStart(),
//     ),
//   );
// }

// class VideoSDKQuickStart extends StatefulWidget {
//   const VideoSDKQuickStart({Key? key}) : super(key: key);

//   @override
//   State<VideoSDKQuickStart> createState() => _VideoSDKQuickStartState();
// }

// class _VideoSDKQuickStartState extends State<VideoSDKQuickStart> {
//   String meetingId = "";
//   bool isMeetingActive = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("VideoSDK QuickStart"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: isMeetingActive
//             ? MeetingScreen(
//                 meetingId: meetingId,
//                 token: token,
//                 leaveMeeting: () {
//                   setState(() => isMeetingActive = false);
//                 },
//               )
//             : JoinScreen(
//                 onMeetingIdChanged: (value) => meetingId = value,
//                 onCreateMeetingButtonPressed: () async {
//                   meetingId = await createMeeting();
//                   setState(() => isMeetingActive = true);
//                 },
//                 onJoinMeetingButtonPressed: () {
//                   setState(() => isMeetingActive = true);
//                 },
//               ),
//       ),
//     );
//   }
// }



//Flutter call
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
// import 'package:package_info_plus/package_info_plus.dart';

// void main() => runApp(const MiApp());

// class MiApp extends StatefulWidget {
//   const MiApp({Key? key}) : super(key: key);

//   @override
//   _MiAppState createState() => _MiAppState();
// }

// class _MiAppState extends State<MiApp> {
//   final TextEditingController _numberCtrl = TextEditingController();

//   String version = "";
//   String buildNumber = "";

//   @override
//   void initState() {
//     super.initState();
//     _numberCtrl.text = "085921191121";

//     PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
//       String appName = packageInfo.appName;
//       String packageName = packageInfo.packageName;
//       setState(() {
//         version = packageInfo.version;
//         buildNumber = packageInfo.buildNumber;
//       });
//       print("appName" + appName);
//       print("packageName" + packageName);
//       print("version" + version);
//       print("buildNumber" + buildNumber);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: _numberCtrl,
//                 decoration: const InputDecoration(labelText: "Phone Number"),
//                 keyboardType: TextInputType.number,
//               ),
//             ),
//             ElevatedButton(
//               child: const Text("Test Call"),
//               onPressed: () async {
//                 FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }

// }








// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:twilio_programmable_video_example/debug.dart';
// import 'package:twilio_programmable_video_example/room/selection_page.dart';
// import 'package:twilio_programmable_video_example/shared/services/backend_service.dart';

// void main() {
//   Debug.enabled = true;
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations(<DeviceOrientation>[
//     DeviceOrientation.landscapeRight,
//     DeviceOrientation.landscapeLeft,
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//   runApp(TwilioProgrammableVideoExample());
// }

// class TwilioProgrammableVideoExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: Firebase.initializeApp(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return Provider<BackendService>(
//             create: (_) => FirebaseFunctionsService.instance,
//             child: MaterialApp(
//               title: 'Twilio Programmable Video',
//               theme: ThemeData(
//                 primarySwatch: Colors.blue,
//                 appBarTheme: AppBarTheme(
//                   color: Colors.blue,
//                   titleTextStyle: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               home: SelectionPage(),
//             ),
//           );
//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }






/* import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

const appId = "58b5bbec2af548c8b31d184e09fc6a73";
const token =
    "007eJxTYAhcrbDbes2e2PPtKXUVZrHTFoefNLfraGbQOjrVqsX94R4FBlOLJNOkpNRko8Q0UxOLZIskY8MUQwuTVAPLtGSzRHPjA11TkhsCGRk2B+1nZGSAQBBfkCEts6i4JDkjMS8vNacktbjEiIEBABdwJTA=";
String channelId = ""; //"firstchanneltest2";
const channelName = "firstchanneltest2";

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = await RtcEngine.create(appId);
    await _engine.enableVideo();
    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print("local user $uid joined");
          setState(() {
            channelId = channel;
            _localUserJoined = true;
          });
        },
        userJoined: (int uid, int elapsed) {
          print("remote user $uid joined");
          setState(() {
            _remoteUid = uid;
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("remote user $uid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
      ),
    );

    await _engine.joinChannel(token, channelName, null, 0);
  }

  // Create UI with local view and remote view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agora Video Call'),
      ),
      body: Stack(
        children: [
          Center(
            child: _remoteVideo(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 100,
              height: 150,
              child: Center(
                child: _localUserJoined
                    ? RtcLocalView.SurfaceView()
                    : CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Display remote user's video
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return RtcRemoteView.SurfaceView(channelId: channelId, uid: _remoteUid!);
      // RtcRemoteView.SurfaceView(uid: _remoteUid!);
    } else {
      return Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }
} */




/* import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:twilio_programmable_video_example/debug.dart';
import 'package:twilio_programmable_video_example/room/selection_page.dart';
import 'package:twilio_programmable_video_example/shared/services/backend_service.dart';

void main() {
  Debug.enabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(TwilioProgrammableVideoExample());
}

class TwilioProgrammableVideoExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Provider<BackendService>(
            create: (_) => FirebaseFunctionsService.instance,
            child: MaterialApp(
              title: 'Twilio Programmable Video',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                appBarTheme: AppBarTheme(
                  color: Colors.blue,
                  titleTextStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              home: SelectionPage(),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
} */
