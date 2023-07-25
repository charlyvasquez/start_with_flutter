import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

class PainterCircle extends StatefulWidget {
  /* const PainterCircle({
    super.key, required this.colorInit, required this.colorFinal, this.imageBackground,
  }); */
  final Color colorInit;
  final Color colorFinal;

  final String? imageBackground;

  const PainterCircle(
      {Key? key,
      required this.colorInit,
      required this.colorFinal,
      this.imageBackground})
      : super(key: key);

  @override
  State<PainterCircle> createState() => _PainterCircleState();
}

class _PainterCircleState extends State<PainterCircle> {
  late Future<ui.Image> imageF;
  late ui.Image iamgeS;
  @override
  void initState() {
    if (widget.imageBackground != null) {
      imageF = _loadImage();
    }

    super.initState();
  }

  Future<ui.Image> _loadImage() async {
    ByteData bd = await rootBundle.load(widget.imageBackground!);
    final Uint8List bytes = Uint8List.view(bd.buffer);
    final ui.Codec codec = await ui.instantiateImageCodec(bytes);
    final ui.Image image = (await codec.getNextFrame()).image;
    iamgeS = image;
    //imageF=image;
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return widget.imageBackground != null
        ? FutureBuilder<ui.Image>(
            future: imageF,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
              } else {
                return Container();
              }
              return CustomPaint(
                isComplex: true,
                willChange: true,
                painter: _HeaderPainterCurve(
                    widget.colorInit, widget.colorFinal, iamgeS),
                foregroundPainter: _HeaderPainterCurve(
                    widget.colorInit, widget.colorFinal, iamgeS),
                child: Container(color: Colors.white),
              );
            },
          )
        : CustomPaint(
            painter:
                _HeaderPainterCurve(widget.colorInit, widget.colorFinal, null),
          );
  }
}

class _HeaderPainterCurve extends CustomPainter {
  _HeaderPainterCurve(this.colorInit, this.colorFinal, this.image);
  final Color colorInit;
  final Color colorFinal;
  final ui.Image? image;
  @override
  Future<void> paint(Canvas canvas, Size size) async {
    final paint = Paint()
      ..shader = ui.Gradient.linear(Offset(0, size.height * 0.5),
          Offset(size.width, size.height * 0.5), [colorInit, colorFinal]);
    //propety
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;
    //moce paint
    final path = Path();
    //draw
    path.lineTo(0, size.height * 0.85);
    path.quadraticBezierTo(
        size.width * 0.50, size.height, size.width, size.height * 0.85);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    //canvas draw
    canvas.drawPath(path, paint);
    if (image != null) {
      canvas.drawImage(image!, Offset.zero, paint);
    }
  }

  @override
  bool shouldRepaint(_HeaderPainterCurve oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderPainterCurve oldDelegate) => true;
}

class AnimatedSquareRet extends StatelessWidget {
  const AnimatedSquareRet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: _SquareAnimated(),
    ));
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
