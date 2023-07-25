import 'package:flutter/material.dart';
// import 'package:http/http.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class PageWebSocket extends StatelessWidget {
  //const PageWebSocket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Web Socket Demo"),
      ),
      body: WebSocketDemo(),
    );
  }
}

class WebSocketDemo extends StatefulWidget {
  final WebSocketChannel channel =
      IOWebSocketChannel.connect("wss://echo.websocket.org");
  WebSocketDemo({Key? key}) : super(key: key);

  @override
  State<WebSocketDemo> createState() => _WebSocketDemoState(channel: channel);
}

class _WebSocketDemoState extends State<WebSocketDemo> {
  final inputController = TextEditingController();
  List<String> messageList = [];
  final WebSocketChannel channel;

  _WebSocketDemoState({required this.channel}) {
    channel.stream.listen((event) {
      print(event);
      setState(() {
        messageList.add(event);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    inputController.dispose();
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: inputController,
                    decoration: InputDecoration(
                        labelText: "Send Message",
                        border: OutlineInputBorder()),
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: RaisedButton(
                  child: ElevatedButton(
                      child: Text(
                        "Send",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () {
                        if (inputController.text.isNotEmpty) {
                          //print(inputController.text);
                          // widget.channel.sink.add(inputController.text);
                          channel.sink.add(inputController.text);
                          inputController.text = "";
                        }
                      }),
                )
              ],
            ),
          ),
          Expanded(
              child: /* StreamBuilder(
              stream: widget.channel.stream,
              // initialData: initialData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  messageList.add(snapshot.data);
                }
                return  */
                  getMessageList() //;
              /* },
            ), */
              )
        ],
      ),
    );
  }

  ListView getMessageList() {
    List<Widget> listWidget = [];

    for (String message in messageList) {
      listWidget.add(ListTile(
        title: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message,
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          color: Colors.teal[50],
          height: 60.0,
        ),
      ));
    }

    return ListView(children: listWidget);
  }
}
