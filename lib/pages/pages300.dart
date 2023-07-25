import 'package:equations/equations.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

// import 'package:flutter_cube/flutter_cube.dart';
// import 'package:start_with_flutter_again/pages/pages20.dart';
// import 'dart:ui';

class CorrientesDeMallas extends StatefulWidget {
  const CorrientesDeMallas({super.key});

  @override
  State<CorrientesDeMallas> createState() => _CorrientesDeMallasState();
}

class _CorrientesDeMallasState extends State<CorrientesDeMallas> {
  late Object house;
  final List<List<double>> equations = const [
    [7, -2, 1],
    [14, -7, -3],
    [-7, 11, 18]
    // [14, -4, 2]
  ];

  final List<List<double>> example = const [
    [-4, 4, -3, 8, -8, 4, 2],
    [9, -3, -2, 5, 7, 5, 3],
    [-6, -3, 2, -1, 3, 7, -5],
    [2, 4, 8, -3, 7, -7, 7],
    [-3, 7, -3, -4, 5, -8, 4],
    [-9, -4, -7, -4, 2, -1, 8],
    [-8, -2, -8, -8, -4, 1, 7],
  ];

  final equations2 = const [
    [3.0, -4.0],
    [2.0, 4.0]
  ];
  TextEditingController _textoController = TextEditingController(text: "");
  bool? isChecked2x2 = false;
  bool? isChecked3x3 = false;
  bool? isChecked4x4 = false;
  bool? isChecked5x5 = false;
  bool? isChecked6x6 = false;
  bool? isChecked7x7 = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final luSolver = LUSolver(
        matrix: RealMatrix.fromData(
            rows: example.length, columns: example.length, data: example),
        knownValues: [-115, -75, 135, -10, -28, 13, 12]);
    // knownValues: [12.0, 17.0, 5.0]);
    // knownValues: [-6.0, 16.0]);
    final solutions = luSolver.solve(); // [-1, 4, 3]
    final determinant = luSolver.determinant(); // -84.0
    /* print('equations.lenght: ' +
        equations.getRange(0, example.length).length.toString());
    // print('equations.lenght: ' + equations.getRange(0, equations.length).length.toString());
    print(example.length);
    print('luSolver: ' + luSolver.toString()); */
    print(luSolver);
    print('luSolverToStringAugmented: ' + luSolver.toStringAugmented());
    print(luSolver.toStringAugmented);
    print('Solucion: ' + solutions.toString());
    print(solutions);
    for (var element in solutions) {
      print('Charly element');
      print(element);
    }
    print('I1: ' + solutions[0].round().toString());
    print(solutions);
    print('Determinante: ' + determinant.toString());
    print(determinant);
    for (var i = 0; i < solutions.length; i++) {
      print('I${i + 1}= ${solutions[i].round().toString()}\n');
    }
    return Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Corrientes de Mallas'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CheckBoxCustomized(
                    isCheckedNxN: isChecked2x2, labelTextSpan: '2 x 2'),
                CheckBoxCustomized(
                    isCheckedNxN: isChecked3x3, labelTextSpan: '3 x 3'),
                CheckBoxCustomized(
                    isCheckedNxN: isChecked4x4, labelTextSpan: '4 x 4'),
                CheckBoxCustomized(
                    isCheckedNxN: isChecked5x5, labelTextSpan: '5 x 5'),
                CheckBoxCustomized(
                    isCheckedNxN: isChecked6x6, labelTextSpan: '6 x 6'),
                CheckBoxCustomized(
                    isCheckedNxN: isChecked7x7, labelTextSpan: '7x 7'),
                TextField(
                  controller: _textoController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Ingresa Infromación",
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Color(0xFFD6D6D6),
                      filled: true),
                  cursorColor: Colors.grey,
                  style: TextStyle(color: Colors.black),
                ),

                for (var i = 0; i < solutions.length; i++)
                  Text('I${i + 1}= ${solutions[i].round().toString()}\n'),
                // _convertListItems(solutions);
              ]),
        ));
  }

  /* List<Widget> _convertListItems(List<double> solutions) {
    /* for (var i= 0; i < solutions.length; i++) 
    Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(children: [
          for (int j = 1; j <= list.elementAt(i); j++) Padding(
            padding: const EdgeInsets.only(right: 3),
            child: _itemPicture(list, i),
          ),
          SizedBox(width: 8), Text("$i")
        ],
        ),
      ],
    ),
  ) */
    late List<Widget> children;

    children = [
      for (var i = 0; i < solutions.length; i++)
        // print('I${i + 1}= ${solutions[i].round().toString()}\n');
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (var i = 0; i < solutions.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 3),
                  child:
                      Text('I${i + 1}= ${solutions[i].round().toString()}\n'),
                ),
            ],
          ),
        )

      /* for (int i in list)
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (var j = 1; j <= i; j++) Padding(
              padding: const EdgeInsets.only(right: 3),
              child: _itemPicture(list),
            ), 
          ],
        ),
      ) */
    ];

    return children;
  } */
}

class CheckBoxCustomized extends StatefulWidget {
  CheckBoxCustomized({
    super.key,
    this.isCheckedNxN,
    required this.labelTextSpan,
  });

  bool? isCheckedNxN = false;
  final String labelTextSpan;

  @override
  State<CheckBoxCustomized> createState() => _CheckBoxCustomizedState();
}

class _CheckBoxCustomizedState extends State<CheckBoxCustomized> {
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            value: widget.isCheckedNxN,
            activeColor: Color(0xff1B243E),
            onChanged: (newBool) {
              setState(() {
                widget.isCheckedNxN = newBool;
              });
            }),
        RichText(
          // textAlign: TextAlign.center,
          text: TextSpan(
            text: widget.labelTextSpan,
            style: const TextStyle(
              color: Color(0xff707070),
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

class HomePageHypersoftWorkFlow extends StatefulWidget {
  const HomePageHypersoftWorkFlow({super.key});

  @override
  State<HomePageHypersoftWorkFlow> createState() =>
      _HomePageHypersoftWorkFlowState();
}

class _HomePageHypersoftWorkFlowState extends State<HomePageHypersoftWorkFlow> {
  late int itemPage;
  late String titleBody;
  late String labelChanged;
  late Opciones _optionSelected;

  @override
  void initState() {
    setState(() {
      itemPage = 0;
      titleBody = 'ACTIVIDADES DE USUARIO';
      labelChanged = 'Seleccione';
      _optionSelected = Opciones.seleccione;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFececec),
        drawer: SafeArea(
          bottom: false,
          child: Drawer(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Container(
                color: const Color(0xFF010000),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: const Text(
                        "Hypersoft Demostraciones",
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                      ),
                    ),
                    WidgetDrawerCustomized(
                      iconData: Icons.assignment_ind,
                      // iconData: Icons.assignment_ind_outlined,
                      label: 'Nini Johanna Serje Ramos',
                      color: Colors.yellow.shade700,
                      hidenTrailing: true,
                      colorContainer: const Color(0xFF010000),
                      onTap: onTapDrawerUser,
                    ),
                    WidgetDrawerCustomized(
                      iconData: Icons.home,
                      label: 'Inicio',
                      onTap: onTapDrawerInicio,
                    ),
                    WidgetDrawerCustomized(
                        iconData: Icons.person,
                        label: 'Actividades de usuario',
                        onTap:
                            /* setState(() {
                            itemPage = 3;
                            titleBody = 'Actividades de usuario'.toUpperCase();
                            Navigator.pop(context);
                          }); */
                            onTapDrawerActividades),
                    // onTap: onTapDrawerActividades),
                    WidgetDrawerCustomized(
                      iconData: Icons.device_hub_sharp,
                      // iconData: Icons.device_hub_rounded,
                      // iconData: Icons.polyline_rounded,
                      // iconData: Icons.workspaces,
                      label: 'Ejecución de procesos',
                      onTap: onTapDrawerEjecucion,
                    ),
                    WidgetDrawerCustomized(
                      iconData: Icons.people,
                      label: 'Cola de actividades',
                      onTap: onTapDrawerCola,
                    ),
                    WidgetDrawerCustomized(
                      iconData: Icons.exit_to_app_sharp,
                      // iconData: Icons.input_outlined,
                      // iconData: Icons.logout,
                      label: 'Cerrar sesión',
                      onTap: onTapDrawerLogout,
                    ),
                    Expanded(
                      child: Container(
                        color: const Color(0xFF212121),
                      ),
                    )
                  ],
                ),
              )
              /* Container(
              color: Color(0xFF010000),
              // color: Color(0xFF212121),
              child: ListView(
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xFF010000),
                      // color: Color(0xFF212121),
                    ),
                    child: Center(
                        child: Text(
                      "Hypersoft Demostraciones",
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
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
              ), */
              ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFF010000),
          title: Image.asset(
            "assets/logos/HypersoftBlack.png",
            height: 20,
            // width: 110.0,
          ),
        ),
        body: /* itemPage == 0
            ?  */
            Column(children: [
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            height: 40,
            child: Row(
              children: [
                Text(
                  titleBody,
                  style: TextStyle(
                      color:
                          itemPage == 0 ? Colors.grey : Colors.yellow.shade700),
                ),
              ],
            ),
          ),
          itemPage == 0
              ? const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ContainerTask(
                            colorDark: Color(0xFFbd4034),
                            colorLight: Color(0xFFea4e3d),
                            iconData: Icons.access_time,
                            label: 'Vencidas',
                            counter: '0'),
                        ContainerTask(
                            colorDark: Color(0xFF82a750),
                            colorLight: Color(0xFF96c15c),
                            // iconData: Icons.ios_share,
                            // iconData: Icons.style,
                            // iconData: Icons.search,
                            // iconData: Icons.schema,
                            // iconData: Icons.event,
                            // iconData: Icons.description_sharp,
                            // iconData: Icons.supervisor_account,
                            // iconData: Icons.assignment,
                            // iconData: Icons.trending_up,
                            // iconData: Icons.cloud_upload,
                            // iconData: Icons.check,
                            // iconData: Icons.picture_as_pdf,
                            // iconData: Icons.print,
                            // iconData: Icons.today_sharp,
                            // iconData: Icons.merge_type,
                            iconData: Icons.access_time,
                            label: 'A tiempo',
                            counter: '0'),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ContainerTask(
                            colorDark: Color(0xFF586c76),
                            colorLight: Color(0xFF667b89),
                            iconData: Icons.widgets,
                            // iconData: Icons.now_widgets,
                            label: 'Pendientes',
                            counter: '0'),
                        ContainerTask(
                            colorDark: Color(0xFF586c76),
                            colorLight: Color(0xFF667b89),
                            iconData: Icons.person,
                            label: 'Pendientes por asignar',
                            counter: '0'),
                      ],
                    )
                  ],
                )
              : itemPage == 1
                  ? Text('User')
                  : itemPage == 2
                      ? Text('Inicio')
                      : itemPage == 3
                          ? Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    _navigateToScreen2();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    height: 50.0,
                                    color: const Color(0xFFFEFEFE),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                    'Seleccione una opción'),
                                                Text(
                                                  labelChanged,
                                                  style: const TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                            const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.grey,
                                              size: 16.0,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                labelChanged == 'Seleccione'
                                    ? Column(
                                        children: [
                                          const SizedBox(
                                            height: 90.0,
                                          ),
                                          Transform(
                                            alignment: Alignment.center,
                                            transform:
                                                Matrix4.rotationY(math.pi),
                                            child: Transform(
                                              alignment: Alignment.center,
                                              transform: Matrix4.rotationX(
                                                  math.pi / 4),
                                              child: const Icon(
                                                Icons.style,
                                                color: Color(0xFF808080),
                                                size: 100,
                                              ),
                                            ),
                                          ),
                                          const Text(
                                            'Seleccione una opción para ver los filtros de',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 2.0,
                                          ),
                                          const Text(
                                            'actividades de usuarios.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          )
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          ItemForActividadesDeUsuarios(
                                            labelLeading: 'Categorías',
                                            isFirstItem: true,
                                          ),
                                          ItemForActividadesDeUsuarios(
                                              labelLeading: 'Procesos'),
                                          ItemForActividadesDeUsuarios(
                                              labelLeading: 'N° Version'),
                                          ItemForActividadesDeUsuarios(
                                              labelLeading: 'Actividad'),
                                          ItemForActividadesDeUsuarios(
                                              labelLeading: 'Sistema'),
                                        ],
                                      )
                                // Text(labelChanged)
                              ],
                            )
                          : const SizedBox.shrink()
        ]));
  }

  _navigateToScreen2() async {
    final List<dynamic> result = await Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) =>
                SelectAnOption(optionForward: _optionSelected)));
    setState(() {
      _optionSelected = result[0];
      labelChanged = result[1];
    });
    print('Hizo tap');
  }

  void onTapDrawerUser(/* int item */) {
    setState(() {
      itemPage = 1;
      Navigator.pop(context);
    });
    // Navigator.of(context).pushNamedAndRemoveUntil('/main', (route) => false);
  }

  void onTapDrawerInicio(/* int item */) {
    setState(() {
      itemPage = 2;
      Navigator.pop(context);
    });
    // Navigator.of(context).pushNamedAndRemoveUntil('/main', (route) => false);
  }

  void onTapDrawerActividades(/* int item */) {
    /* setState(() {
      itemPage = 3;
      Navigator.pop(context);
    }); */
    setState(() {
      itemPage = 3;
      titleBody = 'Actividades de usuario'.toUpperCase();
      Navigator.pop(context);
    });
    // Navigator.of(context).pushNamedAndRemoveUntil('/main', (route) => false);
  }

  void onTapDrawerEjecucion(/* int item */) {
    setState(() {
      itemPage = 4;
      Navigator.pop(context);
    });
    // Navigator.of(context).pushNamedAndRemoveUntil('/main', (route) => false);
  }

  void onTapDrawerCola(/* int item */) {
    setState(() {
      itemPage = 5;
      Navigator.pop(context);
    });
    // Navigator.of(context).pushNamedAndRemoveUntil('/main', (route) => false);
  }

  void onTapDrawerLogout(/* int item */) {
    setState(() {
      itemPage = 6;
      Navigator.pop(context);
    });
    // Navigator.of(context).pushNamedAndRemoveUntil('/main', (route) => false);
  }
}

enum Opciones {
  seleccione,
  pendientes,
  completadas,
  iniciados,
  supervisadas,
  pendientesPorAsignar
}

class ItemForActividadesDeUsuarios extends StatefulWidget {
  const ItemForActividadesDeUsuarios(
      {super.key, required this.labelLeading, this.isFirstItem = false});
  final String labelLeading;
  final bool isFirstItem;

  @override
  State<ItemForActividadesDeUsuarios> createState() =>
      _ItemForActividadesDeUsuariosState();
}

class _ItemForActividadesDeUsuariosState
    extends State<ItemForActividadesDeUsuarios> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: widget.isFirstItem ? 6.0 : 0.0),
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          color: const Color(0xFFFEFEFE),
          height: 40.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.labelLeading,
                    style: TextStyle(color: Colors.black.withOpacity(0.7)),
                  ),
                  Row(
                    children: [
                      Text(
                        'Seleccione',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: 16.0,
                      )
                    ],
                  )
                ],
              ),
              Divider()
            ],
          ),
        ),
      ],
    );
  }
}

class SelectAnOption extends StatefulWidget {
  const SelectAnOption({super.key, required this.optionForward});
  final Opciones optionForward;
  @override
  State<SelectAnOption> createState() => SelectAnOptionState();
}

class SelectAnOptionState extends State<SelectAnOption> {
  final _searchController = TextEditingController();
  // final _userController = TextEditingController();
  // final _passwordController = TextEditingController();
  // final formKey = GlobalKey<FormState>();
  late Opciones _optionSelected2; // = Opciones.seleccione;
  late String _labelReturn;
  List<dynamic> devolver = [];
  @override
  void initState() {
    _optionSelected2 = widget.optionForward;
    _labelReturn = 'Seleccione';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF010000),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Opciones'),
            InkWell(
              onTap: () {
                Navigator.of(context).pop(devolver);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: Column(children: [
        Container(
          color: const Color(0xFF010000),
          padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
          height: 50.0,
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            keyboardType: TextInputType.name,
            controller: _searchController,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.grey),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.red),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.grey),
                ),
                hintText: "Buscar",
                hintStyle: TextStyle(color: Colors.grey),
                /* filled: true,
                fillColor: Colors.amber, */

                prefixIcon: Icon(
                  Icons.search,
                  size: 30.0,
                ),
                prefixIconColor: Colors.grey),
            validator: (value) {
              if (value!.isEmpty) {
                return "Introduzca Id de cuenta por favor";
              }
              bool emailValid = RegExp(r'^[0-9]+$')
                  // r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                  // r"^[a-zA-Z0-9.a-zA-Z0-9]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+")
                  // r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+")
                  .hasMatch(value);
              if (!emailValid) {
                return "Introduzca Id de cuenta correcto";
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 40.0),
        const Divider(),
        ListTile(
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Seleccione'),
              Divider(),
            ],
          ),
          leading: Radio(
              // fillColor: Colors.red,

              // focusColor: Colors.amber,
              activeColor: const Color(0xFF010000),
              // hoverColor: Colors.blue,

              // overlayColor: Colors.brown,
              value: Opciones.seleccione,
              groupValue: _optionSelected2,
              onChanged: (Opciones? optionSeleted) {
                setState(() {
                  devolver.clear();
                  _optionSelected2 = optionSeleted!;
                  devolver.add(_optionSelected2);
                  _labelReturn = 'Seleccione';
                  devolver.add(_labelReturn);
                });
              }),
        ),
        ListTile(
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mis Actividades Pendientes'),
              Divider(),
            ],
          ),
          leading: Radio(
              activeColor: const Color(0xFF010000),
              value: Opciones.pendientes,
              groupValue: _optionSelected2,
              onChanged: (Opciones? optionSeleted) {
                setState(() {
                  devolver.clear();
                  _optionSelected2 = optionSeleted!;
                  devolver.add(_optionSelected2);
                  _labelReturn = 'Mis Actividades Pendientes';
                  devolver.add(_labelReturn);
                });
              }),
        ),
        ListTile(
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mis Actividades Completadas'),
              Divider(),
            ],
          ),
          leading: Radio(
              activeColor: const Color(0xFF010000),
              value: Opciones.completadas,
              groupValue: _optionSelected2,
              onChanged: (Opciones? optionSeleted) {
                setState(() {
                  devolver.clear();
                  _optionSelected2 = optionSeleted!;
                  devolver.add(_optionSelected2);
                  _labelReturn = 'Mis Actividades Completadas';
                  devolver.add(_labelReturn);
                });
              }),
        ),
        ListTile(
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mis flujos iniciados'),
              Divider(),
            ],
          ),
          leading: Radio(
              activeColor: const Color(0xFF010000),
              value: Opciones.iniciados,
              groupValue: _optionSelected2,
              onChanged: (Opciones? optionSeleted) {
                setState(() {
                  devolver.clear();
                  _optionSelected2 = optionSeleted!;
                  devolver.add(_optionSelected2);
                  _labelReturn = 'Mis flujos iniciados';
                  devolver.add(_labelReturn);
                });
              }),
        ),
        ListTile(
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Supervisadas'),
              Divider(),
            ],
          ),
          leading: Radio(
              activeColor: const Color(0xFF010000),
              value: Opciones.supervisadas,
              groupValue: _optionSelected2,
              onChanged: (Opciones? optionSeleted) {
                setState(() {
                  devolver.clear();
                  _optionSelected2 = optionSeleted!;
                  devolver.add(_optionSelected2);
                  _labelReturn = 'Supervisadas';
                  devolver.add(_labelReturn);
                });
              }),
        ),
        ListTile(
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mis Actividades Pendiente Por Asignar'),
            ],
          ),
          leading: Radio(
              activeColor: const Color(0xFF010000),
              value: Opciones.pendientesPorAsignar,
              groupValue: _optionSelected2,
              onChanged: (Opciones? optionSeleted) {
                setState(() {
                  devolver.clear();
                  _optionSelected2 = optionSeleted!;
                  devolver.add(_optionSelected2);
                  _labelReturn = 'Mis Actividades Pendiente Por Asignar';
                  devolver.add(_labelReturn);
                });
              }),
        ),
        const Divider(),
      ]),
    );
  }
}

class ContainerTask extends StatelessWidget {
  const ContainerTask(
      {super.key,
      required this.colorDark,
      required this.colorLight,
      required this.iconData,
      required this.label,
      required this.counter});
  final Color colorDark;
  final Color colorLight;
  final IconData iconData;
  final String label;
  final String counter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60.0,
          width: MediaQuery.of(context).size.width * 0.24,
          color: colorDark,
          child: Icon(
            iconData,
            color: Colors.white,
            size: 40.0,
          ),
        ),
        Container(
          height: 60.0,
          width: MediaQuery.of(context).size.width * 0.24,
          padding: EdgeInsets.only(left: 5.0),
          color: colorLight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(color: Colors.white),
              ),
              Text(counter, style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }
}

class WidgetDrawerCustomized extends StatelessWidget {
  const WidgetDrawerCustomized(
      {super.key,
      required this.iconData,
      required this.label,
      this.color = Colors.white,
      this.colorContainer = const Color(0xFF212121),
      this.hidenTrailing = false,
      required this.onTap});
  final IconData iconData;
  final String label;
  final Color color /*  = Colors.white */;
  final Color colorContainer;
  final bool hidenTrailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.0,
        color: colorContainer,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Icon(iconData, color: color),
            const SizedBox(
              width: 12.0,
            ),
            Text(
              label,
              style: TextStyle(fontSize: 14.0, color: color),
            ),
            const Spacer(),
            hidenTrailing
                ? const SizedBox.shrink()
                : const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
          ],
        ),
      ),
    )

        /* ListTile(
      leading: Icon(iconData, color: color /* Icons.home */),
      title: Text(
        label,
        style: TextStyle(fontSize: 12.0, color: color),
      ),
      onTap: () {
        /* Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Pagina20())); */
      },
      trailing: hidenTrailing
          ? SizedBox.shrink()
          : Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
    ) */
        ;

    /* Container(
      child: Row(
        children: [

        ],
      ),
    ); */
  }
}

class LoginHypersoftWorkflow extends StatefulWidget {
  const LoginHypersoftWorkflow({super.key});

  @override
  State<LoginHypersoftWorkflow> createState() => _LoginHypersoftWorkflowState();
}

class _LoginHypersoftWorkflowState extends State<LoginHypersoftWorkflow> {
  final _idController = TextEditingController();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        backgroundColor: const Color(0xFF212121),
        title: Container(
          height: MediaQuery.of(context).size.width / 4,
          child: Image.asset(
            "assets/logos/Hypersoft.png",
            height: 20,
            // width: 110.0,
          ),
        ),
      ), */
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  // alignment: Alignment.center,
                  color: const Color(0xFF212121),
                  child: Center(
                    child: Image.asset(
                      "assets/logos/Hypersoft.png",
                      height: 50,
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      Container(
                        color: const Color(0xFFececec),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 7,
                        left: 5,
                        right: 5,
                        child: TextButton(
                          onPressed: () => {
                            // if (formKey.currentState!.validate())
                            if (_idController.text.isEmpty ||
                                _userController.text.isEmpty ||
                                _passwordController.text.isEmpty)
                              {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text(
                                          "Por favor completar todos los campos",
                                          textAlign: TextAlign.center,
                                        ),
                                        backgroundColor: Color(0xFF212121)))
                              },
                            if (_idController.text == 'pruebas' &&
                                _userController.text ==
                                    'niniserje2013@gmail.com' &&
                                _passwordController.text == 'Hypersoft2023')
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomePageHypersoftWorkFlow())),
                                print("Push Iniciar Sesión"),
                              }
                            else
                              {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text(
                                          "Usuario inválido",
                                          textAlign: TextAlign.center,
                                        ),
                                        backgroundColor: Colors.red))
                              }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            width: double.infinity,
                            color: const Color(0xFFeebf4f),
                            child: const Text(
                              'INICIAR SESIÓN',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 5,
            left: 10,
            right: 10,
            child: Container(
              height: 160.0,
              color: const Color(0xFFfefefe),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      height: 50.0,
                      child: TextFormField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.name,
                        controller: _idController,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.red),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black),
                            ),
                            hintText: "Id de cuenta",
                            icon: Icon(
                              Icons.language,
                              size: 30.0,
                            ),
                            iconColor: Colors.black),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Introduzca Id de cuenta por favor";
                          }
                          bool emailValid = RegExp(r'^[0-9]+$')
                              // r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                              // r"^[a-zA-Z0-9.a-zA-Z0-9]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+")
                              // r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return "Introduzca Id de cuenta correcto";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      height: 50.0,
                      child: TextFormField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        controller: _userController,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.red),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black),
                            ),
                            /* border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.green,
                              width: 3.0,
                            )), */
                            hintText: "Ingrese usuario",
                            icon: Icon(
                              Icons.account_circle_outlined,
                              size: 30.0,
                            ),
                            iconColor: Colors.black),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Introduzca nombre por favor";
                          }
                          bool emailValid = RegExp(r'^[a-z A-Z 0-9]+$')
                              // r"^[a-zA-Z0-9.a-zA-Z0-9]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+")
                              // r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return "Introduzca nombre correcto";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      height: 50.0,
                      child: TextFormField(
                        // obscureText: true,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        controller: _passwordController,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.red),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black),
                            ),
                            hintText: "Ingrese contraseña",
                            icon: Icon(
                              Icons.lock_outline,
                              size: 30.0,
                            ),
                            iconColor: Colors.black),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Introduzca correo electrónico por favor";
                          }
                          bool emailValid = RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                              // r"^[a-zA-Z0-9.a-zA-Z0-9]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+")
                              // r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return "Correo electrónico inválido";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
