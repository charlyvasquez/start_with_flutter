import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:start_with_flutter_again/Charly/pages/pages70.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainPage extends StatefulWidget {
  final int indexOpen;

  const MainPage({required this.indexOpen});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController controller = PageController();
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  int initPage = 0;
  String _shield = '';

  final screens = [
    WebCalendario(),
    WebTabla(),
    WebNoticias(),
    // WebViewGoles(urlWebView: "https://www.google.com.ve"),
    // Pagina72(),
    // WebViewGoles(urlWebView: "https://www.gmail.com"),
    // WebViewGoles(urlWebView: "https://www.mercadolibre.com.ve"),
    // WidgetCarrusel(),

    WebViewGoles(urlWebView: "https://dimayor.golball.com/"),

    // "https://www.sumajestadelgol.com"), //"https://www.google.com.ve"), //

    // WebViewGoles(urlWebView: "https://www.sumajestadelgol.com"),
  ];

  _cargarPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _shield = prefs.getString("shield") ?? "";
    });

    print(prefs.getString("shield"));
  }

  @override
  void initState() {
    initPage = widget.indexOpen;
    _cargarPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(
          0xff1B243E), //Colors.red, // Only honored in Android M and above
      statusBarIconBrightness:
          Brightness.light, // Only honored in Android M and above
      statusBarBrightness: Brightness.dark, // Only honored in iOS
      systemNavigationBarColor: Color(0xff1B243E),
    ));
    /* SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white)); */

    // var _provider = Provider.of<RootProvider>(context);
    // movePage(_provider.getPage());
    return Stack(
      children: [
        Container(
            height: 100.0, color: Colors.grey.shade900 //Color(0xff1B243E),
            ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 100.0, color: Colors.grey.shade900 //Color(0xff1B243E),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.all(5.0),
                            child: Image.asset(
                              "assets/logos/gol-ball-white.png",
                              height: 40,
                              width: 80.0,
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
                          /*   Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            /* MultiProvider(providers: [
                                              ChangeNotifierProvider(
                                                  create: (_) =>
                                                      NotificationState()),
                                            ], child: NotificationsPage()) */
                                            Pagina75()),
                                  );
                                },
                                icon: SvgPicture.asset(
                                    'assets/svg/ic_bell_on.svg',
                                    height: 25,
                                    color: Colors.grey[600])),
                            /* IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FavoritesClubsScreen(
                                              goBack: true, */
                            /* Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/ic_hamburger_change_club.png',
                                  height: 30,
                                ),
                                Container(
                                  color: Colors.white,
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FavoritesClubsScreen(
                                                    goBack: true,
                                                  )),
                                        );
                                      },
                                      icon: Image.network(
                                              _shield,
                                              errorBuilder: (context, object, trace){
                                                return Image.asset('assets/icons/ic_hamburger_change_club.png');
                                              },
                                              loadingBuilder:
                                                  (context, child, image) {
                                                return image != null ?Image.asset('assets/icons/ic_hamburger_change_club.png') : child;
                                              },
                                            )),
                                  /* );
                                },
                                /* icon: Image.asset(
                                    'assets/icons/ic_hamburger_change_club.png',height: 25.0)), */
                                                          //icon: Image.network(_shield),
                              //icon: FadeInImage.assetNetwork(placeholder: 'assets/icons/ic_hamburger_change_club.png', image: _shield.toString()),
                                 icon: _shield.isEmpty  ? Text('data') : Image.network(_shield) */
                                                                 ),
                              ],
                            ), */
                            IconButton(
                                iconSize: _shield == '' ? 25 : 30,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        /* builder: (context) => WebViewChatra(
                                            urlWebView:
                                                "https://cmsdimayor.s3.amazonaws.com/chat/chat-dimayor.html")), */
                                        builder: (context) =>
                                            /* FavoritesClubsScreen(
                                              goBack: true,
                                            ) */
                                            Pagina80()),
                                  );
                                },
                                /* icon: Image.asset(
                                    'assets/icons/ic_hamburger_support.png',height: 25.0)), */
                                icon: Image.network(
                                  _shield,
                                  errorBuilder: (context, object, trace) {
                                    return Image.asset(
                                        'assets/icons/ic_hamburger_change_club.png',
                                        height: 25.0);
                                  },
                                  loadingBuilder: (context, child, image) {
                                    return image != null
                                        ? Image.asset(
                                            'assets/icons/ic_hamburger_change_club.png',
                                            height: 25.0)
                                        : child;
                                  },
                                )),
                            SizedBox(
                              height: 42,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WebViewGoles(
                                              urlWebView:
                                                  "https://cmsdimayor.s3.amazonaws.com/chat/chat-dimayor.html")),
                                    );
                                  },
                                  icon: Image.asset(
                                      'assets/icons/ic_hamburger_support.png')),
                            ),
                          ],
                        )
                       */
                        ],
                      ),
                    ),
                  ),
                ),
                body: WebTabla()
                /* screens[initPage],
              bottomNavigationBar: Stack(
                children: [
                  CurvedNavigationBar(
                    index: initPage,
                    key: _bottomNavigationKey,
                    backgroundColor: Colors.transparent,
                    color: Colors.grey.shade900, //botomMenuColors['menu']!,
                    height: 65.0,
                    items: <Widget>[
                      // const TabWithText("assets/svg/home.svg", "Inicio"),
                      const TabWithText(
                          "assets/svg/calendario.svg", "Calendario"),
                      const TabWithText("assets/svg/table.svg", "Tabla"),
                      const TabWithText("assets/svg/news.svg", "Noticias"),
                      const TabWithText("assets/svg/img_nfts.svg", "Colección"),
                      /* const TabWithText(
                          "assets/svg/ic_menu_hamburger.svg", "Menú"), */
                    ],
                    animationCurve: Curves.easeInOut,
                    animationDuration: Duration(milliseconds: 300),
                    onTap: (index) {
                      // movePage(index);
                      setState(() {
                        initPage = index;
                        print("initPage = index:" +
                            index.toString() +
                            initPage.toString());
                      });
                      // context.read<RangeMatchChangeBloc>().add(CleanList());
                      print('///////////////////////////////');
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        /* initPage == 0
                            ?  */
                        // labelBottomNavigatorBar("Inicio", 5.0, Colors.white),
                        /* : labelBottomNavigatorBar(
                                "Inicio", 5.0, botomMenuColors['menu']!),
                        initPage == 1
                            ?  */
                        labelBottomNavigatorBar(
                            "Calendario", 0.0, Colors.white),
                        /* : labelBottomNavigatorBar(
                                "Ligas", 0.0, botomMenuColors['menu']!),
                        initPage == 2
                            ? */
                        labelBottomNavigatorBar("Tabla", 0.0, Colors.white),
                        /* : labelBottomNavigatorBar(
                                "Tabla", 0.0, botomMenuColors['menu']!),
                        initPage == 3
                            ? */
                        labelBottomNavigatorBar("Noticias", 7.0, Colors.white),
                        /* : labelBottomNavigatorBar(
                                "Noticias", 7.0, botomMenuColors['menu']!),
                        initPage == 4
                            ? */
                        labelBottomNavigatorBar("Colección", 2.0, Colors.white,
                            isLeft: false),
                        /* : labelBottomNavigatorBar(
                                "Colección", 2.0, botomMenuColors['menu']!,
                                isLeft: false),
                        initPage == 5
                            ? */
                        /* labelBottomNavigatorBar("Menú", 5.0, Colors.white,
                            isLeft: false) */
                        /*  : labelBottomNavigatorBar(
                                "Menú", 5.0, botomMenuColors['menu']!,
                                isLeft: false), */
                      ],
                    ),
                  )
                ],
              ), // This trailing comma makes auto-formatting nicer for build methods.
             */
                ),
          )),
        ),
      ],
    );
  }

  Container labelBottomNavigatorBar(
      String labelItem, double marginSpace, Color labelColor,
      {bool isLeft = true}) {
    return Container(
      width: labelItem.length >= 11
          ? 65.0
          : labelItem.length >= 9
              ? 55.0
              : labelItem.length >= 8
                  ? 50.0
                  : 48.0,
      child: Text(labelItem,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 9,
              fontFamily: "Lato",
              fontWeight: FontWeight.bold,
              color: labelColor)),
    );
  }

  //todo: jueguen con la animacion a ver si se consigue
  // un buen efecto
  void movePage(int index) {
    if (controller.hasClients) {
      controller.jumpToPage(index);
    }
  }
}

class TabWithText extends StatelessWidget {
  final String dirAsset;
  final String title;

  const TabWithText(this.dirAsset, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.0,
      width: 43.0,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        /* Expanded(
            flex: 4,
            child:  */
        SvgPicture.asset(
          dirAsset,
          height: 24.0,
        )
      ]),
    );
  }
}

const botomMenuColors = {
  'menu': Color(0xff1B243E),
  'menu_transparent': Color(0x791b243e),
  'transparent': Color(0xff00000000),
};

/* class WebViewChatra extends StatefulWidget {
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
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        verificationOfMainConfigurations();
      });
    });
    _urlWebView = widget.urlWebView;

    print("este es el url $_urlWebView");

    super.initState();
  }

  verificationOfMainConfigurations() async {
    /* if (await Permission.speech.isPermanentlyDenied) {
      // The user opted to never again see the permission request dialog for this
      // app. The only way to change the permission's status now is to let the
      // user manually enable it in the system settings.
      openAppSettings();
    } */

    if (await Permission.camera.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      print("Uso de la Camara en Android Permitido");
    }
    if (await Permission.microphone.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      print("Uso de la Microfono en Android Permitido");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100.0,
          color: Color(
              0xff1B243E), //Colors.white.withOpacity(0.985), //Colors.white,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 100.0,
            color: Color(0xff1B243E),
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
                                  color: botomMenuColors['menu'],
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

 */

class WebViewGoles extends StatefulWidget {
  final String urlWebView;
  //final int indDetail;

  WebViewGoles(
      {Key? key,
      /* required this.indDetail, */
      required this.urlWebView})
      : super(key: key);

  @override
  State<WebViewGoles> createState() => _WebViewGolesState();
}

class _WebViewGolesState extends State<WebViewGoles> {
  /* late  */ String _urlWebView = "";

  final _key = UniqueKey();
  late bool _isLoadingPage;
  late WebViewController controller;

  @override
  void dispose() {
    controller.clearCache();
    _urlWebView = "";
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _isLoadingPage = true;
    _urlWebView = widget.urlWebView;

    print("este es el url $_urlWebView");
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, //botomMenuColors['menu'],
        /* appBar: AppBar(
          title: const Text('Multiple WebView'),
        ), */
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              // Charly descomentar
/*               child: WebView(
                key: _key,
                initialUrl: _urlWebView,
                javascriptMode: JavascriptMode.unrestricted,
                gestureRecognizers: Set()
                  ..add(Factory<VerticalDragGestureRecognizer>(
                      () => VerticalDragGestureRecognizer())),
                gestureNavigationEnabled: false,
                onWebViewCreated: (WebViewController webViewController) {
                  controller = webViewController;
                },
                onPageFinished: (finish) {
                  setState(() {
                    _isLoadingPage = false;
                  });
                },
              ),
 */
            ),
            _isLoadingPage
                ? Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                    backgroundColor: Colors
                        .white //black.withOpacity(0.70), // this is the main reason of transparency at next screen. I am ignoring rest implementation but what i have achieved is you can see.
                    )
                : Container()
          ],
        ),
      ),
    );
  }
}

class WebCalendario extends StatelessWidget {
  static const String urlWeb = 'https://marketplace-dev.golball.com/';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
                color: Colors.red,
                height: 120.0,
                child:
                    // WebViewTables(urlWebView: urlWeb))),
                    WebViewPlayByPlay(
                  urlWebView: urlWeb,
                  bottom: 90.0,
                ))),
      ],
    );
  }
}

class WebTabla extends StatelessWidget {
  static const String urlWeb =
      'https://marketplace-dev.golball.com/marketplace';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
                color: Colors.red,
                height: 120.0,
                child:
                    // WebViewTables(urlWebView: urlWeb))),
                    WebViewPlayByPlay(
                  urlWebView: urlWeb,
                  // bottom: 90.0,
                ))),
      ],
    );
  }
}

class WebNoticias extends StatelessWidget {
  static const String urlWeb = 'https://www.mercadolibre.com.ve';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
                color: Colors.grey,
                height: 120.0,
                child:
                    // WebViewTables(urlWebView: urlWeb))),
                    WebViewPlayByPlay(
                  urlWebView: urlWeb,
                  bottom: 90.0,
                ))),
      ],
    );
  }
}

class WebViewPlayByPlay extends StatefulWidget {
  final String urlWebView;
  final double bottom;
  //final int indDetail;

  WebViewPlayByPlay(
      {Key? key,
      /* required this.indDetail, */
      required this.urlWebView,
      this.bottom = 0.0})
      : super(key: key);

  @override
  State<WebViewPlayByPlay> createState() => _WebViewPlayByPlayState();
}

class _WebViewPlayByPlayState extends State<WebViewPlayByPlay> {
  late String _urlWebView;

  final _key = UniqueKey();
  late bool _isLoadingPage;
  late WebViewController controller;
  //late int _selectedIndex; // = 0;

  List<String> arrLinks = [
    'https://pub.dev/',
    'https://flutter.io',
    'https://www.google.com/',
    'https://www.gmail.com/',
  ];

  @override
  void initState() {
    super.initState();
    _isLoadingPage = true;
    _urlWebView = widget.urlWebView;
    //_selectedIndex = widget.indDetail;
    print("este es el url $_urlWebView");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: const Text('Multiple WebView'),
      ), */
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.grey.shade900.withOpacity(0.9),
            padding: EdgeInsets.only(bottom: widget.bottom),
            // Charly descomentar
            /* child: WebView(
              backgroundColor: Colors.grey.shade900,
              key: _key,

              initialUrl: _urlWebView, // arrLinks[_selectedIndex],
              javascriptMode: JavascriptMode.unrestricted,

              gestureRecognizers: Set()
                ..add(Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer())),
              gestureNavigationEnabled: false,
              onWebViewCreated: (WebViewController webViewController) {
                controller = webViewController;
              },
              onPageFinished: (finish) {
                setState(() {
                  _isLoadingPage = false;
                });
              },
            ), */
          ),
          _isLoadingPage
              ? Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                  backgroundColor: Colors.white
                  // Colors.black.withOpacity(0.70), // this is the main reason of transparency at next screen. I am ignoring rest implementation but what i have achieved is you can see.
                  )
              : Stack()
        ],
      ),
    );
  }

  /* void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isLoadingPage = true;
      controller.loadUrl(arrLinks[_selectedIndex]);
    });
  } */
}

class Pagina80 extends StatefulWidget {
  const Pagina80({Key? key}) : super(key: key);

  @override
  State<Pagina80> createState() => _Pagina80State();
}

class _Pagina80State extends State<Pagina80> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
