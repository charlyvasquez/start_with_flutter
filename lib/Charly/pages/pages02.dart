import 'package:flutter/material.dart';
import 'package:start_with_flutter_again/Charly/pages/pages10.dart';
import 'package:start_with_flutter_again/Charly/pages/widget_card.dart';

class Pagina05 extends StatefulWidget {
  const Pagina05({Key? key}) : super(key: key);

  @override
  _Pagina05State createState() => _Pagina05State();
}

class _Pagina05State extends State<Pagina05> {
  bool _subscritoNew = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página 05"),
      ),
      body: Container(
          color: Colors.brown,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              volver(context),
              /*ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                      onPrimary: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10)),
                  onPressed: () {
                    _mostrarSubscribirseNew(context);
                    //Navigator.pop(context);
                  },
                  child:
                      Text(_subscritoNew ? "Darse de Baja" : "Subscribirse")),*/
              subscribirseWidgetNew(context),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Estado de Subscripción:",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    _subscritoNew ? "Subscrito" : "No Subscrito",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              )
            ],
          ))),
    );
  }

  Widget subscribirseWidgetNew(context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.yellow,
            onPrimary: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
        onPressed: () {
          _mostrarSubscribirseNew(context);
          //Navigator.pop(context);
        },
        child: Text(_subscritoNew ? "Darse de Baja" : "Subscribirse"));
  }

  void _mostrarSubscribirseNew(context) {
    showDialog(
        //barrierColor: const Color(0xFFCABBBB),
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
                backgroundColor:
                    _subscritoNew ? const Color(0xFFC52201) : Colors.green,
                titleTextStyle: const TextStyle(color: Color(0xFFFFFFFF)),
                contentTextStyle: const TextStyle(color: Color(0xFFFFFFFF)),
                title: Text(
                  _subscritoNew ? "Darse de Baja" : "Subscribirse",
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  _subscritoNew
                      ? "Desea darse de Baja?"
                      : "Desea Subscribirse?",
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancelar",
                            style: TextStyle(
                                color: Colors.white,
                                backgroundColor: Colors.black),
                          )),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              _subscritoNew = !_subscritoNew;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Aceptar",
                            style: TextStyle(
                                color: Colors.white,
                                backgroundColor: Colors.black),
                          ))
                    ],
                  ),
                ]));
  }
}

/* class ShakeTransition extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;

  const ShakeTransition({
    Key? key,
    this.duration = const Duration(milliseconds: 900),
    this.offset = 140.0,
    required this.child,
    this.axis = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      child: child,
      duration: duration,
      curve: Curves.easeOutQuint,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: axis == Axis.horizontal
              ? Offset(value * offset, 0.0)
              : Offset(0.0, value * offset),
          child: child,
        );
      },
    );
  }
}
 */
class Pagina02 extends StatelessWidget {
  const Pagina02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página 02"),
      ),
      body: Container(
          color: Colors.brown,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CardWidgetCalendar(),
              volver(context),
              subscribirseWidget(context),
              const SizedBox(
                height: 15.0,
              ),
            ],
          ))),
    );
  }
}

Widget volver(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text("Regresar"));
}

Widget alertaWidget(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        _mostrarAlertaEmisora(context);
        //Navigator.pop(context);
      },
      child: const Text("Alerta"));
}

class Pagina01 extends StatefulWidget {
  const Pagina01({Key? key}) : super(key: key);

  @override
  _Pagina01State createState() => _Pagina01State();
}

class _Pagina01State extends State<Pagina01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página 01"),
      ),
      body: Container(
          color: Colors.black,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              volver(context),
              alertaWidget(context),
            ],
          ))),
    );
  }
}

void _mostrarAlertaEmisora(context) {
  showDialog(
      //barrierColor: const Color(0xFFCABBBB),
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
              backgroundColor: const Color(0xFFC52201),
              titleTextStyle: const TextStyle(color: Color(0xFFFFFFFF)),
              contentTextStyle: const TextStyle(color: Color(0xFFFFFFFF)),
              title: const Text(
                "Error",
                textAlign: TextAlign.center,
              ),
              content: const Text(
                "Disculpe, la emisora no está disponible en estos momentos",
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Center(
                      child: Text(
                        "Ok",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
              ]));
}

Widget subscribirseWidget(context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      onPressed: () {
        _mostrarSubscribirse(context);
        //Navigator.pop(context);
      },
      child: const Text("Subscribirse"));
}

void _mostrarSubscribirse(context) {
  showDialog(
      //barrierColor: const Color(0xFFCABBBB),
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
              backgroundColor: const Color(0xFFC52201),
              titleTextStyle: const TextStyle(color: Color(0xFFFFFFFF)),
              contentTextStyle: const TextStyle(color: Color(0xFFFFFFFF)),
              title: const Text(
                "Subscribirse",
                textAlign: TextAlign.center,
              ),
              content: const Text(
                "Desea Subscribirse?",
                textAlign: TextAlign.center,
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          color: Colors.black,
                          child: const Text(
                            "Cancelar",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          color: Colors.green,
                          child: const Text(
                            "Aceptar",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ))
                  ],
                ),
              ]));
}

class Pagina03 extends StatelessWidget {
  const Pagina03({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página 03"),
      ),
      body: cuerpo(),
    );
  }
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
            child: Opacity(
              opacity: 0.3,
              child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/Activa%20Online.png?alt=media&token=02d1702b-265d-4a1a-8324-f2a235861b30"),
            ),
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
          Opacity(
            opacity: 0.4,
            child: Container(
              color: Colors.green,
              width: 100.0,
              height: 100.0,
              child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/Advanta%2098.7%20FM.png?alt=media&token=4a302389-4f98-489b-a026-44665e5fc18a"),
            ),
          ),
        ],
      ),
      Column(
        children: const [
          Text(
            "Emisoras20",
            //style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Emisoras1",
            //style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(width: 10),
          Text(
            "Emisoras3",
            //style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(width: 10),
          Text(
            "Emisoras5",
            //style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10.0,
        runSpacing: 20.0,
        alignment: WrapAlignment.center,
        direction: Axis.horizontal,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Emisoras2",
            //style: TextStyle(fontSize: 16.0),
          ),
          //SizedBox(width: 10),
          Text(
            "Emisoras4",
            //style: TextStyle(fontSize: 16.0),
          ),
          //SizedBox(width: 10),
          Text(
            "Emisoras6",
            //style: TextStyle(fontSize: 16.0),
          ),
          //SizedBox(width: 10),
          Text(
            "Emisoras6",
            //style: TextStyle(fontSize: 16.0),
          ),
          //SizedBox(width: 10),
          Text(
            "Emisoras8",
            //style: TextStyle(fontSize: 16.0),
          ),
          //SizedBox(width: 10),
          Text(
            "Emisoras10",
            //style: TextStyle(fontSize: 16.0),
          ),
          Text(
            "Emisoras12",
            //style: TextStyle(fontSize: 16.0),
          ),
          Text(
            "Emisoras14",
            //style: TextStyle(fontSize: 16.0),
          ),
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
    ],
  );
}

class Pagina04 extends StatefulWidget {
  const Pagina04({Key? key}) : super(key: key);

  @override
  _Pagina04State createState() => _Pagina04State();
}

class _Pagina04State extends State<Pagina04> {
  final Empresa _facebook = Empresa("Facebook", "Mark Zuckerberg", 5000);
  final Empresa _google = Empresa("Google", "Charly Vasquez", 14403031);
  final Text _saludo = const Text(
    "Hello",
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    textScaleFactor: 2.0,
  );

  @override
  void initState() {
    super.initState();

    print(_facebook.propietario);
    print(_google);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página 04"),
      ),
      body: Container(
          color: Colors.red,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  _saludo,
                  volver(context),
                ],
              ),
            ],
          ))),
    );
  }
}

class Pagina06 extends StatelessWidget {
  Pagina06({Key? key}) : super(key: key);
  final controller = PageController(initialPage: 0);
  final pageView = PageView(
      controller: PageController(initialPage: 0),
      scrollDirection: Axis.vertical,
      children: [
        Pagina01(),
        Pagina02(),
        Pagina03(),
        Pagina04(),
        Pagina10(),
        Pagina11(),
        Pagina12(),
        Pagina13(),
        Pagina14(),
        Pagina15()
      ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: pageView);
  }
}

class Empresa {
  late String nombre;
  late String propietario;
  late int ingresoAnual;

  Empresa(this.nombre, propietary, int i) {
    propietario = propietary;
    ingresoAnual = i;
  }
}
