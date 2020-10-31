import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miau_caffe_mobile/views/login/LoginPage.dart';

class InicialPage extends StatefulWidget {
  InicialPage({Key key}) : super(key: key);

  @override
  _InicialPageState createState() => _InicialPageState();
}

class _InicialPageState extends State<InicialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              CustomPaint(
                painter: CirclePainter(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bienvenido!',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Realiza tu reserva en Miau Café',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
          Align(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 400,
                  child: Image(
                    image: AssetImage('assets/imagenes/pruebaGato.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: RaisedButton(
                    onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                        CupertinoPageRoute(builder: (context) => LoginPage()),
                        (route) => false),
                    elevation: 5,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.deepPurple[200],
                            width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Text(
                        'Empezar',
                        style: TextStyle(
                            fontSize: 20, color: Colors.deepPurple[200]),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = Colors.deepPurple[200]
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;

    final offset = Offset(-50, -80);

    canvas.drawCircle(offset, 500, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => false;
}
