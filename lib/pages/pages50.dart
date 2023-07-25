import 'dart:async';
import 'dart:convert';
// import 'dart:ffi';
import 'dart:math' as math;
// import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:http/http.dart';
import 'package:http/http.dart' as http;
// import 'package:auto_size_text/auto_size_text.dart';

class Pagina50 extends StatefulWidget {
  Pagina50({Key? key}) : super(key: key);

  @override
  State<Pagina50> createState() => _Pagina50State();
}

class _Pagina50State extends State<Pagina50> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("3D Ball Page 50"),
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SphereBall(),
          ],
        ),
      ),
    );
  }
}

class SphereBall extends StatefulWidget {
  SphereBall({Key? key}) : super(key: key);

  @override
  State<SphereBall> createState() => _SphereBallState();
}

class _SphereBallState extends State<SphereBall> {
  static const lightSource = Offset(0, -0.75);

  @override
  Widget build(BuildContext context) {
    final size = Size.square(MediaQuery.of(context).size.shortestSide);
    return Stack(
      children: [
        Container(),
        ShadowSphere(diameter: size.shortestSide),
        SphereDensity(
          lightSource: lightSource,
          diameter: size.shortestSide,
          child: Transform(
            origin: size.center(Offset.zero),
            transform: Matrix4.identity()..scale(0.5),
            child: DCurved(
                lightSource: lightSource,
                child: Triangle(text: "The Triangle")),
          ),
        ),
      ],
    );
  }
}

class SphereDensity extends StatelessWidget {
  final Offset lightSource;
  final double diameter;
  final Widget child;
  const SphereDensity(
      {Key? key,
      required this.lightSource,
      required this.diameter,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
          // color: Colors.black,
          shape: BoxShape.circle,
          gradient: RadialGradient(
              center: Alignment(lightSource.dx, lightSource.dy),
              colors: [Colors.grey, Colors.black])),
      child: child,
    );
  }
}

class ShadowSphere extends StatelessWidget {
  final double diameter;
  const ShadowSphere({Key? key, required this.diameter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..rotateX(/* math. */ math.pi / 2.1),
      origin: Offset(0, diameter),
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
            // color: Colors.black,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.6), blurRadius: 25.0)
            ]),
      ),
    );
  }
}

class DCurved extends StatelessWidget {
  final Offset lightSource;
  final Widget child;
  const DCurved({Key? key, required this.lightSource, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final innerShadowWidth = lightSource.distance * 0.1;
    return Container(
      // width: diameter,
      // height: diameter,
      decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          gradient: RadialGradient(stops: [1 - innerShadowWidth, 1],
              // center: Alignment(lightSource.dx, lightSource.dy),
              colors: [Color(0x661F1F1F), Colors.black])),
      child: child,
    );
  }
}

class Triangle extends StatelessWidget {
  final String text;
  const Triangle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TrianglePainter(),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final _gradient =
      LinearGradient(colors: [Colors.blue.shade400, Colors.blue.shade900]);
  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint()
      ..shader = _gradient.createShader(Offset.zero & size)
      ..style = PaintingStyle.fill;
    final w = size.width;
    final h = size.height;
    final path = Path()
      ..moveTo(w * 0.2, h * 0.3)
      ..quadraticBezierTo(w * 0.5, h * 0.1, w * 0.8, h * 0.3)
      ..quadraticBezierTo(w * 0.85, h * 0.6, w * 0.5, h * 0.85)
      ..quadraticBezierTo(w * 0.15, h * 0.6, w * 0.2, h * 0.3)
      ..close();
    canvas.drawPath(path, painter);
  }

  @override
  shouldRepaint(_TrianglePainter oldDelegate) => false;

  @override
  shouldRebuildSemantics(_TrianglePainter oldDelegate) => false;
}

class Pagina51 extends StatefulWidget {
  const Pagina51({Key? key}) : super(key: key);

  @override
  State<Pagina51> createState() => _Pagina51State();
}

class _Pagina51State extends State<Pagina51> {
  double _position = 0.0;
  bool _isFlipped = false;
  bool _isStart = false;
  Timer? miTimer;
  @override
  void initState() {
    miTimer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        if (_isStart) {
          !_isFlipped ? _position -= 40 : _position += 40;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    miTimer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
              height: 800,
              top: -100,
              left: _position,
              duration: Duration(microseconds: 400),
              child: Image(
                  fit: BoxFit.contain,
                  image: NetworkImage(
                      "https://www.cocinacaserayfacil.net/wp-content/uploads/2020/04/Recetas-de-comidas-para-ni%C3%B1os.jpg"))),
          Positioned(
              top: 500,
              left: 180,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi * (_isFlipped ? 1 : 0)),
                /* _isFlipped ? math.pi : math.pi * 0), */
                child: Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/icon/redCar.png"),
                    /* /* NetworkImage(
                                "https://w7.pngwing.com/pngs/263/779/png-transparent-red-car-red-red-car-car.png"), /* fit: BoxFit.fill */ */ */
                  )),
                ),
              )),
          Positioned(
              top: 750.0,
              left: MediaQuery.of(context).size.width / 2 - 85,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _isFlipped = false;
                      // _position -= 40;
                    });
                  },
                  icon: Icon(Icons.arrow_back_ios))),
          Positioned(
              top: 750.0,
              left: MediaQuery.of(context).size.width / 2 + 50,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _isFlipped = true;
                      // _position += 40;
                    });
                  },
                  icon: Icon(Icons.arrow_forward_ios))),
          Positioned(
              top: 750.0,
              left: MediaQuery.of(context).size.width / 2,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _isStart = !_isStart;
                      // _position += 40;
                    });
                  },
                  icon: Icon(_isStart ? Icons.pause : Icons.play_arrow)))
        ],
      ),
    );
  }
}

class Pagina52 extends StatelessWidget {
  const Pagina52({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.yellow,
            height: 250.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.all(15.0),
                  color: Colors.red,
                  elevation: 50.0,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding:
                              // EdgeInsets.only(/* top: 150.0, */ left: 20.0),
                              EdgeInsets.all(20.0),
                          height: 80.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 7.0,
                                spreadRadius: 8.0,
                                color: Colors.grey,
                                offset: Offset(0, 3),
                              )
                            ],
                            border:
                                Border.all(width: 5.0, color: Colors.orange),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Pagina53 extends StatelessWidget {
  const Pagina53({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GamePage();
  }
}

class GamePage extends StatefulWidget {
  GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int upperBoundX = 0, upperBoundY = 0, lowerBoundX = 0, lowerBoundY = 0;
  double screenWidth = 0, screenHeight = 0;
  int step = 30;
  int length = 5;
  int score = 0;
  double speed = 1.0;
  Direction direction = Direction.right;
  List<Offset> positions = [];
  Timer? timer;
  Offset? foodPosition; // = Offset(0, 0);
  Piece? food;

  void changeSpeed() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
    }
    timer = Timer.periodic(Duration(milliseconds: 500 ~/ speed), (timer) {
      setState(() {});
    });
  }

  Widget getControls() {
    return ControlPanel(onTapped: (Direction newDirection) {
      direction = newDirection;
    });
  }

  Direction getRandomDirection() {
    int val = math.Random().nextInt(4);
    direction = Direction.values[val];
    return direction;
  }

  void restart() {
    length = 5;
    speed = 1.0;
    score = 0;
    positions = [];
    direction = getRandomDirection();
    changeSpeed();
  }

  @override
  void initState() {
    super.initState();
    restart();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  int getNearestTens(int num) {
    int output;
    output = (num ~/ step) * step;
    if (output == 0) {
      output += step;
    }
    return output;
  }

  Offset getRandomPosition() {
    Offset position;
    int posX = math.Random().nextInt(upperBoundX) + lowerBoundX;
    int posY = math.Random().nextInt(upperBoundY) + lowerBoundY;

    position = Offset(
        getNearestTens(posX).toDouble(), getNearestTens(posY).toDouble());

    return position;
  }

  void draw() async {
    if (positions.length == 0) {
      positions.add(getRandomPosition());
    }
    while (length > positions.length) {
      positions.add(positions[positions.length - 1]);
    }
    for (var i = positions.length - 1; i > 0; i--) {
      positions[i] = positions[i - 1];
    }
    positions[0] = await getNextPosition(positions[0]);
  }

  bool detectCollision(Offset position) {
    if (position.dx >= upperBoundX && direction == Direction.right) {
      return true;
    } else if (position.dx <= lowerBoundX && direction == Direction.left) {
      return true;
    } else if (position.dy >= upperBoundY && direction == Direction.down) {
      return true;
    } else if (position.dy <= lowerBoundY && direction == Direction.up) {
      return true;
    }
    return false;
  }

  void showGameOverDialog(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue, width: 3.0),
                  borderRadius: BorderRadius.circular(10.0)),
              title: Text("Game Over"),
              content: Text("Your game is over but you played well"),
              actions: [
                TextButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                      restart();
                    },
                    child: Text("Restart"))
              ]);
        });
  }

  Future<Offset> getNextPosition(Offset position) async {
    Offset nextPosition;
    if (detectCollision(position) == true) {
      if (timer != null && timer!.isActive) {
        timer!.cancel();
      }
      await Future.delayed(
          Duration(milliseconds: 200), () => showGameOverDialog(context));
      return position;
    }
    if (direction == Direction.right) {
      nextPosition = Offset(position.dx + step, position.dy);
      return nextPosition;
    } else if (direction == Direction.left) {
      nextPosition = Offset(position.dx - step, position.dy);
      return nextPosition;
    } else if (direction == Direction.up) {
      nextPosition = Offset(position.dx, position.dy - step);
      return nextPosition;
    } else /* if (direction == Direction.down) */ {
      nextPosition = Offset(position.dx, position.dy + step);
      return nextPosition;
    }
    // return Offset(0, 0);
  }

  void drawFood() {
    if (foodPosition == null) {
      foodPosition = getRandomPosition();
    }
    if (foodPosition == positions[0]) {
      length++;
      score += 5;
      speed += 0.25;
      foodPosition = getRandomPosition();
    }
    food = Piece(
      posX: foodPosition!.dx.toInt(),
      posY: foodPosition!.dy.toInt(),
      size: step,
      color: Colors.red,
      isAnimated: true,
    );
  }

  List<Piece> getPieces() {
    final pieces = <Piece>[];
    draw();
    drawFood();
    for (var i = 0; i < length; ++i) {
      if (i >= positions.length) {
        continue;
      }
      pieces.add(Piece(
          posX: positions[i].dx.toInt(),
          posY: positions[i].dy.toInt(),
          size: step,
          color: i.isEven ? Colors.red : Colors.green));
    }
    return pieces;
  }

  Widget getScore() {
    return Positioned(
        top: 80, right: 50, child: Text("Score: " + score.toString()));
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    screenHeight = _size.height;
    screenWidth = _size.width;
    lowerBoundX = step;
    lowerBoundY = step;
    upperBoundX = getNearestTens(screenWidth.toInt() - step);
    upperBoundY = getNearestTens(screenHeight.toInt() - step);

    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Stack(
          children: [
            Stack(
              children: getPieces(),
            ),
            getControls(),
            food!,
            getScore()
          ],
        ),
      ),
    );
  }
}

class ControlPanel extends StatelessWidget {
  final void Function(Direction direction) onTapped;
  const ControlPanel({Key? key, required this.onTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 50,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: Container()),
                ControlButton(
                    onPressed: () {
                      onTapped(Direction.left);
                    },
                    icon: Icon(Icons.arrow_left)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ControlButton(
                    onPressed: () {
                      onTapped(Direction.up);
                    },
                    icon: Icon(Icons.arrow_drop_up)),
                SizedBox(
                  height: 10.0,
                ),
                ControlButton(
                    onPressed: () {
                      onTapped(Direction.down);
                    },
                    icon: Icon(Icons.arrow_drop_down)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ControlButton(
                    onPressed: () {
                      onTapped(Direction.right);
                    },
                    icon: Icon(Icons.arrow_right)),
                Expanded(child: Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ControlButton extends StatelessWidget {
  final void Function() onPressed;
  final Icon icon;

  const ControlButton({Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: 0.5,
        child: Container(
          width: 80.0,
          height: 80.0,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              elevation: 0,
              onPressed: onPressed,
              child: icon,
            ),
          ),
        ));
  }
}

class Piece extends StatefulWidget {
  final int posX, posY, size;
  final Color color;
  final bool? isAnimated;

  Piece(
      {Key? key,
      required this.posX,
      required this.posY,
      required this.size,
      required this.color,
      this.isAnimated = false})
      : super(key: key);

  @override
  State<Piece> createState() => _PieceState();
}

class _PieceState extends State<Piece> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      lowerBound: 0.25,
      upperBound: 1.0,
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.posY.toDouble(),
      left: widget.posX.toDouble(),
      child: Opacity(
          opacity: widget.isAnimated! ? _animationController.value : 1.0,
          child: Container(
            width: widget.size.toDouble(),
            height: widget.size.toDouble(),
            decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 2.0, color: Colors.white)),
          )),
    );
  }
}

enum Direction { up, right, down, left }

class Pagina54 extends StatefulWidget {
  Pagina54({Key? key}) : super(key: key);

  @override
  State<Pagina54> createState() => _Pagina54State();
}

class _Pagina54State extends State<Pagina54> {
  final _baseUrl = "https://jsonplaceholder.typicode.com/posts";
  int _page = 0;
  final int _limit = 20;
  bool _isFirstLoadRuning = false;
  bool _hasNextPage = true;
  bool _isLoadMoreRunning = false;
  List _posts = [];
  late ScrollController _controller;

  void _loadMore() async {
    if (_hasNextPage &&
        !_isFirstLoadRuning &&
        !_isLoadMoreRunning &&
        _controller.position.extentAfter < 100) {
      setState(() {
        _isLoadMoreRunning = true;
      });
      _page += 1;
      try {
        final res =
            await http.get(Uri.parse("$_baseUrl?_page=$_page&_limit=$_limit"));
        final List fetchedPosts = json.decode(res.body);
        if (fetchedPosts.isNotEmpty) {
          setState(() {
            _posts.addAll(fetchedPosts);
          });
        } else {
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRuning = true;
    });
    try {
      final res =
          await http.get(Uri.parse("$_baseUrl?_page=$_page&_limit=$_limit"));
      setState(() {
        _posts = json.decode(res.body);
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    setState(() {
      _isFirstLoadRuning = false;
    });
  }

  @override
  void initState() {
    _firstLoad();
    _controller = ScrollController()..addListener(() => _loadMore());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagination Example Pag 54"),
      ),
      body: _isFirstLoadRuning
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        controller: _controller,
                        itemCount: _posts.length,
                        itemBuilder: (_, index) => Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 10.0),
                              child: ListTile(
                                title: Text(_posts[index]["title"]),
                                subtitle: Text(_posts[index]["body"]),
                              ),
                            ))),
                if (_isLoadMoreRunning)
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 40.0),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                if (_hasNextPage == false)
                  Container(
                      padding: EdgeInsets.only(top: 30.0, bottom: 40.0),
                      color: Colors.amber,
                      child: Center(
                          child: Text("You have fetched all of the content")))
              ],
            ),
    );
  }
}

class Pagina55 extends StatefulWidget {
  Pagina55({Key? key}) : super(key: key);

  @override
  State<Pagina55> createState() => _Pagina55State();
}

class _Pagina55State extends State<Pagina55> {
  String firstHalf = "";
  String secondHalf = "";
  String textMore =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  double textHeight = 150.0;
  bool hiddenText = true;

  @override
  void initState() {
    super.initState();
    if (textMore.length > textHeight) {
      firstHalf = textMore.substring(0, textHeight.toInt());
      secondHalf = textMore.substring(textHeight.toInt() + 1, textMore.length);
    } else {
      firstHalf = textMore;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        /* appBar: AppBar(
        title: Text("Header hidden Pag 55"),
      ), */
        body: CustomScrollView(slivers: [
      SliverAppBar(
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                      height: _size.height / 21.1,
                      width: _size.height / 21.1,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                              BorderRadius.circular(_size.height / 42.2)),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.red,
                        size: _size.height / 52.75,
                      )),
                ),
              ],
            ),
            Icon(Icons.shopping_cart_outlined),
          ],
        ),
        automaticallyImplyLeading: false,
        pinned: true,
        backgroundColor: Colors.amber,
        bottom: PreferredSize(
            child: Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Text("Sliver App Bar")),
            preferredSize: Size.fromHeight(20)),
        expandedHeight: 300.0,
        flexibleSpace: FlexibleSpaceBar(
          background: Image(
              // width: double.maxFinite,
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://www.cocinacaserayfacil.net/wp-content/uploads/2020/04/Recetas-de-comidas-para-ni%C3%B1os.jpg",
              )),
          /*        Image.asset(
          "assets/icon/icon.png",
          height: 500.0,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ) */
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
              child: secondHalf.isEmpty
                  ? Text(firstHalf)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hiddenText
                              ? (firstHalf + "...")
                              : (firstHalf + secondHalf),
                          style: TextStyle(height: 1.5),
                          // softWrap: true,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              hiddenText = !hiddenText;
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                hiddenText ? "Show More" : "Show Less",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                hiddenText
                                    ? Icons.arrow_drop_down
                                    : Icons.arrow_drop_up,
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                        )
                      ],
                    )),
        ),
      )
    ]));
  }
}

/* class ButtonController extends GetxController {
  String _orderType = "Home_Delivery";
  String get orderType => _orderType;
  void setOrder(String type) {
    _orderType = type;
    update();
  }
} */

class Pagina56 extends StatefulWidget {
  Pagina56({Key? key}) : super(key: key);

  @override
  State<Pagina56> createState() => _Pagina56State();
}

class _Pagina56State extends State<Pagina56> {
  double _value = 0.0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.blue.shade400,
              Colors.blue.shade800,
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),
          SafeArea(
              child: Container(
            width: width.width / 2,
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                DrawerHeader(
                    child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                          "https://scontent-mia3-2.xx.fbcdn.net/v/t1.18169-9/392442_338377892898346_1688503689_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=yuuhYWOkKsEAX_oELoA&_nc_ht=scontent-mia3-2.xx&oh=00_AT8oR53lkrB3K1v-2Bqk_YPRDvOLYQh01N_--aIcp-BwzA&oe=63217C77"),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "Charly Vásquez",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ],
                )),
                Expanded(
                    child: ListView(
                  children: [
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.home),
                      title: Text("Home"),
                      textColor: Colors.white,
                      iconColor: Colors.white,
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.person),
                      title: Text("Profile"),
                      textColor: Colors.white,
                      iconColor: Colors.white,
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.settings),
                      title: Text("Settings"),
                      textColor: Colors.white,
                      iconColor: Colors.white,
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.logout),
                      title: Text("Log out"),
                      textColor: Colors.white,
                      iconColor: Colors.white,
                    ),
                  ],
                ))
              ],
            ),
          )),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: _value),
              // curve: Curves.easeInExpo,
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 500),
              builder: (_, double val, __) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, width.width * val / 2)
                    ..rotateY((math.pi / 6) * val),
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("3D Drawer Menu"),
                    ),
                    body:
                        Center(child: Text("Swipe right to open the menu 👉 ")),
                  ),
                );
              }),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              setState(() {
                _value = e.delta.dx > 0 ? 1 : 0;
              });
            },
            /* onTap: () {
              setState(() {
                _value == 0 ? _value = 1 : _value = 0;
              });
            }, */
          )
        ],
      ),
    );
  }
}

class Pagina57 extends StatefulWidget {
  const Pagina57({Key? key}) : super(key: key);

  @override
  State<Pagina57> createState() => _Pagina57State();
}

class _Pagina57State extends State<Pagina57> {
  double _size = 0.0;
  // String word = "murcielagolandiaza".toUpperCase();
  // String word = "sastreria".toUpperCase();
  String word = "casa".toUpperCase();
  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
  ];
  @override
  void initState() {
    GameHangman.selectedChar = [];
    GameHangman.tries = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size.width;
    print(_size);
    print(_size / (2 * word.length + 0));
    return Scaffold(
      backgroundColor: AppColorHangman.primaryColor,
      appBar: AppBar(
          title: Text("Hangman"),
          backgroundColor: AppColorHangman.primaryColor,
          elevation: 0.0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    figureImageHangman(
                        GameHangman.tries >= 0, "assets/hangman/hang.png"),
                    figureImageHangman(
                        GameHangman.tries >= 1, "assets/hangman/head.png"),
                    figureImageHangman(
                        GameHangman.tries >= 2, "assets/hangman/body.png"),
                    figureImageHangman(
                        GameHangman.tries >= 3, "assets/hangman/ra.png"),
                    figureImageHangman(
                        GameHangman.tries >= 4, "assets/hangman/la.png"),
                    figureImageHangman(
                        GameHangman.tries >= 5, "assets/hangman/rl.png"),
                    figureImageHangman(
                        GameHangman.tries >= 6, "assets/hangman/ll.png"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: word
                      .split("")
                      .map((e) => letterHangman(e.toUpperCase(),
                          !GameHangman.selectedChar.contains(e.toUpperCase())))
                      .toList(),
                ),
              ],
            ),
            SizedBox(height: _size > 700 ? 20.0 : _size / 2.0),
            // Expanded(child: Container()),

            Container(
              margin: EdgeInsets.only(bottom: 40.0),
              width: double.maxFinite,
              height: _size > 700 ? 150.0 : 250.0,
              child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  crossAxisCount: (_size / 60).toInt(), //7,
                  padding: EdgeInsets.all(15.0),
                  childAspectRatio: 1.0,
                  children: alphabets.map((e) {
                    return RawMaterialButton(
                      onPressed: GameHangman.selectedChar.contains(e)
                          ? null
                          : () {
                              setState(() {
                                GameHangman.selectedChar.add(e);
                                print(GameHangman.selectedChar);
                                if (!word.split("").contains(e.toUpperCase())) {
                                  GameHangman.tries++;
                                }
                              });
                            },
                      /* shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)), */
                      /* fillColor: GameHangman.selectedChar.contains(e)
                          ? Colors.black87
                          : Colors.blue, */
                      child: Container(
                        width: _size / 8, //50,
                        height: _size / 8, //50,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: GameHangman.selectedChar.contains(e)
                              ? Colors.black87
                              : Colors.blue,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Center(
                          child: Text(
                            e,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: /* _size / 14, // */ 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  }).toList()),
            )
          ],
        ),
      ),
    );
  }

  Widget figureImageHangman(bool visible, String path) {
    return Visibility(
        visible: visible,
        child: Container(
          width: 250.0,
          height: 250.0,
          child: Image.asset(path),
        ));
  }

  Widget letterHangman(String character, bool hidden) {
    return Container(
      /* height: 30, //_size / 7, //65.0,
      width: 30, //_size / 12, //30.0, */
      padding: EdgeInsets.all(/* 5.0 */ _size / (5 * word.length + 0)),
      // padding: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          color: AppColorHangman.primaryColorDark,
          borderRadius: BorderRadius.circular(4.0)),
      child: Visibility(
          visible: !hidden,
          child: /* AutoSizeText(
          character,
          minFontSize: 15.0,
          maxFontSize: 30.0,
          stepGranularity: 5.0,
          maxLines: 1, //MediaQuery.of(context).size.width < 340.0 ? 3 : 3,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
          // overflow: TextOverflow.ellipsis,
        ), */

              Center(
            child: Text(
              character,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: _size / (2 * word.length + 5) //20.0
                  ),
            ),
          )),
    );
  }
}

class AppColorHangman {
  static Color primaryColor = const Color(0xFF39298A);
  static Color primaryColorDark = const Color(0xFF231954);
}

class GameHangman {
  static int tries = 0;
  static List<String> selectedChar = [];
}

class Pagina58 extends StatefulWidget {
  Pagina58({Key? key}) : super(key: key);

  @override
  State<Pagina58> createState() => _Pagina58State();
}

class _Pagina58State extends State<Pagina58> {
  final WordleGame _game = WordleGame();
  // late String word;
  @override
  void initState() {
    WordleGame.initGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      appBar: AppBar(
        backgroundColor: Color(0xFF212121),
        elevation: 0.0,
        title: Text("Wordle",
            style: TextStyle(
                color: Colors.white,
                fontSize: 36.0,
                fontWeight: FontWeight.bold)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /* Text("Wordle",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold)), */
          /* SizedBox(
            height: 20.0,
          ), */
          GameKeyboardWordle(_game),
          Container(),
        ],
      ),
    );
  }
}

class GameKeyboardWordle extends StatefulWidget {
  final WordleGame game;
  const GameKeyboardWordle(this.game, {Key? key}) : super(key: key);

  @override
  State<GameKeyboardWordle> createState() => _GameKeyboardWordleState();
}

class _GameKeyboardWordleState extends State<GameKeyboardWordle> {
  List row1 = "QWERTYUIOP".split("");
  List row2 = "ASDFGHJKLÑ".split("");
  List row3 = ["DEL", "Z", "X", "C", "V", "B", "N", "M", "SUBMIT"];
  bool winner = false;
  bool colorPush = false;

  @override
  void initState() {
    super.initState();
    WordleGame.gameMessage = "";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          WordleGame.gameMessage,
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 20.0,
        ),
        GameBoardWordle(widget.game),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row1.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if (widget.game.letterId < 5) {
                  setState(() {
                    widget.game
                        .insertWord(widget.game.letterId, LetterWordle(e, 0));
                    widget.game.letterId++;
                  });
                }
              },
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey.shade300),
                  child: Text(e,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold))),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row2.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if (widget.game.letterId < 5) {
                  setState(() {
                    widget.game
                        .insertWord(widget.game.letterId, LetterWordle(e, 0));
                    widget.game.letterId++;
                  });
                }
              },
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey.shade300),
                  child: Text(e,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold))),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row3.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if (e == "DEL") {
                  if (widget.game.letterId > 0 && !winner) {
                    setState(() {
                      widget.game.insertWord(
                          widget.game.letterId - 1, LetterWordle("", 0));
                      widget.game.letterId--;
                    });
                  }
                } else if (e == "SUBMIT") {
                  if (widget.game.letterId > 4) {
                    String guess = widget.game.wordleBoard[widget.game.rowId]
                        .map((e) => e.letter)
                        .join();
                    if (widget.game.checkWordExist(guess)) {
                      if (guess == WordleGame.gameGuess) {
                        setState(() {
                          WordleGame.gameMessage = "Congratulations";
                          /* for (var element
                              in widget.game.wordleBoard[widget.game.rowId]) {
                            element.code = 1;
                          } */
                          widget.game.wordleBoard[widget.game.rowId]
                              .forEach((element) {
                            element.code = 1;
                          });
                        });
                        winner = true;
                      } else {
                        int listLength = guess.length;
                        /* for (var i = 0; i < listLength; i++) {
                          String char = guess[i];
                          if (WordleGame.gameGuess.contains(char)) {
                            if (WordleGame.gameGuess[i] == char) {
                              setState(() {
                                widget.game.wordleBoard[widget.game.rowId][i]
                                    .code = 1;
                              });
                            }
                          }
                        }
                        for (var i = 0; i < listLength; i++) {
                          String char = guess[i];
                          if (WordleGame.gameGuess.contains(char)) {
                            if (widget.game.wordleBoard[widget.game.rowId][i]
                                    .code !=
                                1) {
                              setState(() {
                                widget.game.wordleBoard[widget.game.rowId][i]
                                    .code = 2;
                              });
                            } /* else {
                              setState(() {
                                widget.game.wordleBoard[widget.game.rowId][i]
                                    .code = 2;
                              });
                            } */
                          }
                        } */

                        for (var i = 0; i < listLength; i++) {
                          String char = guess[i];
                          if (WordleGame.gameGuess.contains(char)) {
                            if (WordleGame.gameGuess[i] == char) {
                              setState(() {
                                widget.game.wordleBoard[widget.game.rowId][i]
                                    .code = 1;
                              });
                            } else {
                              setState(() {
                                widget.game.wordleBoard[widget.game.rowId][i]
                                    .code = 2;
                              });
                            }
                          }
                        }

                        widget.game.rowId++;
                        widget.game.letterId = 0;
                      }
                    } else {
                      /* widget.game.rowId++;
                      widget.game.letterId = 0; */
                      setState(() {
                        WordleGame.gameMessage =
                            "The word does not exist try again";
                      });
                      Future.delayed(Duration(seconds: 3), () {
                        setState(() {
                          WordleGame.gameMessage = "";
                        });
                      });
                    }
                  }
                } else {
                  if (widget.game.letterId < 5) {
                    setState(() {
                      widget.game
                          .insertWord(widget.game.letterId, LetterWordle(e, 0));
                      widget.game.letterId++;
                    });
                  }
                }
              },
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey.shade300),
                  child: Text(e,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold))),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class WordleGame {
  int rowId = 0;
  int letterId = 0;
  static String gameMessage = "";
  static String gameGuess = "";
  static List<String> wordList = [
    "WORLD",
    "FIGHT",
    "BRAIN",
    "PLANE",
    "EARTH",
    "ROBOT",
    "AFTER",
    "SOUND",
    "TABLE",
    "PHONE",
    "MOUSE",
    "LIGHT",
    "POLAR",
    "ALIEN",
    "APPLE",
    "ARROW",
    "AUNTS",
    "BANKS",
    "BEACH",
    "BEERS",
    "BEGAN",
    "BEGIN",
    "BEGUN",
    "BOARD",
    "BOMBS",
    "BOXES",
    "BRAVE",
    "BULLS",
    "BUSES",
    "CARDS",
    "CASES",
    "CAUSE",
    "CENTS",
    "CHAIR",
    "CHILE",
    "CHINA",
    "CLASS",
    "CLAWS",
    "CLEAN",
    "CLOCK",
    "CLOUD",
    "CLUBS",
    "COACH",
    "COATS",
    "COMES",
    "COULD",
    "COVER",
    "DADDY",
    "DANCE",
    "DISKS",
    "DRAWS",
    "DREAM",
    "DROPS",
    "DRUGS",
    "DUBAI",
    "EDGES",
    "ENEMY",
    "FACTS",
    "FARMS",
    "FILES",
    "FLAGS",
    "FLIES",
    "FLOWS",
    "FORCE",
    "FRONT",
    "FUCKS",
    "GAMES",
    "GLOWS",
    "GOODS",
    "GROUP",
    "HAIRS",
    "HAITI",
    "HEARS",
    "HOLDS",
    "HOLES",
    "HOOKS",
    "HORNS",
    "HORSE",
    "HOURS",
    "IDEAS",
    "IRONS",
    "KINGS",
    "KNEES",
    "LAKES",
    "LEVEL",
    "LINES",
    "LIVED",
    "LIVES",
    "LORDS",
    "MILES",
    "MINTS",
    "MONTH",
    "MOUTH",
    "MOVED",
    "MOVES",
    "NAKED",
    "NAMES",
    "NECKS",
    "NIECE",
    "NOSES",
    "NOTES",
    "NURSE",
    "ORDER",
    "OWNED",
    "OWNER",
    "PALMS",
    "PARTY",
    "PATHS",
    "PAWNS",
    "PLANT",
    "PLAYS",
    "POSES",
    "PUPIL",
    "QUEEN",
    "RAINS",
    "RAWER",
    "RINGS",
    "RIVER",
    "ROADS",
    "SHARK",
    "SHOPS",
    "SHOWS",
    "SLEEP",
    "SNAKE",
    "SOCKS",
    "SOULS",
    "SPACE",
    "SPIES",
    "STARS",
    "STATE",
    "STAYS",
    "STEPS",
    "STONE",
    "STORE",
    "STORY",
    "SWIMS",
    "SPEED",
    "SPORT",
    "TALKS",
    "TANKS",
    "TASKS",
    "TAXES",
    "TEETH",
    "TESTS",
    "TIMES",
    "TOOLS",
    "TOOTH",
    "TRACK",
    "TUBES",
    "UNCLE",
    "USERS",
    "VOTED",
    "VOTER",
    "VOTES",
    "WALLS",
    "WATCH",
    "WAVES",
    "WEEKS",
    "WIVES",
    "WORDS",
    "WORKS",
    "YEARS",
    "WRITE",
    "LEARN",
  ];
  static bool gameOver = false;
  static List<LetterWordle> wordleRow =
      List.generate(5, (index) => LetterWordle("", 0));
  List<List<LetterWordle>> wordleBoard = List.generate(
      6, (index) => List.generate(5, (index) => LetterWordle("", 0)));

  static void initGame() {
    final random = math.Random();
    int index = random.nextInt(wordList.length);
    gameGuess = wordList[index];
    // gameGuess = wordList[0];
  }

  void insertWord(index, word) {
    wordleBoard[rowId][index] = word;
  }

  /* bool checkWordExist(String word) {
    return gameGuess == word;
  } */
  bool checkWordExist(String word) {
    return wordList.contains(word);
  }
}

class LetterWordle {
  String? letter;
  int code = 0;
  LetterWordle(this.letter, this.code);
}

class GameBoardWordle extends StatefulWidget {
  final WordleGame game;

  const GameBoardWordle(this.game, {Key? key}) : super(key: key);

  @override
  State<GameBoardWordle> createState() => _GameBoardWordleState();
}

class _GameBoardWordleState extends State<GameBoardWordle> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.game.wordleBoard
            .map((e) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: e
                    .map((e) => Container(
                          padding: EdgeInsets.all(16.0),
                          width: 64.0,
                          height: 64.0,
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: e.code == 0
                                  ? Colors.grey.shade800
                                  : e.code == 1
                                      ? Colors.green.shade400
                                      : Colors.amber.shade400),
                          child: Text(
                            e.letter!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                    .toList()))
            .toList());
  }
}

class Pagina59 extends StatefulWidget {
  Pagina59({Key? key}) : super(key: key);

  @override
  State<Pagina59> createState() => _Pagina59State();
}

class _Pagina59State extends State<Pagina59> {
  double x = 0;
  double y = 0;
  double amplitude = 0.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191D2D),
      appBar: AppBar(
        elevation: 0.0,
        title: Text("3D Card Animation Page 59"),
        backgroundColor: Color(0xFF191D2D),
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Center(
          child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..rotateX(x)
                ..rotateY(y),
              child: GestureDetector(
                  onPanUpdate: (details) {
                    //para y
                    if (y - details.delta.dx < 0) {
                      setState(() {
                        y = math.max(y - details.delta.dx / 100, -amplitude);
                        // y = math.min(y - details.delta.dx / 100, -amplitude);
                      });
                    } else {
                      setState(() {
                        y = math.min(y - details.delta.dx / 100, amplitude);
                        // y = math.max(y - details.delta.dx / 100, amplitude);
                      });
                    }
                    //para x
                    if (x + details.delta.dy < 0) {
                      setState(() {
                        x = math.max(x + details.delta.dy / 100, -amplitude);
                        // x = math.min(x - details.delta.dy / 100, -amplitude);
                      });
                    } else {
                      setState(() {
                        x = math.min(x + details.delta.dy / 100, amplitude);
                        // x = math.max(x - details.delta.dy / 100, amplitude);
                      });
                    }
                    print("X = $x");
                    print("Y = $y");
                  },
                  child: Container(
                    width: double.infinity,
                    height: 230.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/icon/icon.png"),
                            fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xAA5864F8),
                              blurRadius: 28.0,
                              offset: Offset(y * 10, -x * 80)
                              // offset: Offset(x, y + 4)
                              )
                        ]),
                  ))),
        ),
      ),
    );
  }
}
