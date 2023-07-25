import 'package:flutter/material.dart';
import 'package:start_with_flutter_again/src/widgets/headers_widget.dart';
import 'package:start_with_flutter_again/src/widgets/test.dart';

class HeadersPage90 extends StatelessWidget {
  const HeadersPage90({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'CustomPainter HeadersPage90',
            style: TextStyle(fontSize: 16.0),
          ),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Varios diseños con CustomPainter'),
              const Text('Curso Intermedio'),
              const Text('Fernando Herrera'),
              botonHeader(context, Colors.black, Colors.purple.shade50,
                  const HeaderCuadrado(), "ButtonHeaderCuadrado"),
              botonHeader(
                  context,
                  Colors.black,
                  Colors.purple.shade100,
                  const HeaderBorderRedondeados(),
                  "ButtonHeaderBorderRedondeados"),
              botonHeader(context, Colors.white, Colors.purple.shade200,
                  const HeaderDiagonal(), "ButtonHeaderDiagonal"),
              botonHeader(context, Colors.white, Colors.purple.shade300,
                  const HeaderTriangular(), "ButtonHeaderTriangular"),
              botonHeader(context, Colors.white, Colors.purple.shade400,
                  const HeaderPico(), "ButtonHeaderPico"),
              botonHeader(context, Colors.white, Colors.purple.shade500,
                  const HeaderCurvo(), "ButtonHeaderCurvo",
                  show: true),
              botonHeader(context, Colors.white, Colors.purple.shade600,
                  const HeaderWave(), "ButtonHeaderWave"),
              botonHeader(context, Colors.white, Colors.purple.shade700,
                  const HeaderCustom(), "ButtonHeaderCustom"),
              botonHeader(context, Colors.white, Colors.purple.shade800,
                  const HeaderWaveGradient(), "ButtonHeaderWaveGradient"),
              botonHeader(
                  context,
                  Colors.white,
                  Colors.purple.shade900,
                  const PainterCircle(
                    colorInit: Colors.amber,
                    colorFinal: Colors.green,
                    imageBackground: "assets/icon/redCar.png",
                  ),
                  "ButtonHeaderWaveGradientImage"),
            ],
          ),
        ));
  }

  Widget botonHeader(
      context, Color colorText, Color colorFill, Widget widget, String label,
      {bool show = false}) {
    return RawMaterialButton(
      textStyle: TextStyle(color: colorText),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      fillColor: colorFill,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => PathCustomPainter(
              widget: widget,
              show: show,
            ),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: const Duration(milliseconds: 3000),
          ),
        );
      },
      child: Text(label),
    );
  }
}

class PathCustomPainter extends StatelessWidget {
  final Widget widget;
  final bool? show;

  const PathCustomPainter({Key? key, required this.widget, this.show = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // HeaderCurvoUp(),
          widget,
          // HeaderCurvoDown(),
          show == true
              ? Center(child: loginForm(context))
              : const SizedBox.shrink(),
          Align(
            alignment: show == true ? Alignment.bottomCenter : Alignment.center,
            child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Text('Volver')),
          ),
        ],
      ),
    );
  }

  Widget loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(children: [
      /* SafeArea(
          child: Container(
        height: size.height * 0.15,
      )), */
      Container(
        width: size.width * 0.85,
        margin: EdgeInsets.symmetric(vertical: 30.0),
        padding: EdgeInsets.symmetric(vertical: 40.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0) // BoxShadow
            ]),
        child: Column(children: [
          Text('Bienvenido',
              style: TextStyle(fontSize: 20.0, color: Colors.black45)), // Text
          SizedBox(height: 20.0),
          Text("Crear email"),
          Text("Crear password"),

          SizedBox(height: 30.0),
          Text("Crear boton"),
        ]),
      ),
      Text("¿Olvido la contraseña?",
          style: TextStyle(fontSize: 15.0, color: Colors.black45)),
    ]));
  }
}
