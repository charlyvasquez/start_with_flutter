import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostView {
  String image;
  String child;

  PostView(this.image, this.child);
}

class Pagina20 extends StatelessWidget {
  // const Pagina20({Key? key}) : super(key: key);

  final List<PostView> _posts = [
    PostView(
        "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/Activa%20Online.png?alt=media&token=02d1702b-265d-4a1a-8324-f2a235861b30",
        "Post 1"),
    PostView(
        "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/106.7%20Oye%20FM.png?alt=media&token=38e10efa-efdc-4ded-ae17-09bfeca982f6",
        "Post 2"),
    PostView(
        "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/93.5%20Oye%20FM.png?alt=media&token=70cc913c-f6ba-4226-8802-1b033d234b35",
        "Post 3"),
    PostView(
        "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/95.1%20Oye%20FM.png?alt=media&token=5c5f0d40-a75d-4a33-a881-c88d39a33375",
        "Post 4"),
    PostView(
        "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/AGN%20107.5%20FM.png?alt=media&token=609bcaec-db68-4e0b-8d5a-7c947f1a4991",
        "Post 5"),
    PostView(
        "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/Accion%20104.5%20FM.png?alt=media&token=d7e8ee42-79de-4cdc-9af9-c84a51153e98",
        "Post 6"),
    PostView(
        "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/Adulto%20Joven%2088.1%20FM.png?alt=media&token=73e53ce2-a778-43fa-878a-3141a890f780",
        "Post 7"),
    PostView(
        "https://firebasestorage.googleapis.com/v0/b/images-emisoras-radio.appspot.com/o/Advanta%2098.7%20FM.png?alt=media&token=4a302389-4f98-489b-a026-44665e5fc18a",
        "Post 8"),
    PostView("https://webdeimagenes.com/wp-content/uploads/2018/02/14-5.jpg",
        "Post 9")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Personalizado"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: _posts.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MyViewSquarePage20Horizontal(
                      image: _posts[index].image, child: _posts[index].child);
                }),
          ),
          Expanded(
            flex: 5,
            child: ListView.builder(
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  return MyViewSquarePage20Vertical(
                      image: _posts[index].image, child: _posts[index].child);
                }),
          ),
        ],
      ),
    );
  }
}

class MyViewSquarePage20Horizontal extends StatelessWidget {
  // const name({Key? key}) : super(key: key);
  final String image;
  final String child;

  MyViewSquarePage20Horizontal(
      {Key? key, required this.image, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      padding: EdgeInsets.only(/* top: 50.0, */ left: 10.0, right: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            /* margin:
                EdgeInsets.only(top: 50.0 /* , left: 10.0, right: 10.0 */), */
            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(
                // "https://webdeimagenes.com/wp-content/uploads/2018/02/14-5.jpg"),
                image), fit: BoxFit.fill) /* color: Colors.green */),
            height: 50.0,
            width: 50.0,
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                child,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}

class MyViewSquarePage20Vertical extends StatelessWidget {
  // const name({Key? key}) : super(key: key);
  final String image;
  final String child;

  MyViewSquarePage20Vertical(
      {Key? key, required this.image, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(
              // "https://webdeimagenes.com/wp-content/uploads/2018/02/14-5.jpg"),
              image), fit: BoxFit.fill) /* color: Colors.green */),
          height: 150.0,
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              child,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}

class Pagina21 extends StatelessWidget {
  // const Pagina21({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GridView Página 21")),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                color: index == 0
                    ? Colors.blue
                    : index % 2 == 1
                        ? Colors.red
                        : Colors.deepPurple,
                child: Center(
                  child: Text(
                    index == 0
                        ? "Posición 0"
                        : index % 2 == 1
                            ? "Impar"
                            : "Par",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Pagina22 extends StatelessWidget {
  // const Pagina22({Key? key}) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.deepPurple,
            leading: Icon(Icons.android),
            title: Text("SliverAppBar"),
            expandedHeight: 200,
            pinned: true, // No me oculta completo el appBar
            floating: true, //Al hacer scroll down aparece de una vez
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
              color: Colors.red,
            )),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 450.0,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 350.0,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 250.0,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Pagina23 extends StatelessWidget {
  // const Pagina23({Key? key}) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab Bar"),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                    color: Colors.red,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.red,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.person,
                    color: Colors.red,
                  ),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(child: Center(child: Text("Primero"))),
                  Container(child: Center(child: Text("Segundo"))),
                  Container(child: Center(child: Text("Tercero"))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Pagina24 extends StatefulWidget {
  @override
  State<Pagina24> createState() => _Pagina24State();
}

class _Pagina24State extends State<Pagina24> {
  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("Titulo"),
            content: Text("Content, more info"),
            actions: [
              MaterialButton(
                onPressed: () {},
                child: Text("Aceptar"),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              )
            ],
          );
        });
  }

  final _textStyle = const TextStyle(
      fontSize: 20.0,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      color: Colors.red);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Height: " + MediaQuery.of(context).size.height.toString(),
                style: _textStyle),
            Text("Width: " + MediaQuery.of(context).size.width.toString()),
            Text("Aspect Ratio: " +
                MediaQuery.of(context).size.aspectRatio.toStringAsFixed(3)),
            Text("Orientation: " +
                MediaQuery.of(context).orientation.toString()),
            MaterialButton(
              color: Colors.amber,
              onPressed: _showDialog,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "SHOW DIALOG",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Pagina25 extends StatelessWidget {
  // const Pagina25({Key? key}) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                text: TextSpan(style: TextStyle(fontSize: 20.0), children: [
                  TextSpan(
                      text: "Charly Vásquez",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red)),
                  TextSpan(
                      text:
                          " Pensamiento del Día: Si hoy pudiera depertar y decir Basta con la Guerra, y la Guerra se acabara, muchos harían y dirían lo mismo, pero no tenemos la potestad de ello, solo lo dejamos en manos de Dios",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey))
                ])),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              height: 70.0,
              color: Colors.red,
              child: RichText(
                  // textAlign: TextAlign.center,
                  text: const TextSpan(children: [
                TextSpan(
                    text: "yo ",
                    style: TextStyle(color: Colors.white, fontSize: 8)),
                TextSpan(
                    text: "Creo ",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                TextSpan(
                    text: "en ",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                TextSpan(
                    text: "DIOS",
                    style: TextStyle(color: Colors.white, fontSize: 20))
              ])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                text:
                    const TextSpan(style: TextStyle(fontSize: 20.0), children: [
                  TextSpan(
                      text: "Charly Vásquez",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red)),
                  TextSpan(
                      text:
                          " Pensamiento del Día: Si hoy pudiera depertar y decir Basta con la Guerra, y la Guerra se acabara, muchos harían y dirían lo mismo, pero no tenemos la potestad de ello, solo lo dejamos en manos de Dios",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey))
                ])),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                textAlign: TextAlign.center,

                // overflow: TextOverflow.ellipsis,
                // maxLines: 3,
                text:
                    TextSpan(/* style: TextStyle(fontSize: 20.0), */ children: [
                  TextSpan(
                      text:
                          "Nuestro asesor de servicio se comunicara contigo para confirmar la cita a traves del",
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red)),
                  WidgetSpan(
                      child: Icon(
                    Icons.phone,
                    size: 18,
                  )),
                  TextSpan(
                      text: "+584148563323",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey))
                ])),
          ),
        ],
      ),
    );
  }
}

class Pagina26 extends StatefulWidget {
  // Pagina26({Key? key}) : super(key: key);

  @override
  State<Pagina26> createState() => _Pagina26State();
}

class _Pagina26State extends State<Pagina26> {
  int timeLeft = 5;
  int timeLeftCursor = 900000;
  var value = 70;
  bool enabledCount = false;

  void _startCountDown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        _startCountDownCursor();
        setState(() {});
        enabledCount = true;
        timeLeft--;
      } else {
        setState(() {
          enabledCount = false;
        });
        timer.cancel();
      }
    });
  }

  void _startCountDownCursor() {
    Timer.periodic(Duration(milliseconds: 500), (timer2) {
      if (timeLeftCursor > 0 && enabledCount == true) {
        setState(() {});
        timeLeftCursor--;
        // value = value;
      } else {
        timer2.cancel();
      }
    });
  }

  void _resetTimer() {
    setState(() {});
    timeLeft = 20;
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer Página 26"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$value",
                  //timeLeft == 0 ? "DONE" : timeLeft.toString(),
                  style: TextStyle(color: Colors.red, fontSize: 50.0),
                ),
                Container(
                  child: Text(
                    "'",
                    //timeLeft == 0 ? "DONE" : timeLeft.toString(),
                    style: TextStyle(
                        color: timeLeftCursor % 2 == 1
                            ? Colors.red
                            : Colors.transparent,
                        fontSize: 50.0),
                  ),
                ),
              ],
            ),
            Text(
              timeLeft == 0 ? "DONE" : timeLeft.toString(),
              style: TextStyle(color: Colors.red, fontSize: 50.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: _resetTimer,
                  color: Colors.deepPurple,
                  child: Text(
                    "RESET",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  onPressed: _startCountDown,
                  color: Colors.deepPurple,
                  child: Text(
                    "START",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Pagina27 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 100.0),
            // alignment: Alignment.topCenter,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: 20.0,
                  width: 20.0,
                  color: Colors.red,
                ),
                Container(
                  height: 15.0,
                  width: 15.0,
                  color: Colors.blue,
                ),
                Container(
                  height: 10.0,
                  width: 10.0,
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 30.0,
                width: 30.0,
                color: Colors.purple,
              ),
              Container(
                height: 20.0,
                width: 20.0,
                color: Colors.blue,
              ),
              Container(
                height: 10.0,
                width: 10.0,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 100.0),
            // alignment: Alignment.topCenter,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: 20.0,
                  width: 20.0,
                  color: Colors.red,
                ),
                Container(
                  height: 15.0,
                  width: 15.0,
                  color: Colors.blue,
                ),
                Container(
                  height: 10.0,
                  width: 10.0,
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Container(
                height: 150.0,
                width: 150.0,
                color: Colors.red,
              ),
              Container(
                height: 100.0,
                width: 100.0,
                color: Colors.white,
              ),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Container(
                height: 150.0,
                width: 150.0,
                color: Colors.red,
              ),
              Container(
                height: 100.0,
                width: 100.0,
                color: Colors.white,
              ),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          child: Stack(
            // alignment: AlignmentDirectional.bottomEnd,
            children: [
              Container(
                height: 150.0,
                width: 150.0,
                color: Colors.red,
              ),
              Container(
                height: 100.0,
                width: 100.0,
                color: Colors.white,
              ),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
                height: 150.0,
                width: 150.0,
                color: Colors.red,
              ),
              Container(
                height: 100.0,
                width: 100.0,
                color: Colors.white,
              ),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 300.0),
          alignment: Alignment.centerLeft,
          child: Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              Container(
                height: 150.0,
                width: 150.0,
                color: Colors.red,
              ),
              Container(
                height: 150.0,
                width: 100.0,
                color: Colors.white,
              ),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              Container(
                height: 150.0,
                width: 150.0,
                color: Colors.red,
              ),
              Container(
                height: 150.0,
                width: 100.0,
                color: Colors.white,
              ),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 300.0),
          alignment: Alignment.centerLeft,
          child: Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              Container(
                height: 150.0,
                width: 150.0,
                color: Colors.red,
              ),
              Container(
                height: 150.0,
                width: 100.0,
                color: Colors.white,
              ),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 300.0),
          alignment: Alignment.centerRight,
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Container(
                height: 150.0,
                width: 150.0,
                color: Colors.red,
              ),
              Container(
                height: 150.0,
                width: 100.0,
                color: Colors.white,
              ),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Container(
                height: 150.0,
                width: 150.0,
                color: Colors.red,
              ),
              Container(
                height: 150.0,
                width: 100.0,
                color: Colors.white,
              ),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 300.0),
          alignment: Alignment.centerRight,
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Container(
                height: 150.0,
                width: 150.0,
                color: Colors.red,
              ),
              Container(
                height: 150.0,
                width: 100.0,
                color: Colors.white,
              ),
              Container(
                height: 50.0,
                width: 50.0,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

class Pagina28 extends StatefulWidget {
  // Pagina28({Key? key}) : super(key: key);

  @override
  State<Pagina28> createState() => _Pagina28State();
}

class _Pagina28State extends State<Pagina28> {
  final _textController = TextEditingController();
  String usserPost = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Input Página 28"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: Container(child: Center(child: Text(usserPost)))),
            TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: "PlaceHolder",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _textController.clear();
                      },
                      icon: Icon(Icons.clear)),
                )),
            MaterialButton(
              onPressed: () {
                _textController.text.isEmpty
                    ? null
                    : setState(() {
                        usserPost = _textController.text;
                      });
                // _textController.clear();
              },
              color: _textController.text.isEmpty
                  ? Colors.grey
                  : Colors.blueAccent,
              child: Text("Comentar", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}

class Pagina29 extends StatefulWidget {
  @override
  State<Pagina29> createState() => _Pagina29State();
}

class _Pagina29State extends State<Pagina29>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool videoPlaying = false;

  void _iconTapped() {
    if (!videoPlaying) {
      _animationController.forward();
      // videoPlaying = !videoPlaying;
    } else {
      _animationController.reverse();
      // videoPlaying = !videoPlaying;
    }
    videoPlaying = !videoPlaying;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Icons Animated Página29"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _iconTapped,
          child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: _animationController,
              size: 150.0),
        ),
      ),
    );
  }
}
