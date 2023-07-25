import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:start_with_flutter_again/Charly/models/Gif.dart';
import 'package:http/http.dart' as http;
import 'package:card_swiper/card_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// import 'package:start_with_flutter_again/pages/pages02.dart';
import 'package:start_with_flutter_again/Charly/pages/pages20.dart';
//import 'package:swipe_cards/swipe_cards.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';
//import 'dart:html';

void main() => runApp(const Pagina10());

class Pagina10 extends StatefulWidget {
  const Pagina10({Key? key}) : super(key: key);

  @override
  State<Pagina10> createState() => _Pagina10State();
}

class _Pagina10State extends State<Pagina10> {
  final List<Person> _personas = [
    Person("Charly", "Vasquez", "+584148563323"),
    Person("Cheryl", "Velasquez", "+584148568857"),
    Person("Roselyn", "Gonsalez", "+584148563325"),
    Person("Rosa", "Jimenez", "+584148707153"),
    Person("Luperio", "Freites", "+584149873186"),
    Person("Edwin", "González", "+584249286458"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 10'),
      ),
      body: ListView.builder(
        itemCount: _personas.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onLongPress: () {
              _borrarPersona(context, _personas[index]);
            },
            onTap: () {
              print(_personas[index].name);
            },
            title:
                Text(_personas[index].name + " " + _personas[index].lastname),
            subtitle: Text("Phone: " + _personas[index].phone),
            leading: CircleAvatar(
                child: Text(_personas[index].name.substring(0, 1))),
            trailing: const Icon(Icons.star_border),
            textColor: Colors.red,
            iconColor: Colors.green,
            selectedColor: Colors.red,
            selectedTileColor: Colors.yellow,
          );
        },
      ),
    );
  }

  _borrarPersona(context, Person persona) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
                title: const Text(
                  "Eliminar Contacto",
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  "¿Está seguro de querer eliminar a " +
                      persona.name +
                      " " +
                      persona.lastname +
                      "?",
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
                            color: Colors.green,
                            child: const Text(
                              "Cancelar",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              _personas.remove(persona);
                            });

                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 5.0),
                            color: Colors.red,
                            child: const Text(
                              "Borrar",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ))
                    ],
                  ),
                ]));
  }
}

//API Key NeiZdOFgkxkOlENLVXQEh34Qy0XHE3eO

//void main() => runApp(Pagina11());

class Pagina11 extends StatefulWidget {
  const Pagina11({Key? key}) : super(key: key);
  @override
  State<Pagina11> createState() => _Pagina11State();
}

class _Pagina11State extends State<Pagina11> {
  late Future<List<Gif>> _listadoGifs;

  Future<List<Gif>> _getGifs() async {
    final response = await http.get(Uri.parse(
        "https://api.giphy.com/v1/gifs/trending?api_key=NeiZdOFgkxkOlENLVXQEh34Qy0XHE3eO&limit=10&rating=g"));

    //List<Gif> gifs = [];
    List<Gif> gifs = [];

    if (response.statusCode == 200) {
      //print(response.body);
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      //print(jsonData);
      for (var item in jsonData["data"]) {
        gifs.add(Gif(item["title"], item["images"]["downsized"]["url"]));
      }
      return gifs;
    } else {
      throw Exception("Fallo la Conexión");
    }
  }

  @override
  void initState() {
    super.initState();
    _listadoGifs = _getGifs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: FutureBuilder(
        future: _listadoGifs, //_listGifs,
        //initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return GridView.count(
                crossAxisCount: 2,
                children: _listGifs(snapshot.data),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text("Error");
            }
            //const Center(child: Text("Data"));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  List<Widget> _listGifs(List<Gif> data) {
    List<Widget> gifs = [];

    for (var gif in data) {
      gifs.add(Card(
          child: Column(
        children: [
          Expanded(
            child: Image.network(
              gif.url,
              fit: BoxFit.fill,
            ),
          ),
        ],
      )));
      //print(gif.name);
    }
    return gifs;
  }
}

class Pagina12 extends StatefulWidget {
  const Pagina12({Key? key}) : super(key: key);

  @override
  State<Pagina12> createState() => _Pagina12State();
}

class _Pagina12State extends State<Pagina12> {
  int _pagActual = 0;
  List<Widget> _paginas = [HomePage(), UserPage(), HomePage(), UserPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.yellow,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            color: Colors.red,
            splashColor: Colors.black,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share),
              color: Colors.red,
              splashColor: Colors.black,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
              color: Colors.red,
              splashColor: Colors.red,
            ),
          ],
          centerTitle: true,
          title: Text(
            'AppBar BottomNavigationBar Pág 12',
            style: TextStyle(color: Colors.red, fontSize: 10.0),
          ),
        ),
        body: _paginas[_pagActual],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType
              .fixed, //Se coloca si BottomNavigationBarItem >3
          onTap: (index) {
            setState(() {
              _pagActual = index;
            });
          },
          currentIndex: _pagActual,
          //fixedColor: Colors.black,
          backgroundColor: Colors.yellow,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle_rounded),
                label: "User"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle_rounded),
                label: "User"),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "HOME",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "USER",
          style: TextStyle(color: Colors.green),
        ),
      ),
    );
  }
}

class Pagina13 extends StatefulWidget {
  const Pagina13({Key? key}) : super(key: key);

  @override
  State<Pagina13> createState() => _Pagina13State();
}

class _Pagina13State extends State<Pagina13> {
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.red;
  BorderRadius _borderRadius = BorderRadius.circular(10);

  void _cambiarParametros() {
    setState(() {
      final random = Random();
      _width = random.nextInt(350).toDouble();
      _height = random.nextInt(350).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(255).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Página 13',
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnimatedContainer Página 13'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.easeOutQuad,
                  width: _width,
                  height: _height,
                  decoration:
                      BoxDecoration(color: _color, borderRadius: _borderRadius),
                ),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.yellow,
                    onPrimary: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10)),
                onPressed: _cambiarParametros,
                child: const Text("Cambiar Tamaño")),
            Container(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}

class Pagina14 extends StatelessWidget {
  Pagina14({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Carrusel Swiper')),
        ),
        body: Column(
          children: [
            _swiper(),
            const SizedBox(
              height: 5.0,
            ),
            _swiper2(),
            const SizedBox(
              height: 5.0,
            ),
            _swiper3(),
          ],
        ),
      ),
    );
  }
}

List<String> _images = [
  "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/Activa%20Online.png?alt=media&token=02d1702b-265d-4a1a-8324-f2a235861b30",
  "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/106.7%20Oye%20FM.png?alt=media&token=38e10efa-efdc-4ded-ae17-09bfeca982f6",
  "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/93.5%20Oye%20FM.png?alt=media&token=70cc913c-f6ba-4226-8802-1b033d234b35",
  "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/95.1%20Oye%20FM.png?alt=media&token=5c5f0d40-a75d-4a33-a881-c88d39a33375",
  "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/Adulto%20Joven%2088.1%20FM.png?alt=media&token=73e53ce2-a778-43fa-878a-3141a890f780",
  "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/Activa%20Online.png?alt=media&token=02d1702b-265d-4a1a-8324-f2a235861b30",
  "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/106.7%20Oye%20FM.png?alt=media&token=38e10efa-efdc-4ded-ae17-09bfeca982f6",
  "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/93.5%20Oye%20FM.png?alt=media&token=70cc913c-f6ba-4226-8802-1b033d234b35",
  "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/95.1%20Oye%20FM.png?alt=media&token=5c5f0d40-a75d-4a33-a881-c88d39a33375",
  "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/Adulto%20Joven%2088.1%20FM.png?alt=media&token=73e53ce2-a778-43fa-878a-3141a890f780",
  "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/Activa%20Online.png?alt=media&token=02d1702b-265d-4a1a-8324-f2a235861b30",
];

Widget _swiper() {
  return Container(
    padding: EdgeInsets.only(top: 10.0),
    width: double.infinity,
    height: 150.0,
    child: Swiper(
      viewportFraction: 0.7,
      scale: 0.9,
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          _images[index],
          fit: BoxFit.fill,
        );
      },
      itemCount: _images.length,
      pagination: SwiperPagination(),
      control: SwiperControl(),
    ),
  );
}

Widget _swiper2() {
  return Container(
    width: double.infinity,
    height: 200.0,
    padding: EdgeInsets.only(top: 10.0),
    child: Swiper(
      viewportFraction: 0.7,
      scale: 0.9,
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          _images[index],
          fit: BoxFit.fill,
        );
      },
      itemHeight: 400.0,
      itemWidth: 300.0,
      layout: SwiperLayout.TINDER,
      itemCount: _images.length,
      pagination: SwiperPagination(),
      control: SwiperControl(),
    ),
  );
}

Widget _swiper3() {
  return Container(
    width: 250, //double.infinity,
    height: 150.0,
    child: Swiper(
      layout: SwiperLayout.CUSTOM,
      customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
          .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
        Offset(-100.0, -40),
        Offset(0.0, 0.0),
        Offset(100.0, -40)
      ]), //[Offset(-370.0, -40), Offset(0.0, 0.0), Offset(370.0, -40)]),
      itemWidth: 100.0,
      itemHeight: 200.0,
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          _images[index],
          fit: BoxFit.fill,
        );
      },
      itemCount: _images.length,
      pagination: SwiperPagination(),
      control: SwiperControl(),
    ),
  );
}

class Person {
  String name;
  String lastname;
  String phone;
  Person(this.name, this.lastname, this.phone);
}

class Post {
  String name;
  String job;
  Post(this.name, this.job);

  /* Post.fromJson(var value) {
    this.name = value['name'];
    this.job = value['job'];
  } */
}

class Pagina17 extends StatefulWidget {
  const Pagina17({Key? key}) : super(key: key);

  @override
  State<Pagina17> createState() => _Pagina17State();
}

class _Pagina17State extends State<Pagina17> {
  // ignore: deprecated_member_use
  List<Post> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Data"),
        ),
        body: Container(
            child: Center(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData)
                        return const CircularProgressIndicator();
                      return ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            var temp = snapshot.data?.docs[index].data();

                            print("chequear");
                            print(temp);

                            return Card(
                              child: Column(
                                children: const <Widget>[
                                  Text(
                                      "Nombre"), //(temp!["name"]), //(snapshot.data?.docs[index].data(String "name"),//.name),
                                  Text(
                                      "Job"), //(snapshot.data?.docs[index].job)
                                ],
                              ),
                            );
                          });
                    }))));
  }
}

class Pagina15 extends StatefulWidget {
  const Pagina15({Key? key}) : super(key: key);

  @override
  State<Pagina15> createState() => _Pagina15State();
}

class _Pagina15State extends State<Pagina15> {
  int _value = 0;
  _changeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _value++;
      prefs.setInt("value", _value);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cargarPreferences();
  }

  _cargarPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _value = prefs.getInt("value") ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  _value.toString(),
                  textScaleFactor: 3.0,
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.yellow[600],
                      onPrimary: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10)),
                  onPressed: _changeValue,
                  child: const Text("Incrementar Valor"))
            ],
          ),
        ),
      ),
    );
  }
}

class PageStateLes extends StatelessWidget {
  final String _texto;
  const PageStateLes(this._texto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page StateLes'),
      ),
      body: Center(
        child: Container(
          child: Text(_texto),
        ),
      ),
    );
  }
}

class PageStateFull extends StatefulWidget {
  final String _textoStateFull;
  const PageStateFull(this._textoStateFull, {Key? key}) : super(key: key);

  @override
  State<PageStateFull> createState() => _PageStateFullState();
}

class _PageStateFullState extends State<PageStateFull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page StateFull'),
      ),
      body: Center(
        child: Container(
          child: Text(widget._textoStateFull),
        ),
      ),
    );
  }
}

class Pagina16 extends StatefulWidget {
  final List _usuarios;

  const Pagina16(this._usuarios, {Key? key}) : super(key: key);

  @override
  State<Pagina16> createState() => _Pagina16State();
}

class _Pagina16State extends State<Pagina16> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text("name"),
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                child: Text("Holas"),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.yellow,
                    onPrimary: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10)),
                onPressed: () {
                  print(widget._usuarios);
                },
                child: const Text("Usuarios"))
          ],
        ),
      ),
    );
  }
}

class Pagina18 extends StatelessWidget {
  Pagina18({Key? key}) : super(key: key);
  var cardMask = MaskTextInputFormatter(
      mask: '#### #### #### ####', filter: {"#": RegExp(r'[0-9]')});
  var dateMask =
      MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});
  var codeMask =
      MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')});

  String nombre = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        drawer: Drawer(
          child: Container(
              color: Colors.grey[300],
              child: ListView(
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                    ),
                    child: Center(
                        child: Text(
                      "LOGO",
                      style: TextStyle(fontSize: 35.0),
                    )),
                  ),

                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text(
                      "Page 1",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Pagina20()));
                    },
                  ),
                  ListTile(
                    iconColor: Colors.red,
                    tileColor: Colors.blue,
                    // leading: Icon(Icons.home),
                    title: const Text(
                      "Page 2",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    subtitle: const Text("Prueba"),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Pagina21()));
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
                    width: 100.0,
                    height: 100.0,
                    child: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/Activa%20Online.png?alt=media&token=02d1702b-265d-4a1a-8324-f2a235861b30"),
                  ),
                  const Text(
                    "Charly Vásquez",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.5,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20.0, bottom: 0.0),
                      padding: EdgeInsets.all(20),
                      color: Colors.grey[350],
                      width: double.infinity,
                      child: Text("Home")),
                  Container(
                      margin: EdgeInsets.only(top: 2.0, bottom: 0.0),
                      padding: EdgeInsets.all(20),
                      color: Colors.grey[350],
                      width: double.infinity,
                      child: Text("Settings")),
                  //Expanded(child: Text("")),
                  Container(
                      margin: EdgeInsets.only(top: 2.0, bottom: 20.0),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20),
                      color: Colors.grey[400],
                      width: double.infinity,
                      child: const Text(
                        "Sign Out",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              )
              /* Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 100.0, bottom: 20.0),
                  width: 100.0,
                  height: 100.0,
                  child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/Activa%20Online.png?alt=media&token=02d1702b-265d-4a1a-8324-f2a235861b30"),
                ),
                const Text(
                  "Charly Vásquez",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textScaleFactor: 1.5,
                ),
                Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 0.0),
                    padding: EdgeInsets.all(20),
                    color: Colors.grey[350],
                    width: double.infinity,
                    child: Text("Home")),
                Container(
                    margin: EdgeInsets.only(top: 2.0, bottom: 0.0),
                    padding: EdgeInsets.all(20),
                    color: Colors.grey[350],
                    width: double.infinity,
                    child: Text("Settings")),
                //Expanded(child: Text("")),
                Container(
                    margin: EdgeInsets.only(top: 2.0, bottom: 20.0),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20),
                    color: Colors.grey[400],
                    width: double.infinity,
                    child: const Text(
                      "Sign Out",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            ),
           */
              ),
        ),
        appBar: AppBar(
          title: const Text('Drawer'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 150.0,
              ),
              Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/Activa%20Online.png?alt=media&token=02d1702b-265d-4a1a-8324-f2a235861b30"),
              //Expanded(child: Text("")),
              const SizedBox(
                height: 10.0,
              ),
              _inputName(nombre = "Name"),
              const SizedBox(
                height: 10.0,
              ),
              _inputName(nombre = "Last Name"),
              SizedBox(
                height: 10.0,
              ),
              _inputName(nombre = "Address"),
              SizedBox(
                height: 10.0,
              ),
              _inputCard(nombre = "0000 0000 0000 0000"),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: _inputDate(nombre = "01/24")),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: _inputCode(nombre = "000"))
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                width: MediaQuery.of(context).size.width - 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow[800],
                      onPrimary: Colors.black,
                      //padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10)
                    ),
                    onPressed: () {
                      print("Pagar con TC");
                    },
                    child: const Text("Pagar")),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _inputName(nombre) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.green)),
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(hintText: nombre, border: InputBorder.none),
      ),
    );
  }

  Container _inputCard(nombre) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.green)),
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        inputFormatters: [cardMask],
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(hintText: nombre, border: InputBorder.none),
      ),
    );
  }

  Container _inputDate(nombre) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.green)),
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        inputFormatters: [dateMask],
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(hintText: nombre, border: InputBorder.none),
      ),
    );
  }

  Container _inputCode(nombre) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.green)),
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        inputFormatters: [codeMask],
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(hintText: nombre, border: InputBorder.none),
      ),
    );
  }
}

class Pagina19 extends StatefulWidget {
  Pagina19({Key? key}) : super(key: key);

  @override
  State<Pagina19> createState() => _Pagina19State();
}

class _Pagina19State extends State<Pagina19>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();

    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.yellow,
          child: Container(
            height: 60.0,
          ),
        ),
        /* floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.red,
          backgroundColor: Colors.green,
          splashColor: Colors.black,
          onPressed: () {
            print("FadeTransition");
          },
          child: Icon(Icons.home),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, */
        body: Column(
          children: [
            Container(
              color: Colors.black,
              height: 150.0,
              width: 150.0,
            ),
            FadeTransition(
              opacity: _animation,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/Activa%20Online.png?alt=media&token=02d1702b-265d-4a1a-8324-f2a235861b30"),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    //Expanded(flex: 1, child: Text("")),
                    FloatingActionButton(
                      foregroundColor: Colors.red,
                      backgroundColor: Colors.green,
                      splashColor: Colors.black,
                      onPressed: () {
                        print("FadeTransition");
                      },
                      child: Icon(Icons.add),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
