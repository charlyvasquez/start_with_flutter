import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:start_with_flutter_again/src/widgets/headers_widget.dart';
import 'package:start_with_flutter_again/src/widgets/test.dart';
import 'dart:math' as Math;

class AnimacionesPage91 extends StatelessWidget {
  const AnimacionesPage91({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'CustomAnimation AnimacionesPage91',
            style: TextStyle(fontSize: 14.0),
          ),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Varios diseños con CustomAnimation'),
              const Text('Curso Intermedio'),
              const Text('Fernando Herrera'),
              botonAnimation(context, Colors.black, Colors.red.shade50,
                  (const CuadradoAnimado()), "ButtonAnimationCuadrado"),
              botonAnimation(
                  context,
                  Colors.black,
                  Colors.red.shade100,
                  const CuadradoAnimadoWithOpacity(),
                  "CuadradoAnimadoWithOpacity"),

              /* botonAnimation(context, Colors.white, Colors.red.shade200,
                  const HeaderDiagonal(), "ButtonHeaderDiagonal"),
               */
              /* botonAnimation(context, Colors.white, Colors.red.shade300,
                  const HeaderTriangular(), "ButtonHeaderTriangular"),
               */
              /* botonAnimation(context, Colors.white, Colors.red.shade400,
                  const HeaderPico(), "ButtonHeaderPico"),
               */
              /* botonAnimation(context, Colors.white, Colors.red.shade500,
                  const HeaderCurvo(), "ButtonHeaderCurvo",
                  show: true),
               */
              /* botonAnimation(context, Colors.white, Colors.red.shade600,
                  const HeaderWave(), "ButtonHeaderWave"),
               */
              /* botonAnimation(context, Colors.white, Colors.red.shade700,
                  const HeaderCustom(), "ButtonHeaderCustom"),
               */
              /* botonAnimation(context, Colors.white, Colors.red.shade800,
                  const HeaderWaveGradient(), "ButtonHeaderWaveGradient"),
               */
              botonAnimation(context, Colors.white, Colors.red.shade900,
                  _SquareAnimated(), "ButtonAnimatedSquareRet"),
              // const AnimatedSquareRet(), "ButtonAnimatedSquareRet"),
            ],
          ),
        ));
  }

  Widget botonAnimation(
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
            pageBuilder: (c, a1, a2) => PathCustomAnimation(
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

class PathCustomAnimation extends StatelessWidget {
  final Widget widget;
  final bool? show;

  const PathCustomAnimation({Key? key, required this.widget, this.show = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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

class _Rectangulo extends StatelessWidget {
  const _Rectangulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotacion;
  final double grados = Math.pi / 180;
  final double vueltas = 2.0 * Math.pi;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));
    /* rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.slowMiddle,
    )); */
    // rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(controller);
    // rotacion = Tween(begin: 0.0, end: 720 * grados).animate(controller);
    // rotacion = Tween(begin: 0.0, end: 2 * vueltas).animate(controller);
    rotacion = Tween(begin: 0.0, end: 2 * vueltas)
        // .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
        // .animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut));
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
    controller.forward();
    controller.addListener(() {
      log('Status: ${controller.status}');
      // if (controller.status == AnimationStatus.completed) {
      //   controller.reverse();
      // }
      /* else if (controller.status == AnimationStatus.dismissed) {
        controller.forward();
      } */
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      // child: _Rectangulo(),
      builder: (BuildContext context, Widget? child) {
        log("Rotacion:" + rotacion.value.toString());
        return Transform.rotate(
            angle: rotacion.value, child: const _Rectangulo());
        // angle: rotacion.value, child: child);
      },
    );
    // return const _Rectangulo();
  }
}

class CuadradoAnimadoWithOpacity extends StatefulWidget {
  const CuadradoAnimadoWithOpacity({
    Key? key,
  }) : super(key: key);

  @override
  State<CuadradoAnimadoWithOpacity> createState() =>
      _CuadradoAnimadoWithOpacityState();
}

class _CuadradoAnimadoWithOpacityState extends State<CuadradoAnimadoWithOpacity>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacidad;
  final double grados = Math.pi / 180;
  final double vueltas = 2.0 * Math.pi;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));
    /* rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.slowMiddle,
    )); */
    // rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(controller);
    // rotacion = Tween(begin: 0.0, end: 720 * grados).animate(controller);
    // rotacion = Tween(begin: 0.0, end: 2 * vueltas).animate(controller);
    rotacion = Tween(begin: 0.0, end: 2 * vueltas)
        // .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
        // .animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut));
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
    opacidad = Tween(begin: 0.1, end: 1.0).animate(controller);
    controller.forward();
    controller.addListener(() {
      log('Status: ${controller.status}');
      // if (controller.status == AnimationStatus.completed) {
      //   controller.reverse();
      // }
      /* else if (controller.status == AnimationStatus.dismissed) {
        controller.forward();
      } */
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? child) {
        log("Rotacion:" + rotacion.value.toString());
        return Transform.rotate(
            angle: rotacion.value,
            child: Opacity(opacity: opacidad.value, child: child));
        // Opacity(opacity: opacidad.value, child: const _Rectangulo()));
        // angle: rotacion.value, child: child);
      },
    );
    // return const _Rectangulo();
  }
}

class _SquareAnimated extends StatefulWidget {
  @override
  __SquareAnimatedState createState() => __SquareAnimatedState();
}

class __SquareAnimatedState extends State<_SquareAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> traslationRight;
  late Animation<double> traslationUp;
  late Animation<double> traslationLeft;
  late Animation<double> traslationDown;
  late Animation<double> lastTraslation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    traslationRight = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.20, curve: Curves.bounceOut)));

    traslationUp = Tween(begin: 0.0, end: -200.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.20, 0.40, curve: Curves.bounceOut)));

    traslationLeft = Tween(begin: 0.0, end: -200.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.40, 0.60, curve: Curves.bounceOut)));

    traslationDown = Tween(begin: 0.0, end: 200.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.60, 0.80, curve: Curves.bounceOut)));

    lastTraslation = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.80, 1.0, curve: Curves.bounceOut)));

    super.initState();

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangle(),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(traslationRight.value, 0),
          child: Transform.translate(
            offset: Offset(0, traslationUp.value),
            child: Transform.translate(
              offset: Offset(traslationLeft.value, 0),
              child: Transform.translate(
                offset: Offset(0, traslationDown.value),
                child: Transform.translate(
                  offset: Offset(lastTraslation.value, 0),
                  child: child,
                ),
              ),
            ),
          ),
        );
      },
    );
    //_Rectangle();
  }
}

class _Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(height: 70, width: 70, color: Colors.green);
  }
}
