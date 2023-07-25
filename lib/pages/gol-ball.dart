import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:start_with_flutter_again/pages/pages80.dart';

class SplashGolBall extends StatefulWidget {
  SplashGolBall({Key? key}) : super(key: key);

  @override
  State<SplashGolBall> createState() => _SplashGolBallState();
}

class _SplashGolBallState extends State<SplashGolBall> {
  final bloc = SplashBloc();

  @override
  void initState() {
    // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      bloc.startSplashAnimation(MediaQuery.of(context).size.width * 1.1);
    });
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900, //Colors.blue.shade900,
      /* appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue.shade900,
        title: Text("SplashScreen Page_69"),
      ), */
      body: Center(
        child: StreamBuilder(
          stream: bloc.sizeStream,
          // initialData: initialData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              return AnimatedContainer(
                duration: Duration(seconds: 5),
                curve: Curves.easeOut,
                height: data,
                width: data,
                child: Image.asset(
                  "assets/logos/gol-ball@2x.png",
                  fit: BoxFit.cover,
                ),
                onEnd: () {
                  Navigator.of(context).pushReplacement(PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 850),
                      transitionsBuilder: (_, animation, __, child) {
                        return ScaleTransition(
                          scale: CurvedAnimation(
                              parent: animation, curve: Curves.elasticOut),
                          child: child,
                        );
                      },
                      pageBuilder: (_, animation, __) {
                        return DrawerGolBall();
                        /* MainPage(
                          indexOpen: 0,
                        ); */
                      }));
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class SplashBloc {
  final _controller = StreamController<double>()..add(45);
  Stream<double> get sizeStream => _controller.stream;

  Future<void> startSplashAnimation(double newSize) async {
    await Future.delayed(Duration(seconds: 1));
    _controller.add(newSize);
  }

  void dispose() {
    _controller.close();
  }
}

class DrawerGolBall extends StatefulWidget {
  DrawerGolBall({Key? key}) : super(key: key);

  @override
  State<DrawerGolBall> createState() => _DrawerGolBallState();
}

class _DrawerGolBallState extends State<DrawerGolBall> {
  double _value = 0.0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey
          .shade800, // Color(0xff1B243E), //Colors.red, // Only honored in Android M and above
      statusBarIconBrightness:
          Brightness.light, // Only honored in Android M and above
      statusBarBrightness: Brightness.dark, // Only honored in iOS
      systemNavigationBarColor: Colors.grey.shade800, //Color(0xff1B243E),
    ));
    var width = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.grey.shade800,
              Colors.grey.shade900,
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),
          SafeArea(
              child: GestureDetector(
            onTap: () {
              setState(() {
                print("_value:" + _value.toString());
                if (_value == 1) {
                  _value = 0;
                }
                // _value == 0 ? _value = 1 : _value = 0;
              });
            },
            child: Container(
              width: width.width / 2,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(
                      child: Column(
                    children: [
                      /* const CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                            "https://scontent-mia3-2.xx.fbcdn.net/v/t1.18169-9/392442_338377892898346_1688503689_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=yuuhYWOkKsEAX_oELoA&_nc_ht=scontent-mia3-2.xx&oh=00_AT8oR53lkrB3K1v-2Bqk_YPRDvOLYQh01N_--aIcp-BwzA&oe=63217C77"),
                      ), */
                      /* Container(
                        height: 50,
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5.0),
                        child: Image.asset(
                          "assets/logos/gol-ball-white.png",
                          height: 55,
                          width: 110.0,
                        ),
                      ), */
                      Image.asset(
                        "assets/logos/gol-ball@2x.png",
                        fit: BoxFit.cover,
                        scale: 2.1,
                      ),
                      /* SvgPicture.asset(
                        "assets/svg/instagram.svg",
                        height: 24.0,
                        color: Colors.white,
                      ), */
                      /* const SizedBox(
                        height: 20.0,
                      ), */
                      /* const Text(
                        "Se parte de la comunidad",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ), */
                    ],
                  )),
                  /* Expanded(
                      child: ListView(
                    children: [
/*                       ListTile(
                        onTap: () {},
                        leading: Icon(Icons.home),
                        title: SvgPicture.asset(
                          "assets/svg/instagram.svg",
                          height: 24.0,
                          color: Colors.white,
                        ), //Text("Home"),
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
 */
                      SvgPicture.asset(
                        "assets/svg/instagram.svg",
                        height: 24.0,
                        color: Colors.white,
                      ), //
                    ],
                  )) */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Se parte de la",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "comunidad",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebViewChatra(
                                    urlWebView:
                                        "https://www.instagram.com/golball_/")),
                          );
                        },
                        child: SvgPicture.asset(
                          "assets/svg/instagram.svg",
                          height: 24.0,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebViewChatra(
                                    urlWebView:
                                        "https://www.facebook.com/thegolball/")),
                          );
                        },
                        child: SvgPicture.asset(
                          "assets/svg/facebook.svg",
                          height: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebViewChatra(
                                    urlWebView:
                                        "https://twitter.com/golball_")),
                          );
                        },
                        child: SvgPicture.asset(
                          "assets/svg/twitter.svg",
                          height: 24.0,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebViewChatra(
                                    urlWebView:
                                        "https://www.tiktok.com/@golball_")),
                          );
                        },
                        child: SvgPicture.asset(
                          "assets/svg/tiktok.svg",
                          height: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebViewChatra(
                                    urlWebView:
                                        "https://www.twitch.tv/golball_")),
                          );
                        },
                        child: SvgPicture.asset(
                          "assets/svg/twitch.svg",
                          height: 24.0,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebViewChatra(
                                    urlWebView:
                                        "https://linkedin.com/company/golball")),
                          );
                        },
                        child: SvgPicture.asset(
                          "assets/svg/linkedin.svg",
                          height: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewChatra(
                                urlWebView: "https://t.me/GolBall")),
                      );
                    },
                    child: SvgPicture.asset(
                      "assets/svg/telegram.svg",
                      height: 24.0,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewChatra(
                                urlWebView:
                                    "https://static.golball.com/marketplace/docs/tyc_es.pdf")),
                      );
                    },
                    child: Text(
                      "Términos y condiciones",
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebViewChatra(
                                urlWebView:
                                    "https://static.golball.com/marketplace/docs/privacy_policy_es.pdf")),
                      );
                    },
                    child: Text(
                      "Políticas y Privacidad",
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ),
                  Spacer(),
                ],
              ),
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
                    child: Stack(
                      children: [
                        Container(
                            height: 100.0,
                            color: Colors.grey.shade900 //Color(0xff1B243E),
                            ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              height: 100.0,
                              color: Colors.grey.shade900 //Color(0xff1B243E),
                              ),
                        ),
                        Container(
                          child: SafeArea(
                              child: ClipRect(
                            child: Scaffold(
                                extendBody: true,
                                appBar: PreferredSize(
                                  preferredSize: Size.fromHeight(60),
                                  child: SafeArea(
                                    child: Material(
                                      color: Colors.grey.shade900,
                                      elevation: 5,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _value == 0
                                                    ? _value = 1
                                                    : _value = 0;
                                              });
                                            },
                                            child: Container(
                                              height: 50,
                                              alignment: Alignment.centerLeft,
                                              margin: EdgeInsets.all(5.0),
                                              child: Image.asset(
                                                "assets/logos/gol-ball-white.png",
                                                height: 40,
                                                width: 80.0,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 50,
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.all(5.0),
                                            child: Image.asset(
                                              "assets/logos/lgoobla.png",
                                              height: 40,
                                              // width: 80.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                body: WebTabla()),
                          )),
                        ),
                      ],
                    ));

                /* MainPage(
                      indexOpen: 0,
                    )); */
              }),
          /* GestureDetector(
            /* onHorizontalDragUpdate: (e) {
              setState(() {
                _value = e.delta.dx > 0 ? 1 : 0;
              });
            }, */
            onTap: () {
              setState(() {
                print("_value:" + _value.toString());
                if (_value == 1) {
                  _value = 0;
                }
                // _value == 0 ? _value = 1 : _value = 0;
              });
            },
          ) */
        ],
      ),
    );
  }
}

class WebViewChatra extends StatefulWidget {
  final String urlWebView;
  WebViewChatra({
    Key? key,
    required this.urlWebView,
  }) : super(key: key);

  @override
  State<WebViewChatra> createState() => _WebViewChatraState();
}

class _WebViewChatraState extends State<WebViewChatra> {
  late String _urlWebView;
  double _progress = 0;
  late InAppWebViewController _webViewController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    _urlWebView = widget.urlWebView;

    print("este es el url $_urlWebView");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 100.0,
            color: Colors.grey
                .shade900 // Color(0xff1B243E), //Colors.white.withOpacity(0.985), //Colors.white,
            ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 100.0, color: Colors.grey.shade900 //Color(0xff1B243E),
              ),
        ),
        Container(
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              key: scaffoldKey,
              body: Stack(children: [
                InAppWebView(
                  initialUrlRequest: URLRequest(
                      url: Uri.parse(
                          /* "https://cmsdimayor.s3.amazonaws.com/chat/chat-dimayor.html" */ _urlWebView)),
                  onWebViewCreated: (InAppWebViewController controller) {
                    _webViewController = controller;
                  },
                  onProgressChanged:
                      (InAppWebViewController controller, int progress) {
                    setState(() {
                      _progress = progress / 100;
                    });
                  },
                ),
                _progress < 1
                    ? Scaffold(
                        body: Center(child: CircularProgressIndicator()),
                        backgroundColor: Colors
                            .white //black.withOpacity(0.70), // this is the main reason of transparency at next screen. I am ignoring rest implementation but what i have achieved is you can see.
                        )
                    : Stack(children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10.0),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors
                                      .grey.shade900, //botomMenuColors['menu'],
                                  size: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
