import 'package:flutter/material.dart';

class Pagina30 extends StatefulWidget {
  @override
  State<Pagina30> createState() => _Pagina30State();
}

class _Pagina30State extends State<Pagina30> {
  double _currentValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text("Simple Slider Página30"),
      ),
      backgroundColor: Colors.yellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Valor: ${_currentValue.toStringAsFixed(0)}"),
          Slider(
              min: 0.0,
              max: 100.0,
              divisions: 100,
              activeColor: Colors.red,
              inactiveColor: Colors.grey,
              label: _currentValue.toStringAsFixed(1),
              value: _currentValue,
              onChanged: (value) {
                setState(() {
                  _currentValue = value;
                });
              })
        ],
      ),
    );
  }
}

class Pagina31 extends StatefulWidget {
  @override
  State<Pagina31> createState() => _Pagina31State();
}

class _Pagina31State extends State<Pagina31> {
  DateTime _dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Date Picker Página31"),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            _dateTime.toString(),
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          Center(
            child: MaterialButton(
              onPressed: _showDatePicker,
              color: Colors.black12,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Choose Date",
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Pagina32 extends StatefulWidget {
  @override
  State<Pagina32> createState() => _Pagina32State();
}

class _Pagina32State extends State<Pagina32> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  void _showTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Time Picker Página32"),
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "La Hora es: " + _timeOfDay.format(context),
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            MaterialButton(
              color: Colors.blueGrey,
              onPressed: _showTimePicker,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Pick Time",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Pagina33 extends StatefulWidget {
  @override
  State<Pagina33> createState() => _Pagina33State();
}

class _Pagina33State extends State<Pagina33> {
  int _currentHora = 0;
  int _currentMinuto = 0;
  String _AMoPM = "";
  late FixedExtentScrollController _controller;

  TimeOfDay _timeOfDay = TimeOfDay.now();
  void _showTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Wheel Scroll Página33"),
      ),
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ListWheelScrollView(
                  itemExtent: 50,
                  perspective: 0.01,
                  diameterRatio: 1,
                  children: [
                    Container(
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          "La Hora es: ",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          "La Hora es: ",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          "La Hora es: ",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          "La Hora es: ",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          "La Hora es: ",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          "La Hora es: ",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          "La Hora es: ",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          "La Hora es: ",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          "La Hora es: ",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("La Hora es: "),
              Text(_currentHora == 0
                  ? ""
                  : _currentHora.toString() +
                      ":" +
                      _controller.selectedItem.toString() +
                      " " +
                      _AMoPM)
            ],
          ),
          Expanded(
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 70.0,
                  child: ListWheelScrollView.useDelegate(
                      onSelectedItemChanged: (value) {
                        setState(() {
                          _currentHora = value + 1;
                        });
                      },
                      itemExtent: 50,
                      perspective: 0.01,
                      diameterRatio: 1,
                      physics: FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 12,
                          builder: (context, index) {
                            return /* MyTile */ MyHours(
                              hours: index + 1,
                            );
                          })),
                ),
                Container(
                  width: 70.0,
                  child: ListWheelScrollView.useDelegate(
                      controller: _controller,
                      itemExtent: 50,
                      perspective: 0.01,
                      diameterRatio: 1,
                      physics: FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 60,
                          builder: (context, index) {
                            return /* MyTile */ Myminutes(
                              mins: index,
                            );
                          })),
                ),
                Container(
                  width: 70.0,
                  child: ListWheelScrollView.useDelegate(
                      onSelectedItemChanged: (value) {
                        setState(() {});
                        print(_controller.selectedItem.toString());
                        _AMoPM = value == 0 ? "AM" : "PM";
                      },
                      // controller: _controller,
                      itemExtent: 50,
                      perspective: 0.01,
                      diameterRatio: 1,
                      physics: FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 2,
                          builder: (context, index) {
                            return MyAmPm(
                              isItAm: index == 0 ? true : false,
                            );
                          })),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}

class Pagina34 extends StatelessWidget {
  final estilo = const TextStyle(fontSize: 22.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("SafeArea ListGenerate Página34"),
        ),
        body: SafeArea(
          child: ListView(
            children: List.generate(
                100,
                (index) => Text(
                      '$index - Emisora',
                      style: estilo,
                    )),
          ),
        ));
  }
}

class Pagina35 extends StatefulWidget {
  const Pagina35({Key? key}) : super(key: key);

  @override
  State<Pagina35> createState() => _Pagina35State();
}

class _Pagina35State extends State<Pagina35> {
  double opacidad = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Wrap con chip Page_35"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Chip"),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10.0,
                children: [
                  ChipCustomCh("Charly Vásquez"),
                  ChipCustomCh("Cheryl Vásquez"),
                  ChipCustomCh("Roselyn Vásquez"),
                  ChipCustomCh("Rosa de Vásquez"),
                  ChipCustomCh("Luperio Vásquez"),
                  ChipCustomCh("Charly"),
                  ChipCustomCh("Cheryl"),
                  AnimatedOpacity(
                      duration: Duration(milliseconds: 600),
                      opacity: opacidad,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              opacidad = (opacidad == 1) ? 0.0 : 1.0;
                            });
                          },
                          child: Wrap(spacing: 10.0, children: [
                            ChipCustomCh("Luperio"),
                            ChipCustomCh("Roselyn"),
                            ChipCustomCh("Rosa"),
                          ]))),
                ],
              ),
            ],
          ),
        ));
  }
}

class ChipCustomCh extends StatelessWidget {
  final String texto;
  ChipCustomCh(this.texto);

  @override
  Widget build(BuildContext context) {
    return Chip(
        avatar: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            texto[0],
            style: const TextStyle(
              color: Colors.orange,
            ),
          ),
        ),
        backgroundColor: Colors.orange,
        label: Text(
          texto,
          style: TextStyle(color: Colors.white),
        ));
  }
}

class MyTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text(
          "La Hora es: ",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
}

class Myminutes extends StatelessWidget {
  int mins;

  Myminutes({required this.mins});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: Center(
        child: Text(
          mins < 10 ? "0" + mins.toString() : mins.toString(),
          style: TextStyle(fontSize: 40.0, color: Colors.white),
        ),
      ),
    );
  }
}

class MyHours extends StatelessWidget {
  int hours;

  MyHours({required this.hours});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: Center(
        child: Text(
          hours.toString(),
          style: TextStyle(fontSize: 40.0, color: Colors.white),
        ),
      ),
    );
  }
}

class MyAmPm extends StatelessWidget {
  final bool isItAm;

  MyAmPm({required this.isItAm});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: Center(
        child: Text(
          isItAm == true ? "AM" : "PM",
          style: TextStyle(fontSize: 40.0, color: Colors.white),
        ),
      ),
    );
  }
}
