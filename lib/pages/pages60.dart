import 'dart:async';
import 'dart:convert';
import 'dart:math';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:get/get_connect/sockets/src/sockets_io.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart' as http;

class Pagina60 extends StatefulWidget {
  Pagina60({Key? key}) : super(key: key);

  @override
  State<Pagina60> createState() => _Pagina60State();
}

class _Pagina60State extends State<Pagina60> {
  bool isBack = true;
  double angle = 0.0;

  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF292A3E),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF292A3E),
        title: Text("Flip Card Animation Page 60"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _flip,
                child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: angle),
                    duration: Duration(seconds: 1),
                    builder: (BuildContext context, double val, __) {
                      isBack = (val >= pi / 2) ? false : true;
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(val),
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..rotateY(pi),
                          child: Container(
                            width: 309.0,
                            height: 474.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    image: AssetImage(isBack
                                        ? "assets/icon/back.png"
                                        : "assets/icon/face.png"))),
                            child: isBack
                                ? Container()
                                : Center(
                                    child: Text(
                                      "Surprise",
                                      style: TextStyle(
                                        fontSize:
                                            30.0, /* color: Colors.white */
                                      ),
                                      // textAlign: TextAlign.center,
                                    ),
                                  ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Pagina61 extends StatefulWidget {
  Pagina61({Key? key}) : super(key: key);

  @override
  State<Pagina61> createState() => _Pagina61State();
}

class _Pagina61State extends State<Pagina61> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("PDF Reader Page_61"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent Documents",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            Column(
              children: DocumentPDF.docList
                  .map((doc) => ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReaderScreen(doc)));
                        },
                        title: Text(
                          doc.docTitle!,
                          style: TextStyle(fontSize: 15.0),
                        ),
                        subtitle: Text("${doc.pageNum} Pages"),
                        leading: Icon(
                          Icons.picture_as_pdf,
                          color: Colors.red,
                          size: 32.0,
                        ),
                        trailing: Text(
                          doc.docDate!,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ))
                  .toList(),
            )
            // Container(),
          ],
        )),
      ),
    );
  }
}

class DocumentPDF {
  String? docTitle;
  String? docUrl;
  String? docDate;
  int? pageNum;
  DocumentPDF(this.docTitle, this.docUrl, this.docDate, this.pageNum);

  static List<DocumentPDF> docList = [
    DocumentPDF("Artificial Intelligence and its Role in Near Future",
        "https://arxiv.org/pdf/1804.01396.pdf", "8-08-2015", 11),
    DocumentPDF(
        "Flutter Succinctly By Ed Freitas Foreword by Daniel Jebaraj",
        "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf",
        "23-08-2019",
        129),
  ];
}

class ReaderScreen extends StatefulWidget {
  DocumentPDF doc;
  ReaderScreen(this.doc, {Key? key}) : super(key: key);

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(widget.doc.docTitle!),
      ),
      body: Container(
        child: SfPdfViewer.network(widget.doc.docUrl!),
      ),
    );
  }
}

/* class HomePagePDF extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePagePDF> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter PDF Viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
        key: _pdfViewerKey,
      ),
    );
  }
}
 */

class Pagina62 extends StatefulWidget {
  Pagina62({Key? key}) : super(key: key);

  @override
  State<Pagina62> createState() => _Pagina62State();
}

class _Pagina62State extends State<Pagina62> {
  double? heading;
  @override
  void initState() {
    //android/app/build.gradle minSdkVersion 23
    //android/app/src/main/AndroidManifest.xml
    //colocar en linea 3
    /* <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/> */
    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text("Compass App, Page_62"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${heading?.ceil()}" /* ?? "" */ /* "${heading!.ceil()}" */,
            style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("assets/compass/cadrant.png"),
                Transform.rotate(
                    angle: ((heading ?? 0) * (pi / 180) * -1),
                    child: Image.asset("assets/compass/compass.png")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* class MyCompass extends StatefulWidget {
  MyCompass({Key? key}) : super(key: key);

  @override
  State<MyCompass> createState() => _MyCompassState();
}

class _MyCompassState extends State<MyCompass> {
  bool _hasPermissions = true;
  CompassEvent? _lastRead;
  DateTime? _lastReadAt;

  @override
  void initState() {
    super.initState();

    // _fetchPermissionStatus();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Flutter Compass'),
        ),
        body: Builder(builder: (context) {
          if (_hasPermissions) {
            return Column(
              children: <Widget>[
                _buildManualReader(),
                Expanded(child: _buildCompass()),
              ],
            );
          } else {
            return _buildPermissionSheet();
          }
        }),
      ),
    );
  }

  Widget _buildManualReader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          ElevatedButton(
            child: Text('Read Value'),
            onPressed: () async {
              final CompassEvent tmp = await FlutterCompass.events!.first;
              setState(() {
                _lastRead = tmp;
                _lastReadAt = DateTime.now();
              });
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$_lastRead',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    '$_lastReadAt',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompass() {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error reading heading: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        double? direction = snapshot.data!.heading;

        // if direction is null, then device does not support this sensor
        // show error message
        if (direction == null)
          return Center(
            child: Text("Device does not have sensors !"),
          );

        return Material(
          shape: CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          child: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Transform.rotate(
              angle: (direction * (pi / 180) * -1),
              child: Image.asset(
                  /* 'assets/compass.jpg' */
                  "assets/compass/compass.png"),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPermissionSheet() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Location Permission Required'),
          ElevatedButton(
            child: Text('Request Permissions'),
            onPressed: () {
              /* Permission.locationWhenInUse.request().then((ignored) {
                _fetchPermissionStatus();
              }); */
            },
          ),
          SizedBox(height: 16),
          ElevatedButton(
            child: Text('Open App Settings'),
            onPressed: () {
              /* openAppSettings().then((opened) {
                //
              }); */
            },
          )
        ],
      ),
    );
  }

  /* void _fetchPermissionStatus() {
    Permission.locationWhenInUse.status.then((status) {
      if (mounted) {
        setState(() => _hasPermissions = status == PermissionStatus.granted);
      }
    });
  } */
}
 */

class Pagina63 extends StatefulWidget {
  Pagina63({Key? key}) : super(key: key);

  @override
  State<Pagina63> createState() => _Pagina63State();
}

class _Pagina63State extends State<Pagina63> {
  late double percent /* = 0 */;
  static int TimeInMinut = 5;
  int TimeInSecond = 25 * 60;
  late Timer timer;
  bool isWhite = true;
  @override
  void initState() {
    percent = 0.0;
    super.initState();
  }

  void _StartTimer() {
    TimeInMinut = 5;
    int time = TimeInMinut * 60;
    double secPercent = (time / 100);
    timer = Timer.periodic(Duration(seconds: 1), (timerAux) {
      setState(() {
        isWhite = true;
        if (time > secPercent) {
          time--;
          if (time % 60 == 0) {
            TimeInMinut--;
          }
          if (time % secPercent == 0) {
            if (percent < 1) {
              percent += 0.01;
            } else {
              percent = 1.0;
            }
          }
        } else {
          setState(() {
            isWhite = false;
          });
          percent = 0.0;
          TimeInMinut = 5;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF51A8FF),
        title: Text("Pomodoro Clock Page_63"),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF1542BF),
          Color(0xFF51A8FF),
        ], begin: FractionalOffset(0.5, 1))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /* Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                "Pomodoro Clock Page_63",
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ), */
            Expanded(
                child: CircularPercentIndicator(
              // circularStrokeCap: CircularStrokeCap.round,
              percent: percent,
              animation: true,
              animateFromLastPercent: true,
              lineWidth: 20.0,
              progressColor: isWhite ? Colors.white : Color(0xFFB8C7CB),
              radius: 250.0,
              center: Text(
                "$TimeInMinut",
                style: TextStyle(color: Colors.white, fontSize: 50.0),
              ),
            )),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Study Time",
                                  style: TextStyle(fontSize: 30.0),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "25",
                                  style: TextStyle(fontSize: 50.0),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Pause Time",
                                  style: TextStyle(fontSize: 30.0),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "5",
                                  style: TextStyle(fontSize: 50.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 28.0),
                      // child: RaisedButton(
                      child: ElevatedButton(
                        // padding: EdgeInsets.all(20.0),
                        onPressed: _StartTimer,
                        // color: Colors.blue,
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(100.0)),
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(100.0)),
                          child: Text(
                            "Start Studying",
                            style:
                                TextStyle(color: Colors.white, fontSize: 22.0),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 20.0)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Pagina64 extends StatefulWidget {
  Pagina64({Key? key}) : super(key: key);

  @override
  State<Pagina64> createState() => _Pagina64State();
}

class _Pagina64State extends State<Pagina64> {
  Color primaryColor = const Color(0xFF222222);
  Color textInputColor = const Color(0xFF404040);
  Color accentColor = const Color(0xFF4C90D2);
  String _data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        title: Text("Generate QR Code Page_64"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: QrImage(
              data: _data,
              backgroundColor: Colors.white,
              size: 300.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
              width: 300.0,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _data = value;
                  });
                },
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: textInputColor,
                    border: InputBorder.none,
                    hintText: "Type the Data"),
              )),
          // Container(),
          SizedBox(
            height: 20.0,
          ),
          RawMaterialButton(
              onPressed: () {},
              fillColor: accentColor,
              padding: EdgeInsets.symmetric(horizontal: 36.0, vertical: 16.0),
              shape: StadiumBorder(),
              child: Text("Generate QR Code"))
        ],
      ),
    );
  }
}

class Pagina65 extends StatefulWidget {
  Pagina65({Key? key}) : super(key: key);

  @override
  State<Pagina65> createState() => _Pagina65State();
}

class _Pagina65State extends State<Pagina65> {
  //version iOS 11.0 para arriba
  //en el info.plist
  /* 
  <key>NSCameraUsageDescription</key>
	<string>We use the camera to scan barcodes</string>
	<key>NSPhotoLibraryUsageDescription</key>
	<string>We need access in order to open photos of barcodes</string> 
  */
  //Android de versionMinima 21 para arriba
  MobileScannerController cameraController = MobileScannerController();
  bool _screenOpened = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanning QR Code Page_65"),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () => cameraController.toggleTorch(),
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (BuildContext context, dynamic state, Widget? child) {
                switch (state as TorchState) {
                  case TorchState.off:
                    return const Icon(
                      Icons.flash_off,
                      color: Colors.grey,
                    );
                  case TorchState.on:
                    return const Icon(
                      Icons.flash_on,
                      color: Colors.yellow,
                    );
                }
              },
            ),
            iconSize: 30.0,
          ),
          IconButton(
            color: Colors.white,
            onPressed: () => cameraController.switchCamera(),
            icon: ValueListenableBuilder(
              valueListenable: cameraController.cameraFacingState,
              builder: (BuildContext context, dynamic state, Widget? child) {
                switch (state as CameraFacing) {
                  case CameraFacing.front:
                    return const Icon(
                      Icons.camera_front,
                      // color: Colors.grey,
                    );
                  case CameraFacing.back:
                    return const Icon(
                      Icons.camera_rear,
                      // color: Colors.yellow,
                    );
                }
              },
            ),
            iconSize: 30.0,
          ),
        ],
      ),
      body: MobileScanner(
        onDetect: _foundBarCode,
        allowDuplicates: true,
        controller: cameraController,
      ),
    );
  }

  void _foundBarCode(Barcode barCode, MobileScannerArguments? args) {
    if (!_screenOpened) {
      final String code = barCode.rawValue ?? "---";
      print("Barcode found: $code");
      _screenOpened = true;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FoundCodeScreen(
                  screenClosed: _screenWasClosed, value: code)));
    }
  }

  void _screenWasClosed() {
    _screenOpened = false;
  }
}

class FoundCodeScreen extends StatefulWidget {
  final String value;
  final Function() screenClosed;

  FoundCodeScreen({Key? key, required this.value, required this.screenClosed})
      : super(key: key);

  @override
  State<FoundCodeScreen> createState() => _FoundCodeScreenState();
}

class _FoundCodeScreenState extends State<FoundCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Found Code"),
          leading: IconButton(
              onPressed: () {
                widget.screenClosed;
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back))),
      body: Center(
        child: Column(
          children: [
            Text("Scanned Code", style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 20.0),
            Text(widget.value, style: TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}

class Pagina66 extends StatefulWidget {
  Pagina66({Key? key}) : super(key: key);

  @override
  State<Pagina66> createState() => _Pagina66State();
}

class _Pagina66State extends State<Pagina66> {
  final colorStream = StreamController<Color>();
  int counter = -1;
  List<Color> colorList = [Colors.black, Colors.red, Colors.green];
  final myStream = NumberCreator().stream;
  final myStreamClose = NumberCreator().closeController;

  String _data = "a";
  /* final subscription = myStream.listen((event) =>
    print("Data: $event")
  ); */
  @override
  void dispose() {
    colorStream.close();
    myStreamClose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final subscription = myStream.listen((event) {
      print("Data: $event");
      // setState(() {
      _data = event.toString();
      // });
    });
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue.shade300,
        title: Text("StreamBuilder Page_66"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: NumberCreator().stream,
              // initialData: initialData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Not data yet..");
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return Text("Done Stream");
                } else if (snapshot.hasError) {
                  return Text("Error Stream");
                } else
                  return Text(snapshot.data.toString());
              },
            ),
            SizedBox.square(
              dimension: 50.0,
              child: Text("Charly"),
            ),
            Text(_data),
            SizedBox.shrink(),
            StreamBuilder(
              stream: colorStream.stream, //Lo que quiero estar escuchando
              // initialData: Colors.white,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return LoadingWidgetStream();
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text("Fin del Stream");
                }
                return Container(
                    height: 150.0, width: 150.0, color: snapshot.data);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter++;
          if (counter < colorList.length) {
            colorStream.sink.add(colorList[counter]);
          } else {
            colorStream.close();
          }
        },
        child: Icon(Icons.colorize),
      ),
    );
  }
}

class LoadingWidgetStream extends StatelessWidget {
  const LoadingWidgetStream({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Esperando Clicks",
        ),
        SizedBox(
          height: 20.0,
        ),
        CircularProgressIndicator(
          // semanticsLabel: "Charly",
          // semanticsValue: "42",
          // value: 0.2,
          // strokeWidth: 20.0,
          // backgroundColor: Colors.orange,
          color: Colors.white,
        ),
      ],
    );
  }
}

class NumberCreator {
  NumberCreator() {
    final Timer? myTimer;
    myTimer = Timer.periodic(Duration(seconds: 1), (t) {
      _controller.sink.add(_count);
      _count++;
      if (_count > 10) {
        t.cancel();
        _controller.close();
      }
    });
    /* if (_count == 10) {
      myTimer.cancel();
    } */
  }
  int _count = 1;
  final _controller = StreamController<int>();
  // final Timer? myTimer;
  Stream<int> get stream => _controller.stream;
  Future<dynamic> get closeController => _controller.close();
}

class Pagina67 extends StatefulWidget {
  Pagina67({Key? key}) : super(key: key);

  @override
  State<Pagina67> createState() => _Pagina67State();
}

class _Pagina67State extends State<Pagina67> {
  StreamController<DataModelStream> _streamController = StreamController();

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      getCryptoPrice();
      print("getCryptoPrice");
    });
    super.initState();
  }

  Future<void> getCryptoPrice() async {
    var url = Uri.parse(
        "https://api.nomics.com/v1/currencies/ticker?key=0ec15727bece63da35ead7eaf7a41ead5621d1d5&ids=BTC");
    final response = await http.get(url);
    final dataBody = json.decode(response.body).first;
    DataModelStream dataModelStream = DataModelStream.fromJson(dataBody);
    _streamController.sink.add(dataModelStream);
  }

  @override
  void dispose() {
    // _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade500,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.blue.shade500,
          title: Text("StreamBuilderFetch Page_67"),
        ),
        body: Center(
          child: StreamBuilder(
            stream: _streamController.stream,
            // initialData: initialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());

                default:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Please wait..."),
                    );
                  } else {
                    return BuildCoinWidget(snapshot.data);
                  }
              }

              // return Container();
            },
          ),
        ));
  }
}

class DataModelStream {
  String name;
  String image;
  String price;

  DataModelStream.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        image = json["logo_url"],
        price = json["price"];

  Map<String, dynamic> toJson() =>
      {"name": name, "logo_url": image, "price": price};
}

Widget BuildCoinWidget(DataModelStream dataModelStream) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(dataModelStream.name),
      SvgPicture.network(
        dataModelStream.image,
        width: 150.0,
        height: 150.0,
      ),
      SizedBox(height: 20.0),
      Text(dataModelStream.price),
    ],
  );
}

class Pagina68 extends StatefulWidget {
  Pagina68({Key? key}) : super(key: key);

  @override
  State<Pagina68> createState() => _Pagina68State();
}

class _Pagina68State extends State<Pagina68> {
  List<dynamic> _users = [];
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade700,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.blue.shade700,
          title: Text("Api Calling DummyJson Page_68"),
        ),
        body: _users.isNotEmpty
            ? ListView.builder(
                itemCount: _users.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Row(
                      children: [
                        Image.network(
                          _users[index]["image"],
                          fit: BoxFit.cover,
                          height: 50.0,
                          width: 50.0,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_users[index]["firstName"]),
                              Text(_users[index]["email"]),
                              Text(_users[index]["phone"]),
                            ])
                      ],
                    ),
                  );
                },
              )
            : Container(
                child: Center(
                child: _loading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : ElevatedButton(
                        onPressed: loadUsersList, child: Text("Load Users")),
              )));
  }

  void loadUsersList() async {
    setState(() {
      _loading = true;
    });
    var res = await http.get(Uri.https("dummyjson.com", "users"));
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      print(jsonData);
      setState(() {
        _users = jsonData["users"];
        _loading = false;
      });
    }
  }
}

class Pagina69 extends StatefulWidget {
  Pagina69({Key? key}) : super(key: key);

  @override
  State<Pagina69> createState() => _Pagina69State();
}

class _Pagina69State extends State<Pagina69> {
  final bloc = SplashBloc();

  @override
  void initState() {
    // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      bloc.startSplashAnimation(MediaQuery.of(context).size.width * 2);
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
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue.shade900,
        title: Text("SplashScreen Page_69"),
      ),
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
                  "assets/compass/cadrant.png",
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
                        return Pagina68();
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
