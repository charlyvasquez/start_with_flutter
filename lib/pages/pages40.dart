import 'dart:math';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:start_with_flutter_again/utils/app_layout.dart';
import 'package:start_with_flutter_again/utils/app_styles.dart';
import 'package:start_with_flutter_again/widgets/thick_container.dart';
import 'package:video_player/video_player.dart';

class Pagina40 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const FichaProducto(
        nombre: "Harina Pan",
        descripcion: "Harina precocida",
        precio: 6,
        imagen: "assets/icon/icon.png");
  }
}

class FichaProducto extends StatelessWidget {
  final String nombre;
  final String descripcion;
  final int precio;
  final String imagen;

  /*  const FichaProducto(
      {required this.nombre,
      required this.descripcion,
      required this.precio,
      required this.imagen}); */
  final estilo = const TextStyle(fontSize: 10.0);

  const FichaProducto(
      {Key? key,
      required this.nombre,
      required this.descripcion,
      required this.precio,
      required this.imagen})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        // margin: EdgeInsets.all(2.0),
        child: Container(
          padding: const EdgeInsets.all(0.0),
          color: Colors.transparent,
          height: 120.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 100.0, width: 100.0, child: Image.asset(imagen)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Artículo: " + nombre,
                    style: estilo,
                  ),
                  Text(
                    "Descripción: " + descripcion,
                    style: estilo,
                  ),
                  Text(
                    "Precio: " + precio.toString(),
                    style: estilo,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        final snackBar = SnackBar(
            elevation: 5.0,
            backgroundColor: Colors.grey,
            // content: Text(nombre));
            content: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 30.0, width: 30.0, child: Image.asset(imagen)),
                Text(nombre),
              ],
            ));

        ScaffoldMessenger.maybeOf(context)?.showSnackBar(snackBar);
        // Scaffold.of(context).showSnackBar(snackBar); //deprecated
      },
    );
    /*   Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text("ListView Página40"),
        ),
        body: Container(
          padding: const EdgeInsets.all(18.0),
          color: Colors.grey,
          height: 120.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  height: 100.0, width: 100.0, child: Image.asset(imagen)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Artículo: " + nombre,
                    style: estilo,
                  ),
                  Text(
                    "Descripción: " + descripcion,
                    style: estilo,
                  ),
                  Text(
                    "Precio: " + precio.toString(),
                    style: estilo,
                  ),
                ],
              ),
            ],
          ),
        )
        );
   */
  }
}

class ListadoProductos extends StatelessWidget {
  // const ListadoProductos({Key? key}) : super(key: key);
  final String titulo;

  const ListadoProductos({Key? key, required this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titulo),
        ),
        body: ListView(
          children: <Widget>[
            const Center(child: Text("Listado de Productos")),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailArticle(
                              article: FichaProducto(
                                  nombre: "Harina de Trigo",
                                  descripcion: "Harina para tortas",
                                  precio: 6,
                                  imagen: "assets/icon/icon.png"))));
                },
                child: Center(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red),
                        child: Text("Pasar a vista de detalles")))),
            SizedBox(
              height: 5.0,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailArticle(
                              article: FichaProducto(
                                  nombre: "Harina de Trigo",
                                  descripcion: "Harina para tortas",
                                  precio: 6,
                                  imagen: "assets/icon/icon.png")),
                          fullscreenDialog: true));
                },
                child: Center(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red),
                        child: Text("fullscreenDialog")))),
            const FichaProducto(
                nombre: "Harina de Trigo",
                descripcion: "Harina para tortas",
                precio: 6,
                imagen: "assets/icon/icon.png"),
            const FichaProducto(
                nombre: "Harina Doña María",
                descripcion: "Harina para pan",
                precio: 6,
                imagen: "assets/icon/icon.png"),
            const FichaProducto(
                nombre: "Harina Reinarepa",
                descripcion: "Harina para el perro",
                precio: 6,
                imagen: "assets/icon/icon.png"),
          ],
        ));
  }
}

class DetailArticle extends StatelessWidget {
  final FichaProducto article;

  const DetailArticle({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.nombre)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                article.imagen,
                scale: 3,
              ),
              Text(article.descripcion),
            ],
          ),
        ),
      ),
    );
  }
}

class Pagina41 extends StatefulWidget {
  // Pagina41({Key? key}) : super(key: key);

  @override
  State<Pagina41> createState() => _Pagina41State();
}

class _Pagina41State extends State<Pagina41> {
  final items = List<String>.generate(20, (index) => 'Tarea ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListaTareas && Dismissible Pag 41'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return Dismissible(
            key: Key(item),
            child: ListTile(
              title: Text('$item'),
              leading: Icon(Icons.android),
              subtitle: Row(
                children: [
                  Icon(Icons.menu),
                  Text('$item'),
                ],
              ),
            ),
            background: Container(
              color: Colors.red,
            ),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
              ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(
                content: Text('$item eliminada'),
              ));
            },
          );
        },
      ),
    );
  }
}

class Pagina42 extends StatefulWidget {
  // Pagina41({Key? key}) : super(key: key);

  @override
  State<Pagina42> createState() => _Pagina42State();
}

class _Pagina42State extends State<Pagina42> {
  // final items = List<String>.generate(20, (index) => 'Tarea ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Scroll Horiz Pag 42'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                color: Colors.blue,
                height: 50,
                width: 60,
                child: Text('Objetos'),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      color: Colors.blue,
                      height: 150,
                      width: 60,
                      child: Text('Objetos'),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          color: Colors.blue,
                          height: 50,
                          width: 60,
                          child: Text('Objeto 1'),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          color: Colors.blue,
                          height: 50,
                          width: 60,
                          child: Text('Objeto 2'),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          color: Colors.blue,
                          height: 50,
                          width: 60,
                          child: Text('Objeto 3'),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          color: Colors.blue,
                          height: 50,
                          width: 60,
                          child: Text('Objeto 4'),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          color: Colors.blue,
                          height: 50,
                          width: 60,
                          child: Text('Objeto 5'),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          color: Colors.blue,
                          height: 50,
                          width: 60,
                          child: Text('Objeto 6'),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          color: Colors.blue,
                          height: 50,
                          width: 60,
                          child: Text('Objeto 7'),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          color: Colors.blue,
                          height: 50,
                          width: 60,
                          child: Text('Objeto 8'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class Pagina43 extends StatefulWidget {
  // Pagina43({Key? key}) : super(key: key);

  @override
  State<Pagina43> createState() => _Pagina43State();
}

class _Pagina43State extends State<Pagina43> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DropDown AppBar, Page_43"),
          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                  iconTheme: IconThemeData(color: Colors.red),
                  dividerColor: Colors.white,
                  textTheme: TextTheme().apply(bodyColor: Colors.white)),
              child: PopupMenuButton<int>(
                  icon: Icon(
                    Icons.more_vert, /*  color: Colors.white */
                  ),
                  color: Colors.orange,
                  onSelected: (item) => onSelectted(context, item),
                  itemBuilder: (context) => [
                        const PopupMenuItem<int>(
                          value: 0,
                          child: Text("Archivos, enlaces y docs"),
                        ),
                        PopupMenuDivider(),
                        const PopupMenuItem<int>(
                          value: 1,
                          child: Text("Buscar"),
                        ),
                        PopupMenuDivider(),
                        const PopupMenuItem<int>(
                          value: 2,
                          child: Text("Silenciar notificaciones"),
                        ),
                        PopupMenuDivider(),
                        const PopupMenuItem<int>(
                          value: 3,
                          child: Text("Mensajes temporales"),
                        ),
                        const PopupMenuItem<int>(
                          value: 4,
                          child: Text("Fondo de pantalla"),
                        ),
                        const PopupMenuItem<int>(
                          value: 5,
                          child: Text("Más"),
                        ),
                        PopupMenuItem<int>(
                          value: 6,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.logout,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text("Sign Out"),
                            ],
                          ),
                        )
                      ]),
            )
          ],
        ),
        body: Container());
  }

  void onSelectted(BuildContext context, int item) {
    switch (item) {
      case 0:
        print("Clicked Archivos, enlaces y docs");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AuxiliarPage(
                  texto: "Archivos, enlaces y docs",
                  color: Colors.red,
                )));
        break;
      case 1:
        print("Clicked Buscar");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AuxiliarPage(
                  texto: "Buscar",
                  color: Colors.green,
                )));
        break;
      case 2:
        print("Clicked Silenciar notificaciones");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AuxiliarPage(
                  texto: "Silenciar notificaciones",
                  color: Colors.grey,
                )));
        break;
      case 3:
        print("Clicked Mensajes temporales");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AuxiliarPage(
                  texto: "Mensajes temporales",
                  color: Colors.brown,
                )));
        break;
      case 4:
        print("Clicked Fondo de pantalla");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AuxiliarPage(
                  texto: "Fondo de pantalla",
                  color: Colors.black,
                )));
        break;
      case 5:
        print("Más");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AuxiliarPage(
                  texto: "Más",
                  color: Colors.orange,
                )));
        break;
      case 6:
        print("Sign Out");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => const AuxiliarPage(
                    texto: "Sign Out", color: Colors.purple)),
            (route) => false);
        break;
      default:
    }
  }
}

class AuxiliarPage extends StatelessWidget {
  final String texto;
  final Color color;

  const AuxiliarPage({required this.texto, required this.color});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(texto),
        backgroundColor: color,
      ),
    );
  }
}

class Pagina44 extends StatefulWidget {
  // Pagina44({Key? key}) : super(key: key);

  @override
  State<Pagina44> createState() => _Pagina44State();
}

class _Pagina44State extends State<Pagina44> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropDown AppBar2, Page_44"),
        actions: [
          PopupMenuButton<MenuItemDynamic>(
              color: Colors.red,
              onSelected: (item) => onSelectted(context, item),
              itemBuilder: (context) => [
                    ...MenuIntemsDynamic.itemsFirst.map(buildItem).toList(),
                    PopupMenuDivider(),
                    ...MenuIntemsDynamic.itemsSecond.map(buildItem).toList()

                    /* const PopupMenuItem<int>(
                          value: 0,
                          child: Text("Archivos, enlaces y docs"),
                        ),
                        PopupMenuDivider(),
                        const PopupMenuItem<int>(
                          value: 1,
                          child: Text("Buscar"),
                        ), */
                  ])
        ],
      ),
    );
  }

  PopupMenuItem<MenuItemDynamic> buildItem(MenuItemDynamic itemDynamic) =>
      PopupMenuItem<MenuItemDynamic>(
          value: itemDynamic,
          child: Row(
            children: [
              Icon(
                itemDynamic.icon,
                color: Colors.black,
                size: 20,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(itemDynamic.text),
            ],
          ));

  void onSelectted(BuildContext context, MenuItemDynamic item) {
    switch (item) {
      case MenuIntemsDynamic.itemSettings:
        print("Clicked itemSettings");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AuxiliarPage(
                  texto: "itemSettings",
                  color: Colors.red,
                )));
        break;
      case MenuIntemsDynamic.itemShare:
        print("Clicked itemShare");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AuxiliarPage(
                  texto: "itemShare",
                  color: Colors.green,
                )));
        break;
      case MenuIntemsDynamic.itemSignOut:
        print("Clicked itemSignOut");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AuxiliarPage(
                  texto: "itemSignOut",
                  color: Colors.grey,
                )));
        break;

      default:
    }
  }
}

class MenuItemDynamic {
  final String text;
  final IconData icon;

  const MenuItemDynamic(this.text, this.icon);
}

class MenuIntemsDynamic {
  static const List<MenuItemDynamic> itemsFirst = [itemSettings, itemShare];
  static const List<MenuItemDynamic> itemsSecond = [itemSignOut];

  static const itemSettings = MenuItemDynamic("Settings", Icons.settings);
  static const itemShare = MenuItemDynamic("Share", Icons.share);
  static const itemSignOut = MenuItemDynamic("SignOut", Icons.logout);
}

class Pagina45 extends StatefulWidget {
  Pagina45({Key? key}) : super(key: key);

  @override
  State<Pagina45> createState() => _Pagina45State();
}

class _Pagina45State extends State<Pagina45> {
  late List<Tarea> listaTareas;

  @override
  void initState() {
    // listaTareas == listaTareas;
    setState(() {
      listaTareas = [Tarea("Test1", "activado")];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /* setState(() {
      if (listaTareas == null) {
        listaTareas = [];
      }
    }); */
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tareas"),
      ),
      body: ListView.builder(
        itemCount: listaTareas.length,
        itemBuilder: (BuildContext context, int index) {
          final item = listaTareas[index];
          return GestureDetector(
              onTap: () {
                _editaTarea(item, this, index);
              },
              child: Dismissible(
                key: Key(item.nombre),
                onDismissed: (direction) {
                  eliminar(index);
                },
                child: Card(
                  margin: EdgeInsets.all(1.0),
                  elevation: 2.0,
                  child: FichaTarea(titulo: item.nombre, estado: item.estado),
                ),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Añadir Tarea",
        child: Icon(Icons.add),
        onPressed: () {
          _crearTarea(this);
        },
      ),
    );
  }

  void _crearTarea(_Pagina45State obj) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                NuevaTarea(Tarea("", ""), "Añadir Tarea", obj)));
    actualizarListView();
  }

  void _editaTarea(Tarea tarea, _Pagina45State obj, int posicion) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                NuevaTarea(tarea, "Editar Tarea", obj, posicion)));
    actualizarListView();
  }

  void eliminar(int posicion) {
    this.listaTareas.remove(posicion);
    actualizarListView();
  }

  void actualizarListView() {
    setState(() {
      this.listaTareas = listaTareas;
    });
  }
}

class Tarea {
  String _nombre, _estado;

  Tarea(this._nombre, this._estado);

  String get nombre => _nombre;
  String get estado => _estado;
  set nombre(String nuevoNombre) {
    if (nuevoNombre.length <= 255) {
      this._nombre = nuevoNombre;
    }
  }

  set estado(String nuevoEstado) => this.estado = nuevoEstado;
}

class FichaTarea extends StatelessWidget {
  final String titulo;
  final String estado;

  const FichaTarea({Key? key, required this.titulo, required this.estado})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  titulo,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  estado,
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).primaryColor,
                      fontSize: 15),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NuevaTarea extends StatefulWidget {
  final Tarea tarea;
  final String appBarTitle;
  final _Pagina45State pagina45State;
  final int posicion;
  NuevaTarea(this.tarea, this.appBarTitle, this.pagina45State,
      [this.posicion = -1]);

  @override
  State<NuevaTarea> createState() => _NuevaTareaState(
      this.tarea, this.appBarTitle, this.pagina45State, this.posicion);
}

class _NuevaTareaState extends State<NuevaTarea> {
  Tarea tarea;
  String titulo;
  _Pagina45State pagina45State;
  int posicion;
  bool marcado = false;
  _NuevaTareaState(this.tarea, this.titulo, this.pagina45State, this.posicion);

  TextEditingController tareaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    tareaController.text = tarea.nombre;
    return Scaffold(
      key: GlobalKey<ScaffoldState>(),
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.close),
          onTap: () {
            Navigator.pop(context);
            pagina45State.actualizarListView();
          },
        ),
        title: Text(titulo),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: _estaEditando()
                ? CheckboxListTile(
                    title: Text("Completada"),
                    value: marcado,
                    onChanged: (valor) {
                      setState(() {
                        marcado = valor!;
                      });
                    })
                : Container(
                    height: 2.0,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: tareaController,
              decoration: InputDecoration(
                  labelText: "Tarea", hintText: "Ej. Aprender Flutter"),
              onChanged: (value) {
                actualizaTarea();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Text("Guardar"),
              onPressed: () {
                setState(() {
                  _guardar();
                });
              },
            ),
          )
        ],
      ),
    );
  }

  void _guardar() {
    tarea.estado = "";
    if (_estaEditando()) {
      if (marcado) {
        tarea.estado = "Completada";
      }
    }
    tarea.nombre = tareaController.text;
    if (_comprobarNoNull()) {
      if (!_estaEditando())
        pagina45State.listaTareas.add(tarea);
      else
        pagina45State.listaTareas[posicion] = tarea;
      pagina45State.actualizarListView();
      Navigator.pop(context);
      mostrarSnackBar("Tarea guardada correctamente");
    }
  }

  bool _comprobarNoNull() {
    bool res = true;
    if (tareaController.text.isEmpty) {
      mostrarSnackBar("La tarea es obligatoria");
      res = false;
    }
    return res;
  }

  void mostrarSnackBar(String mensaje) {
    final snackBar = SnackBar(
        duration: const Duration(seconds: 1, milliseconds: 500),
        elevation: 5.0,
        backgroundColor: Colors.grey,
        content: Text(mensaje));

    ScaffoldMessenger.maybeOf(context)?.showSnackBar(snackBar);
  }

  void actualizaTarea() {
    tarea.nombre = tareaController.text;
  }

  bool _estaEditando() {
    bool editando = true;
    if (posicion == -1) editando = false;
    return editando;
  }
}

class Pagina46 extends StatefulWidget {
  @override
  State<Pagina46> createState() => _Pagina46State();
}

class _Pagina46State extends State<Pagina46> with WidgetsBindingObserver {
  late Future<String> permissionStatusFuture;

  var permGranted = "granted";
  var permDenied = "denied";
  var permUnknown = "unknown";
  var permProvisional = "provisional";

  @override
  void initState() {
    super.initState();
    // set up the notification permissions class
    // set up the future to fetch the notification data
    permissionStatusFuture = getCheckNotificationPermStatus();
    // With this, we will be able to check if the permission is granted or not
    // when returning to the application
    // WidgetsBinding.instance?.addObserver(this);
    WidgetsBinding.instance.addObserver(this);
  }

  /// When the application has a resumed status, check for the permission
  /// status
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {
        permissionStatusFuture = getCheckNotificationPermStatus();
      });
    }
  }

  /// Checks the notification permission status
  Future<String> getCheckNotificationPermStatus() {
    return NotificationPermissions.getNotificationPermissionStatus()
        .then((status) {
      switch (status) {
        case PermissionStatus.denied:
          return permDenied;
        case PermissionStatus.granted:
          return permGranted;
        case PermissionStatus.unknown:
          return permUnknown;
        case PermissionStatus.provisional:
          return permProvisional;
        /* default:
          return null; */
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Notification Permissions'),
        ),
        body: Center(
            child: Container(
          margin: EdgeInsets.all(20),
          child: FutureBuilder(
            future: permissionStatusFuture,
            builder: (context, snapshot) {
              // if we are waiting for data, show a progress indicator
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return Text('error while retrieving status: ${snapshot.error}');
              }

              if (snapshot.hasData) {
                var textWidget = Text(
                  "The permission status is ${snapshot.data}",
                  style: TextStyle(fontSize: 20),
                  softWrap: true,
                  textAlign: TextAlign.center,
                );
                // The permission is granted, then just show the text
                if (snapshot.data == permGranted) {
                  return textWidget;
                }

                // else, we'll show a button to ask for the permissions
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    textWidget,
                    SizedBox(
                      height: 20,
                    ),
                    // FlatButton(
                    TextButton(
                      // color: Colors.amber,
                      child: Text("Ask for notification status".toUpperCase()),
                      onPressed: () {
                        // show the dialog/open settings screen
                        NotificationPermissions.requestNotificationPermissions(
                                iosSettings: const NotificationSettingsIos(
                                    sound: true, badge: true, alert: true))
                            .then((_) {
                          // when finished, check the permission status
                          setState(() {
                            permissionStatusFuture =
                                getCheckNotificationPermStatus();
                          });
                        });
                      },
                    )
                  ],
                );
              }
              return Text("No permission status yet");
            },
          ),
        )),
      ),
    );
  }
}

class Pagina47 extends StatelessWidget {
  const Pagina47({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: const Text("FittedBox Page 47"),
        ),
        body: Stack(
          children: [
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              children: [
                SizedBox(
                  height: 40,
                ),
                FittedBox(
                  child: Container(
                    padding: EdgeInsets.all(3.5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFFF4F6FD)),
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(vertical: 7.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(50.0)),
                                color: Colors.white),
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.flight_takeoff_rounded),
                                Text("Airline Tickets"),
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.symmetric(vertical: 7.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(50.0)),
                                color: Colors.grey.shade200),
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.local_airport_rounded),
                                Transform.rotate(
                                    angle: 1.0,
                                    child: Icon(Icons.local_airport_rounded)),
                                Transform.rotate(
                                    angle: 1.5,
                                    child: Icon(Icons.local_airport_rounded)),
                                Transform.rotate(
                                    angle: -1.6,
                                    child: Icon(Icons.local_airport_rounded)),
                                Text("Hotels"),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                    padding: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border:
                            Border.all(width: 18.0, color: Color(0xFF189999)))),
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 200.0,
                          width: MediaQuery.of(context).size.width * 0.45,
                          decoration: BoxDecoration(
                              color: Color(0xFF3AB8B8),
                              borderRadius: BorderRadius.circular(18.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Esto es un container\ncon un circulo\ndesplazado",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "yo ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14)),
                                TextSpan(
                                    text: "Creo ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                TextSpan(
                                    text: "en ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                                TextSpan(
                                    text: "DIOS",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20))
                              ]))
                            ],
                          ),
                        ),
                        Positioned(
                          right: -40,
                          top: -40,
                          child: Container(
                              padding: EdgeInsets.all(30.0),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 18.0, color: Color(0xFF189999)))),
                        ),
                        /* Column(
                          children: [
                            SizedBox(
                                height: 20.0,
                                width: 10.0,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0)),
                                  ),
                                )),
                          ],
                        ), */
                        SizedBox(
                          // color: Colors.black,
                          height: 200.0,
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      SizedBox(
                                          height: 20.0,
                                          width: 10.0,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(10.0),
                                                  bottomRight:
                                                      Radius.circular(10.0)),
                                            ),
                                          )),
                                      SizedBox(
                                          height: 20.0,
                                          width: 10.0,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: Colors.yellow,
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  bottomLeft:
                                                      Radius.circular(10.0)),
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  SizedBox(
                                      height: 10.0,
                                      width: 20.0,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10.0),
                                              bottomRight:
                                                  Radius.circular(10.0)),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Transform.rotate(
                  angle: 0.5, //-math.pi / 12.0, 0 a 6.283 da la vuelta completa
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: const Color(0xFFE8581C),
                      child: const Text('Apartment for rent!'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  // width: 100,
                  child: Column(
                    children: [
                      Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.red,
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: /* NetworkImage(url)  */ AssetImage(
                                  "assets/icon/icon.png",
                                ))
                            /* Image.asset(
                          "assets/icon/icon.png",
                        ), */
                            ),
                        /* child: Image.asset(
                          "assets/icon/icon.png",
                          // scale: 10,
                        ), */
                      ),
                      Text("Container BorderRadius")
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        "assets/icon/icon.png",
                        // height: 100.0,
                        // width: 10.0,
                        scale: 4,
                      ),
                    ),
                    Text("ClipRRect BorderRadius")
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.red, width: 2)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        "assets/icon/icon.png",
                        // height: 100.0,
                        // width: 10.0,
                        scale: 6,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xFFFEF4F3)),
                          child: Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blueGrey),
                                  child: Icon(
                                    Icons.android,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text("Charly Vasquez")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                ),
              ],
            ),
            Positioned(
              left: 20.0,
              top: 300.0,
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 2)),
                child: CircleAvatar(
                  maxRadius: 4,
                  backgroundColor: Colors.greenAccent,
                ),
              ),
            ),
            Positioned(
              right: 20.0,
              top: 300.0,
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 2)),
                child: CircleAvatar(
                  maxRadius: 4,
                  backgroundColor: Colors.greenAccent,
                ),
              ),
            ),
          ],
        ));
  }
}

class Pagina48 extends StatefulWidget {
  Pagina48({Key? key}) : super(key: key);

  @override
  State<Pagina48> createState() => _Pagina48State();
}

class _Pagina48State extends State<Pagina48> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = [
    HomeTest(),
    SearchTestOther(),
    // const Text("Tickets"),
    TicketsTest(),
    // const Text("Profile"),
    ProfileTest()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ticket Booking App Page 48"),
      ),
      backgroundColor: Styles.bgColor,
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Color(0xFF526480),
        type: BottomNavigationBarType.fixed,
        items: const [
          // BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
              label: "Home"),
          BottomNavigationBarItem(
              // icon: Icon(Icons.search),
              icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
              label: "Search"),
          BottomNavigationBarItem(
              // icon: Icon(Icons.airplane_ticket),
              icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
              label: "Ticket"),
          BottomNavigationBarItem(
              // icon: Icon(Icons.person),
              icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              label: "Profile"),
        ],
      ),
    );
  }
}

class HomeTest extends StatelessWidget {
  const HomeTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Home"),
              SizedBox(height: 100),
              Text("Home2"),
              SizedBox(height: 100),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TicketView(),
                    TicketView(),
                  ],
                ),
              ),
              Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.red,
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: /* NetworkImage(url)  */ AssetImage(
                            "assets/icon/icon.png",
                          ))),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                    child: Center(
                      child: Text("ChV",
                          style: Styles.headLineStyle1
                              .copyWith(color: Styles.blueColor)),
                    ),
                  )
                  // scale: 10,

                  ),
            ],
          ),
        )
      ],
    ));
  }
}

class TicketView extends StatelessWidget {
  const TicketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = AppLayout.getSize(context);
    return SizedBox(
        width: _size.width * 0.8,
        height: 200.0,
        child: Container(
          margin: EdgeInsets.only(left: 16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Styles.blueColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(21.0),
                        topRight: Radius.circular(21.0))),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "NYC",
                          style: Styles.headLineStyle1
                              .copyWith(color: Colors.white),
                        ),
                        Expanded(child: Container()),
                        ThickContainer(),
                        Expanded(
                            child: Stack(
                          children: [
                            SizedBox(
                              height: 24.0,
                              child: LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  print(
                                      "The width is ${constraints.constrainWidth()}");
                                  return Flex(
                                      direction: Axis.horizontal,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          (constraints.constrainWidth() / 6)
                                              .floor(),
                                          (index) => SizedBox(
                                                width: 3.0,
                                                height: 1.0,
                                                child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white)),
                                              )));
                                },
                              ),
                            ),
                            /* Icon(Icons.local_airport_rounded,
                                color: Colors.white), */
                            Center(
                              child: Transform.rotate(
                                  angle: 1.5,
                                  child: Icon(Icons.local_airport_rounded,
                                      color: Colors.white)),
                            ),
                            /* Icon(Icons.local_airport_rounded,
                                color: Colors.white), */
                          ],
                        )),
                        ThickContainer(),
                        Expanded(child: Container()),
                        // Spacer(),
                        Text(
                          "LDN",
                          style: Styles.headLineStyle1
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            "New-York",
                            style: Styles.headLineStyle1
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        Text("Charly",
                            style:
                                Styles.textStyle.copyWith(color: Colors.white)),
                        SizedBox(
                          width: 100,
                          child: Text(
                            "London",
                            textAlign: TextAlign.end,
                            style: Styles.headLineStyle1
                                .copyWith(color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                color: Color(0xFFF37B67),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                        height: 20.0,
                        width: 10.0,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                )))),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              (constraints.constrainWidth() / 15).floor(),
                              (index) => const SizedBox(
                                  width: 5.0,
                                  height: 1.0,
                                  child: DecoratedBox(
                                      decoration:
                                          BoxDecoration(color: Colors.white)))),
                        );
                      }),
                    )),
                    const SizedBox(
                        height: 20.0,
                        width: 10.0,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                )))),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Styles.blueColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(21.0),
                        bottomRight: Radius.circular(21.0))),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "NYC",
                          style: Styles.headLineStyle1
                              .copyWith(color: Colors.white),
                        ),
                        Expanded(child: Container()),
                        ThickContainer(),
                        Expanded(
                            child: Stack(
                          children: [
                            SizedBox(
                              height: 24.0,
                              child: LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  print(
                                      "The width is ${constraints.constrainWidth()}");
                                  return Flex(
                                      direction: Axis.horizontal,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          (constraints.constrainWidth() / 6)
                                              .floor(),
                                          (index) => SizedBox(
                                                width: 3.0,
                                                height: 1.0,
                                                child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white)),
                                              )));
                                },
                              ),
                            ),
                            /* Icon(Icons.local_airport_rounded,
                                color: Colors.white), */
                            Center(
                              child: Transform.rotate(
                                  angle: 1.5,
                                  child: Icon(Icons.local_airport_rounded,
                                      color: Colors.white)),
                            ),
                            /* Icon(Icons.local_airport_rounded,
                                color: Colors.white), */
                          ],
                        )),
                        ThickContainer(),
                        Expanded(child: Container()),
                        // Spacer(),
                        Text(
                          "LDN",
                          style: Styles.headLineStyle1
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            "New-York",
                            style: Styles.headLineStyle1
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        Text("Charly",
                            style:
                                Styles.textStyle.copyWith(color: Colors.white)),
                        SizedBox(
                          width: 100,
                          child: Text(
                            "London",
                            textAlign: TextAlign.end,
                            style: Styles.headLineStyle1
                                .copyWith(color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class SearchTestOther extends StatelessWidget {
  const SearchTestOther({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Charly",
                      style: Styles.headLineStyle.copyWith(color: Colors.black),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  width: _size.width,
                  height: 120.0,
                  decoration: BoxDecoration(
                      // color: Colors.red,
                      gradient: LinearGradient(colors: [
                        AppColor.gradientFirst,
                        AppColor.gradientSecond,
                      ]),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        topRight: Radius.circular(80.0),
                        bottomRight: Radius.circular(10.0),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  width: _size.width,
                  height: 120.0,
                  decoration: BoxDecoration(
                      // color: Colors.red,
                      gradient: LinearGradient(
                          colors: [
                            AppColor.gradientFirst,
                            AppColor.gradientSecond,
                          ],
                          begin: FractionalOffset(0.0, 0.4),
                          end: Alignment.topRight),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        topRight: Radius.circular(80.0),
                        bottomRight: Radius.circular(10.0),
                      )),
                ),
                Container(
                  // alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 10.0),
                  padding: EdgeInsets.only(bottom: 20.0),
                  width: _size.width,
                  height: 220.0,
                  decoration: BoxDecoration(
                      // color: Colors.red,
                      gradient: LinearGradient(
                          colors: [
                            AppColor.gradientFirst.withOpacity(0.8),
                            AppColor.gradientSecond.withOpacity(0.9),
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        topRight: Radius.circular(80.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(5, 10),
                            color: AppColor.gradientSecond,
                            blurRadius: 10.0)
                      ]),
                  child: Center(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("Charly"))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}

class TicketsTest extends StatefulWidget {
  TicketsTest({Key? key}) : super(key: key);

  @override
  State<TicketsTest> createState() => _TicketsTestState();
}

class _TicketsTestState extends State<TicketsTest> {
  // late VideoPlayerController _controller;
  VideoPlayerController? _controller; // = VideoPlayerController.network("");
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;

  /* @override
  void initState() {
    _controller = VideoPlayerController.network(
        "https://cmsdimayor.s3.amazonaws.com/golesfecha13dim.mp4");
    // "https://www.youtube.com/watch?v=gh7WzMTsMoQ");
    super.initState();
  } */
  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  _playArea == false
                      ? Container(
                          width: double.maxFinite, //300.0,
                          height: 300.0,
                          color: Colors.redAccent,
                          /* child: Column(
                      children: [
                        Container(
                            height: 100.0,
                            color: Colors.green,
                            child: Row(
                              children: [
                                Text("Charly"),
                              ],
                            )),
                        _playView(context),
                      ],
                    ), */
                        )
                      : Container(
                          width: double.maxFinite, //300.0,
                          // height: 400.0,
                          color: Colors.blueAccent,
                          child: Column(
                            children: [
                              /* Container(
                                  height: 100.0,
                                  color: Colors.green,
                                  child: Row(
                                    children: [
                                      Text("Charly"),
                                    ],
                                  )), */
                              _playView(context),
                              _controlView(context),
                              _heightView(10.0),
                              _circleAvatar(),
                              _dividerView(5, 5),
                              _heightView(10.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                      radius: 60.0,
                                      backgroundColor: Colors.red,
                                      child: _circleAvatar()),
                                  _circleContainer(),
                                  _circleAvatarNetwork(),
                                ],
                              ),
                              _heightView(10.0),
                              _heightView(10.0),
                            ],
                          ),
                        ),
                  botonTapVideo(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _heightView(double height) {
    return SizedBox(
      height: height,
    );
  }

  _dividerView(double height, double thickness) {
    return Divider(
      height: height,
      thickness: thickness,
    );
  }

  Widget _circleContainer() {
    return Container(
      height: 150,
      width: 150,
      color: Colors.white,
      padding: const EdgeInsets.all(30),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade600,
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(4, 4)),
              const BoxShadow(
                  color: Colors.white,
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(-4, -4)),
            ]),
        child: const Center(
          child: Text(
            "3D Shadow",
            style: TextStyle(fontSize: 10),
          ),
        ),
      ),
    );
  }

  Widget _circleAvatarNetwork() {
    return const CircleAvatar(
      backgroundImage: NetworkImage("https://via.placeholder.com/150"),
      radius: 50.0,
    );
  }

  Widget _circleAvatar() {
    return const CircleAvatar(
      backgroundImage: AssetImage("assets/icon/icon.png"),
      radius: 50.0,
    );
  }

  botonTapVideo(context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.lightGreenAccent,
            onPrimary: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
        onPressed: () {
          _onTapVideo();
          setState(() {
            if (_playArea == false) {
              _playArea = true;
            }
          });
        },
        child: const Text(
          "Ticket Booking App Page 48",
          style: TextStyle(fontFamily: "Avenir"),
        ));
  }

  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    final controller = _controller;
    if (controller == null) {
      debugPrint("Controller is null");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("Controller can not be initialized");
      return;
    }
    // _duration ??= _controller?.value.duration;
    if (_duration == null) {
      _duration = _controller?.value.duration;
    }
    var duration = _duration;
    if (duration == null) return;

    var position = await controller.position;
    _position = position;

    final playing = controller.value.isPlaying;
    if (playing) {
      if (_disposed) return;
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() /
            duration.inMilliseconds.ceilToDouble();
      });
    }
    _isPlaying = playing;
  }

  _onTapVideo() async {
    final controller = /* _controller */ VideoPlayerController
        .network("https://cmsdimayor.s3.amazonaws.com/golesfecha13dim.mp4");
    // "https://www.youtube.com/watch?v=gh7WzMTsMoQ");
    final old = _controller;
    _controller = controller;
    if (_controller != null) {
      old?.removeListener(_onControllerUpdate);
      old?.pause();
    }
    setState(() {});
    controller
      ..initialize().then((_) {
        old?.dispose();
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {});
      });
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return const AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
              child: Text("Preparing...",
                  style: TextStyle(fontSize: 20, color: Colors.white60))));
    }
  }

  String convertTwo(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  Widget _sliderView(BuildContext context) {
    return SliderTheme(
        data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.red[700],
            inactiveTrackColor: Colors.red[100],
            trackShape: RoundedRectSliderTrackShape(),
            trackHeight: 2.0,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
            thumbColor: Colors.redAccent,
            overlayColor: Colors.red.withAlpha(32),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
            tickMarkShape: RoundSliderTickMarkShape(),
            activeTickMarkColor: Colors.red[700],
            inactiveTickMarkColor: Colors.red[100],
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.redAccent,
            valueIndicatorTextStyle: TextStyle(
              color: Colors.white,
            )),
        child: Slider(
          value: max(_progress * 100, 100),
          min: 0,
          max: 100,
          divisions: 100,
          label: _position?.toString().split(".")[0],
          onChanged: (value) {
            setState(() {
              _progress = value * 0.01;
            });
          },
          onChangeStart: (value) {
            _controller?.pause();
          },
          onChangeEnd: (value) {
            final duration = _controller?.value.duration;
            if (duration != null) {
              var newValue = max(0, min(value, 99)) * 0.01;
              var milis = (duration.inMilliseconds * newValue).toInt();
              _controller?.seekTo(Duration(milliseconds: milis));
              _controller?.play();
            }
          },
        ));
  }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value.volume ?? 0) > 0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60.0);
    final secs = convertTwo(remained % 60);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SliderTheme(
            data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.red[700],
                inactiveTrackColor: Colors.red[100],
                trackShape: RoundedRectSliderTrackShape(),
                trackHeight: 2.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                thumbColor: Colors.redAccent,
                overlayColor: Colors.red.withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                tickMarkShape: RoundSliderTickMarkShape(),
                activeTickMarkColor: Colors.red[700],
                inactiveTickMarkColor: Colors.red[100],
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Colors.redAccent,
                valueIndicatorTextStyle: TextStyle(
                  color: Colors.white,
                )),
            child: Slider(
              value: max(0, min(_progress * 100, 100)),
              min: 0,
              max: 100,
              divisions: 100,
              label: _position?.toString().split(".")[0],
              onChanged: (value) {
                setState(() {
                  _progress = value * 0.01;
                });
              },
              onChangeStart: (value) {
                _controller?.pause();
              },
              onChangeEnd: (value) {
                final duration = _controller?.value.duration;
                if (duration != null) {
                  var newValue = max(0, min(value, 99)) * 0.01;
                  var milis = (duration.inMilliseconds * newValue).toInt();
                  _controller?.seekTo(Duration(milliseconds: milis));
                  _controller?.play();
                }
              },
            )),
        Container(
          height: 40.0,
          width: double.maxFinite,
          color: AppColor.gradientSecond,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  child: Container(
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(50, 0, 0, 0))
                    ]),
                    child: Icon(
                      noMute ? Icons.volume_up : Icons.volume_off,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                  if (noMute) {
                    _controller?.setVolume(0.0);
                  } else {
                    _controller?.setVolume(1.0);
                  }
                  setState(() {});
                },
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.gradientSecond,
                  ),
                  onPressed: () {},
                  child:
                      Icon(Icons.fast_rewind, size: 36, color: Colors.white)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.gradientSecond,
                  ),
                  onPressed: () async {
                    // _isPlaying ? _controller?.pause() : _controller?.play();
                    if (_isPlaying) {
                      setState(() {
                        _isPlaying = false;
                      });
                      _controller?.pause();
                    } else {
                      setState(() {
                        _isPlaying = true;
                      });
                      _controller?.play();
                    }
                  },
                  child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 36, color: Colors.white)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.gradientSecond,
                  ),
                  onPressed: () {},
                  child:
                      Icon(Icons.fast_forward, size: 36, color: Colors.white)),
              Text(
                "$mins:$secs",
                style: TextStyle(color: Colors.white, shadows: [
                  Shadow(
                      offset: Offset(0.0, 1.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(150, 0, 0, 0))
                ]),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileTest extends StatefulWidget {
  ProfileTest({Key? key}) : super(key: key);

  @override
  State<ProfileTest> createState() => _ProfileTestState();
}

class _ProfileTestState extends State<ProfileTest>
    with SingleTickerProviderStateMixin {
  Duration _duration = Duration();
  Duration _position = Duration();
  bool _isPlaying = false;
  bool _isPaused = false;
  bool _isRepeat = false;

  List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];
  final AudioPlayer advancedPlayer = AudioPlayer();
  late ScrollController _scrollController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();

    advancedPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });
    advancedPlayer.onAudioPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });
    advancedPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _position = Duration(seconds: 0);
        if (_isRepeat) {
          _isPlaying = true;
        } else {
          _isPlaying = false;
          _isRepeat = false;
        }
      });
    });
  }

  @override
  void dispose() {
    advancedPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
          SizedBox(
            height: 15.0,
          ),
          slider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_position.toString().split(".")[0]),
                Text(_duration.toString().split(".")[0]),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [btnRepeat(), btnSlow(), btnStart(), btnFast()],
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: 180.0,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: -20,
                  right: 0,
                  child: Container(
                    height: 180.0,
                    child: PageView.builder(
                        controller: PageController(viewportFraction: 0.8),
                        itemCount: 3,
                        itemBuilder: (_, i) {
                          return Container(
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        "https://www.cocinacaserayfacil.net/wp-content/uploads/2020/04/Recetas-de-comidas-para-ni%C3%B1os.jpg") /* AssetImage(
                              "assets/icon/icon.png",
                            ) */
                                    )),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Expanded(
              child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (BuildContext context, bool isScroll) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false, //hide back button
                  pinned: true,
                  backgroundColor: Colors.greenAccent,
                  bottom: PreferredSize(
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: 10, left: 10), //EdgeInsets.all(0),
                        child: TabBar(
                            indicatorPadding: EdgeInsets.all(0),
                            indicatorSize: TabBarIndicatorSize.label,
                            labelPadding:
                                EdgeInsets.only(right: 10), //EdgeInsets.all(0),
                            controller: _tabController,
                            isScrollable: true,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.red.withOpacity(0.3),
                                      blurRadius: 7,
                                      offset: Offset(0, 0))
                                ]),
                            tabs: [
                              AppTabs(
                                  color: Colors.yellow.withOpacity(0.7),
                                  text: "New"),
                              AppTabs(
                                  color: Colors.blueAccent, text: "Popular"),
                              AppTabs(
                                  color: Colors.redAccent, text: "Trending"),
                              AppTabs(color: Colors.brown, text: "Other"),
                            ]),
                      ),
                      preferredSize: Size.fromHeight(20)),
                )
              ];
            },
            body: TabBarView(controller: _tabController, children: [
              Material(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                  ),
                  title: Text("Charly New"),
                ),
              ),
              Material(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                  ),
                  title: Text("Charly Popular"),
                ),
              ),
              Material(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                  ),
                  title: Text("Charly Trending"),
                ),
              ),
              Material(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                  ),
                  title: Text("Charly\nOther"),
                ),
              ),
            ]),
          ))
        ]));
  }

  Widget slider() {
    return Slider(
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        value: _position.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            changeToSecond(value.toInt());
            value = value;
          });
        });
  }

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    advancedPlayer.seek(newDuration);
  }

  Widget btnSlow() {
    return IconButton(
        onPressed: () {
          setState(() {
            advancedPlayer.setPlaybackRate(playbackRate: 0.5);
          });
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 35.0,
          color: Colors.red,
        ));
  }

  Widget btnStart() {
    return IconButton(
        onPressed: () {
          if (!_isPlaying) {
            advancedPlayer.play(
                // "https://unica-zikoxweb.radioca.st/stream");
                "https://cmsdimayor.s3.amazonaws.com/golesfecha13dim.mp4");
            // ("https://www.youtube.com/watch?v=L3F8HyQaMNI");
            setState(() {
              advancedPlayer.setPlaybackRate(playbackRate: 1.0);
              _isPlaying = true;
            });
          } else {
            advancedPlayer.pause();
            setState(() {
              _isPlaying = false;
            });
          }
        },
        icon: Icon(
          !_isPlaying ? _icons[0] : _icons[1],
          size: 35.0,
          color: Colors.blue,
        )

        /* const Icon(
          Icons.arrow_back_ios,
          size: 15.0,
          color: Colors.red,
        ) */
        );
  }

  Widget btnFast() {
    return IconButton(
        onPressed: () {
          setState(() {
            advancedPlayer.setPlaybackRate(playbackRate: 1.5);
          });
        },
        icon: const Icon(
          Icons.arrow_forward_ios,
          size: 35.0,
          color: Colors.red,
        ));
  }

  Widget btnRepeat() {
    return IconButton(
        onPressed: () {
          if (!_isRepeat) {
            advancedPlayer.setReleaseMode(ReleaseMode.LOOP);
            setState(() {
              _isRepeat = true;
            });
          } else {
            advancedPlayer.setReleaseMode(ReleaseMode.RELEASE);
            setState(() {
              _isRepeat = false;
            });
          }
        },
        icon: Icon(
          Icons.repeat,
          size: 35.0,
          color: _isRepeat ? Colors.red : Colors.black,
        ));
  }
}

class AppTabs extends StatelessWidget {
  final Color color;
  final String text;
  const AppTabs({Key? key, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      alignment: Alignment.center,
      child: Text(text),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 7,
                offset: Offset(0, 0))
          ]),
    );
  }
}

class Pagina49 extends StatefulWidget {
  Pagina49({Key? key}) : super(key: key);

  @override
  State<Pagina49> createState() => _Pagina49State();
}

class _Pagina49State extends State<Pagina49> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Circular and Linear Progress Page 49",
            style: TextStyle(fontSize: 16)),
      ),
      body: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      color: Colors.deepOrangeAccent,
                      height: 200,
                    ),
                  ),
                ),
                Opacity(
                  opacity: 1.0,
                  child: ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      color: Colors.red,
                      height: 180,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: CircularPercentIndicator(
              // backgroundColor: Colors.yellow,
              radius: 120.0,
              lineWidth: 15.0,
              percent: 3 / 5,
              center: Text("80%"),
              footer: Text("Order this month Square"),
              animation: true,
              animationDuration: 8500,
              progressColor: Colors.redAccent,
            ),
          ),
          Container(
            child: LinearPercentIndicator(
              width: 220.0,
              // lineWidth: 15.0,
              lineHeight: 15.0,
              percent: 3 / 5,
              // backgroundColor: Colors.yellow,
              leading: Text("80%"),
              trailing: Text("Order this month Square"),
              animation: true,
              animationDuration: 8500,
              progressColor: Colors.redAccent,
              linearStrokeCap: LinearStrokeCap.butt,
            ),
          ),
          Container(
            child: CircularPercentIndicator(
              // backgroundColor: Colors.yellow,
              radius: 120.0,
              lineWidth: 15.0,
              percent: 3 / 5,
              center: Text("80%"),
              footer: Text("Order this month Rounded"),
              animation: true,
              animationDuration: 8500,
              progressColor: Colors.redAccent,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ),
          Container(
            child: LinearPercentIndicator(
              width: 220.0,
              // lineWidth: 15.0,
              lineHeight: 15.0,
              percent: 3 / 5,
              // backgroundColor: Colors.yellow,
              leading: Text("80%"),
              trailing: Text("Order this month Rounded"),
              animation: true,
              animationDuration: 8500,
              progressColor: Colors.redAccent,
              // linearStrokeCap: LinearStrokeCap.butt,
            ),
          ),
        ],
      ),
    );
  }
}

//Custom clipper class with Path
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.25, size.height - 50);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);

    path.close();
    return path;
    // throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
    // throw UnimplementedError();
  }
}
