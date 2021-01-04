import 'package:animate_do/animate_do.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:miau_caffe_mobile/views/constants/constantsDesign.dart';
import 'package:miau_caffe_mobile/views/reservas/MyReservacionesPage.dart';
import 'package:miau_caffe_mobile/views/reservas/ReservasPage.dart';

pruebaDialogImagen(
    BuildContext context, String title, String mensaje, String imagen) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Column(
            children: [
              Container(
                child: Image.asset(imagen),
                height: 50,
                margin: EdgeInsets.only(top: 20, bottom: 20),
              ),
              Text(mensaje),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Ok'),
            )
          ],
        );
      });
}

pruebaWaitDialog(
    BuildContext context, String title, String mensaje, String image) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return FadeInUp(
          child: CupertinoAlertDialog(
            title: Text(title),
            content: Column(
              children: [
                Container(
                  child: Image.asset(image),
                  height: 50,
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                ),
                Text(mensaje),
              ],
            ),
          ),
        );
      });
  // en el codigo donde lo llamas le agregas
  // await Future.delayed(Duration(seconds: 3));
  // Navigator.pop(context);
}

//DIALOGO PARA RESERVACIONES
class SelectionReservacionDialog extends StatefulWidget {
  SelectionReservacionDialog({Key key}) : super(key: key);

  @override
  _SelectionReservacionDialogState createState() =>
      _SelectionReservacionDialogState();
}

class _SelectionReservacionDialogState
    extends State<SelectionReservacionDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        backgroundColor: Colors.transparent,
        child: Container(
            decoration: BoxDecoration(
                color: colorPrimario, borderRadius: BorderRadius.circular(25)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Positioned(
                          left: 0,
                          child: Image.asset('assets/imagenes/oreja izq.png',
                              height: 15)),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 6, right: 14, left: 14),
                        child: Text(
                          'MIAU RESERVACIONES',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          child: Image.asset('assets/imagenes/oreja der.png',
                              height: 15))
                    ],
                  ),
                  Divider(color: Colors.white),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('Mis reservaciones',
                                  style: styleTile,
                                  textAlign: TextAlign.center),
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MyReservacionesPage())),
                            ),
                            ListTile(
                                title: Text('Miau reservar',
                                    style: styleTile,
                                    textAlign: TextAlign.center),
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => ReservasPage())))
                          ],
                        ),
                      ),
                      Positioned(
                          left: 10,
                          top: 40,
                          child: Image.asset(
                              'assets/imagenes/huellita_blanca.png',
                              height: 40)),
                      Positioned(
                          right: 10,
                          top: 40,
                          child: Image.asset(
                              'assets/imagenes/huellita_blanca.png',
                              height: 40)),
                    ],
                  )
                ])));
  }
}

//DIALOGO ESPECIAL DE FECHAS
class DesignDatesDialog extends StatefulWidget {
  DesignDatesDialog({Key key}) : super(key: key);

  @override
  _DesignDatesDialogState createState() => _DesignDatesDialogState();
}

class _DesignDatesDialogState extends State<DesignDatesDialog> {
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        backgroundColor: Colors.transparent,
        child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFf5d2be),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Positioned(
                        left: 0,
                        child: Image.asset('assets/imagenes/oreja izq.png',
                            height: 15)),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 6, right: 14, left: 14),
                      child: Text(
                        'MIAU CALENDAR',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        child: Image.asset('assets/imagenes/oreja der.png',
                            height: 15))
                  ],
                ),
                Divider(color: Colors.white),
                Text(
                  'Fecha: ${DateFormat('dd-MM-yyyy').format(_selectedValue)}',
                  style: styleTitleDialog,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black)),
                    child: DatePicker(
                      DateTime.now(),
                      width: 60,
                      height: 80,
                      controller: _controller,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: Colors.black,
                      selectedTextColor: Colors.white,
                      onDateChange: (date) {
                        setState(() {
                          _selectedValue = date;
                        });
                      },
                    ),
                  ),
                ),
                RaisedButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Text('OK',
                        style: TextStyle(
                            color: colorBlanco,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    onPressed: () {
                      _controller.animateToSelection();
                      Navigator.pop(context, _selectedValue);
                    })
              ],
            )));
  }
}

// DIALOGO ESPECIAL CON IMAGEN
class DesingWaitingDialog extends StatefulWidget {
  final String title, mensaje, imagen;
  final Function function;
  DesingWaitingDialog({this.title, this.mensaje, this.imagen, this.function});

  @override
  _DesingWaitingDialogState createState() => _DesingWaitingDialogState();
}

class _DesingWaitingDialogState extends State<DesingWaitingDialog> {
  Widget titleDialog() {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Positioned(
            left: 0,
            child: Image.asset('assets/imagenes/oreja izq.png', height: 15)),
        Padding(
          padding: const EdgeInsets.only(top: 6, right: 14, left: 14),
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
            right: 0,
            child: Image.asset('assets/imagenes/oreja der.png', height: 15))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFf5d2be), borderRadius: BorderRadius.circular(25)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: titleDialog(),
            ),
            Divider(color: Colors.white),
            Image.asset(
              widget.imagen,
              height: 100,
            ),
            Text(widget.mensaje),
            RaisedButton(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Text('OK',
                    style: TextStyle(
                        color: colorBlanco,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                onPressed: widget.function)
          ],
        ),
      ),
    );
  }
}

//DIALOGO PARA EL USO DEL WILL SCOPE(RETROCESO DE PANTALLA)
class WillScopeOptionDialog extends StatefulWidget {
  final String message;
  final Function function;
  WillScopeOptionDialog({this.message, this.function});

  @override
  _WillScopeOptionDialogState createState() => _WillScopeOptionDialogState();
}

class _WillScopeOptionDialogState extends State<WillScopeOptionDialog> {
  String _message;
  Function _function;

  @override
  void initState() {
    super.initState();
    _message = widget.message;
    _function = widget.function;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(top: 80, bottom: 16, left: 16, right: 16),
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                  color: colorSecundario,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 80.0,
                        offset: Offset(10.0, 10.0))
                  ]),
              child: Column(
                children: [
                  Text('¡MIAU AVISO!', style: GoogleFonts.oswald(fontSize: 24)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text('$_message',
                        style: GoogleFonts.roboto(fontSize: 18)),
                  ),
                  Divider(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          child: Text('Si',
                              style: GoogleFonts.oswald(fontSize: 20)),
                          onPressed: _function),
                      TextButton(
                          child: Text('No',
                              style: GoogleFonts.oswald(fontSize: 20)),
                          onPressed: () => Navigator.of(context).pop()),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                top: 0,
                left: 16,
                right: 16,
                child: CircleAvatar(
                  backgroundColor: colorSecundario,
                  radius: 50,
                  child: Container(
                    child: Image.asset(
                      'assets/imagenes/garrita.png',
                      height: 90,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
