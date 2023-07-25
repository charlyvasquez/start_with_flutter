// import 'package:flutter/cupertino.dart';
import 'dart:math';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:start_with_flutter_again/Charly/pages/pages20.dart';
import 'package:start_with_flutter_again/Charly/pages/pages40.dart';

class Pagina70 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade900,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.orange.shade900,
        title: Text("InheritedWidget P1 Page_70"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<int>>(
              future: MyInheritedWidget.of(context).myService.getNumbers(),
              // initialData: InitialData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data[index].toString()),
                          tileColor: Colors
                              .primaries[index /* % snapshot.data!.length */],
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          MaterialButton(
            color: Colors.black,
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyWidget()));
            },
            child: Text("Go to MyWidget"),
          )
        ],
      )),
    );
  }
}

abstract class MyServiceParent {
  Future<List<int>> getNumbers();
}

class MyService extends MyServiceParent {
  @override
  Future<List<int>> getNumbers() async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(10, (index) => index);
  }
}

class MyInheritedWidget extends InheritedWidget {
  final MyServiceParent myService;

  MyInheritedWidget({required Widget child, required this.myService})
      : super(child: child);

  static MyInheritedWidget of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<MyInheritedWidget>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

// Realizar
  // MyInheritedWidget(
  //     myService: MyService(),
  //     child: const MaterialApp(
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.orange.shade100,
        title: Text("InheritedWidget P2"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<int>>(
              future: MyInheritedWidget.of(context).myService.getNumbers(),
              // initialData: InitialData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data[index].toString()),
                          tileColor: Colors
                              .primaries[index /* % snapshot.data!.length */],
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          MaterialButton(
            color: Colors.black,
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyWidget()));
            },
            child: Text("Go to MyWidget"),
          )
        ],
      )),
    );
  }
}

class Pagina71 extends StatefulWidget {
  Pagina71({Key? key}) : super(key: key);

  @override
  State<Pagina71> createState() => _Pagina71State();
}

class _Pagina71State extends State<Pagina71> {
  var _value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade300,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.orange.shade300,
        title: Text("InheritedWidget Listen Page_71"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Slider(
                value: _value,
                onChanged: (val) {
                  setState(() {
                    _value = val;
                  });
                }),
          ),
          Expanded(
              child: MyInheritedWidgetListen(
            value: _value,
            child: Row(
              children: [
                Expanded(child: LeftWidget()),
                Expanded(child: RightWidget()),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class LeftWidget extends StatelessWidget {
  const LeftWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red);
  }
}

class RightWidget extends StatelessWidget {
  const RightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: NumberWidget(),
    );
  }
}

class NumberWidget extends StatelessWidget {
  const NumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = MyInheritedWidgetListen.of(context).value;
    return Center(
      child: Text(
        value.toStringAsFixed(1),
        style: TextStyle(fontSize: 40.0),
      ),
    );
  }
}

class MyInheritedWidgetListen extends InheritedWidget {
  final double value;

  MyInheritedWidgetListen({required Widget child, required this.value})
      : super(child: child);

  /* static MyInheritedWidgetListen of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<MyInheritedWidgetListen>()!; */
  static MyInheritedWidgetListen of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyInheritedWidgetListen>()!;

  @override
  bool updateShouldNotify(covariant MyInheritedWidgetListen oldWidget) =>
      oldWidget.value != value;

// Realizar
  // MyInheritedWidget(
  //     myService: MyService(),
  //     child: const MaterialApp(
}

class Pagina72 extends StatefulWidget {
  const Pagina72({Key? key}) : super(key: key);

  @override
  State<Pagina72> createState() => _Pagina72State();
}

class _Pagina72State extends State<Pagina72> with WidgetsBindingObserver {
  late Future<Widget> pagina;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    if (state == AppLifecycleState.inactive) {
      Future.delayed(Duration(seconds: 7), () {
        main2();
      });
    }
    if (state == AppLifecycleState.paused) {
      pagina = startSplashAnimation2(context);
      print("Ok dentro del if AppLifecycleState.paused");
      Future.delayed(Duration(seconds: 5), () {
        print("Ok dentro del if AppLifecycleState.resumed 4 seg despues");
        // setState(() {
        //   main2();
        // });
        // Navigator.push(
        //   context,
        //   PageRouteBuilder(
        //     pageBuilder: (c, a1, a2) => Pagina47(),
        //     transitionsBuilder: (c, anim, a2, child) =>
        //         FadeTransition(opacity: anim, child: child),
        //     transitionDuration: Duration(milliseconds: 3000),
        //   ),
        // );
      });
    }
    if (state == AppLifecycleState.resumed) {
      pagina = startSplashAnimation(context);
      print("Ok dentro del if AppLifecycleState.resumed");
      Future.delayed(Duration(seconds: 4), () {
        print("Ok dentro del if AppLifecycleState.resumed 4 seg despues");

        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => Pagina45(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 3000),
          ),
        );
      });
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade300,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.orange.shade300,
        title: Text("Ciclos de Vida Page_72"),
      ),
      body: Column(
        children: [
          Expanded(child: Center(child: Text("Charly"))),
          Expanded(child: Center(child: Text("Vasquez"))),
        ],
      ),
    );
  }
}

Future<Widget> startSplashAnimation(
    BuildContext context /* String data */) async {
  await Future.delayed(
      Duration(seconds: 2),
      () => Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (c, a1, a2) => Pagina23(),
              transitionsBuilder: (c, anim, a2, child) =>
                  FadeTransition(opacity: anim, child: child),
              transitionDuration: Duration(milliseconds: 3000),
            ),
          ));
  return Pagina72();
}

Future<Widget> startSplashAnimation2(
    BuildContext context /* String data */) async {
  await Future.delayed(
      Duration(seconds: 2),
      () => Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (c, a1, a2) => Pagina21(),
              transitionsBuilder: (c, anim, a2, child) =>
                  FadeTransition(opacity: anim, child: child),
              transitionDuration: Duration(milliseconds: 3000),
            ),
          ));
  return Pagina72();
}

void main2() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MiApp2());
}

class MiApp2 extends StatelessWidget {
  const MiApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mi App",
      home: Inicio2(),
      /* theme: ThemeData(
            textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.red))) */
    );
  }
}

class Inicio2 extends StatefulWidget {
  const Inicio2({Key? key}) : super(key: key);

  @override
  State<Inicio2> createState() => _Inicio2State();
}

class _Inicio2State extends State<Inicio2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade300,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.orange.shade300,
        title: Text("Inicio2"),
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}

class Pagina73 extends StatefulWidget {
  const Pagina73({Key? key}) : super(key: key);

  @override
  State<Pagina73> createState() => _Pagina73State();
}

class _Pagina73State extends State<Pagina73> {
  final TextEditingController _numberCtrl = TextEditingController();

  String version = "";
  String buildNumber = "";

  @override
  void initState() {
    super.initState();
    _numberCtrl.text = "04148563323";

    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      String appName = packageInfo.appName;
      String packageName = packageInfo.packageName;
      setState(() {
        version = packageInfo.version;
        buildNumber = packageInfo.buildNumber;
      });
      print("appName" + appName);
      print("packageName" + packageName);
      print("version" + version);
      print("buildNumber" + buildNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter_phone_direct_caller Page_73'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _numberCtrl,
                decoration: const InputDecoration(labelText: "Phone Number"),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              child: const Text("Test Call"),
              onPressed: () async {
                FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);
              },
            )
          ],
        ),
      ),
    );
  }
}

class Pagina74 extends StatefulWidget {
  const Pagina74({Key? key}) : super(key: key);

  @override
  State<Pagina74> createState() => _Pagina74State();
}

class _Pagina74State extends State<Pagina74> {
  static const appId = "58b5bbec2af548c8b31d184e09fc6a73";
  static const token =
      "007eJxTYAhcrbDbes2e2PPtKXUVZrHTFoefNLfraGbQOjrVqsX94R4FBlOLJNOkpNRko8Q0UxOLZIskY8MUQwuTVAPLtGSzRHPjA11TkhsCGRk2B+1nZGSAQBBfkCEts6i4JDkjMS8vNacktbjEiIEBABdwJTA=";
  // "007eJxTYDD+FHHurfDc9qZbN3xerFL4/D75tFrHKhGXfP29Pfocmw8pMJhaJJkmJaUmGyWmmZpYJFskGRumGFqYpBpYpiWbJZobB7lNSm4IZGSYn6LKwAiFIL4AQ1pmUXFJckZiXl5qTklqcQkDAwB//iWH";

  String channelId = ""; //"firstchanneltest2";
  final channelName = "firstchanneltest2";

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

  // @override
  // void dispose() {
  //   super.dispose();
  //   _remoteUid = null;
  // }

  // Create UI with local view and remote view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agora Video Call Page_74'),
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
                    ? _renderLocalPreview()
                    : CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderLocalPreview() {
    return Transform.rotate(
        angle: 90 * pi / 180,
        child: RtcLocalView.SurfaceView(channelId: channelId));
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
}

class Pagina75 extends StatefulWidget {
  const Pagina75({Key? key}) : super(key: key);

  @override
  State<Pagina75> createState() => _Pagina75State();
}

class _Pagina75State extends State<Pagina75> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'twilio_programmable_video Page_75',
          style: TextStyle(fontSize: 14.0),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Text("Charly"),
          ),
        ],
      ),
    );
  }
}
