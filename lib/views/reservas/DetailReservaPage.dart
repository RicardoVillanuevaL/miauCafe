import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miau_caffe_mobile/models/ReservasModel.dart';
import 'package:miau_caffe_mobile/views/constants/complementsScaffold.dart';
import 'package:intl/intl.dart';
import 'package:miau_caffe_mobile/views/constants/constantsDesign.dart';
import 'package:miau_caffe_mobile/views/dashboard/DashBoardPage.dart';

class DetailReservaPage extends StatefulWidget {
  final Reserva reserva;
  DetailReservaPage(this.reserva);

  @override
  _DetailReservaPageState createState() => _DetailReservaPageState();
}

class _DetailReservaPageState extends State<DetailReservaPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            BodyDetalleReserva(widget.reserva),
            Positioned(
              top: 0,
              child: SpecialAppBar(
                title: 'Detalle reserva',
                height: size.height * 0.24,
                child: Container(),
                icon: Icons.local_cafe,
                width: size.width,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: SpecialBottomSheet(
        width: size.width,
      ),
    );
  }
}

class BodyDetalleReserva extends StatefulWidget {
  final Reserva reserva;
  BodyDetalleReserva(this.reserva);

  @override
  _BodyDetalleReservaState createState() => _BodyDetalleReservaState();
}

class _BodyDetalleReservaState extends State<BodyDetalleReserva> {
  TextEditingController controllerFecha,
      controllerHora,
      controllerPersonas,
      controllerGatos,
      controllerMesa;

  @override
  void initState() {
    super.initState();
    controllerFecha = TextEditingController(
        text: DateFormat('dd/MM/yyyy').format(widget.reserva.fecha));
    controllerHora = TextEditingController(text: widget.reserva.hora);
    controllerPersonas = TextEditingController(
        text: '${widget.reserva.personas.toString()} adultos');
    controllerGatos =
        TextEditingController(text: '${widget.reserva.gatos.toString()} gatos');
    controllerMesa =
        TextEditingController(text: 'Mesa ${widget.reserva.mesa.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
        child: Column(
          children: [
            ListTile(
                leading: Icon(Icons.calendar_today_outlined,
                    size: 40, color: colorTerceario),
                title: TextField(
                  readOnly: true,
                  textAlign: TextAlign.center,
                  controller: controllerFecha,
                )),
            SizedBox(height: 15),
            ListTile(
                leading: Icon(Icons.watch_later_outlined,
                    size: 40, color: colorTerceario),
                title: TextField(
                  readOnly: true,
                  textAlign: TextAlign.center,
                  controller: controllerHora,
                )),
            SizedBox(height: 15),
            ListTile(
                leading: Image(
                    image: AssetImage('assets/imagenes/audience.png'),
                    height: 40),
                title: TextField(
                  readOnly: true,
                  textAlign: TextAlign.center,
                  controller: controllerPersonas,
                )),
            SizedBox(height: 15),
            ListTile(
                leading: Image(
                    image: AssetImage('assets/imagenes/huellita.png'),
                    height: 40),
                title: TextField(
                  readOnly: true,
                  textAlign: TextAlign.center,
                  controller: controllerGatos,
                )),
            SizedBox(height: 15),
            ListTile(
                leading: Image(
                    image: AssetImage('assets/imagenes/kitchen-table.png'),
                    height: 40),
                title: TextField(
                  readOnly: true,
                  textAlign: TextAlign.center,
                  controller: controllerMesa,
                )),
            SizedBox(height: 15),
            RaisedButton(
              color: colorTerceario,
              padding: EdgeInsets.symmetric(horizontal: 25),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Text('¡Listo!',
                  style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    CupertinoPageRoute(builder: (context) => DashBoardMenu()),
                    (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
