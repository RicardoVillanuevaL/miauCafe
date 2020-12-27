import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miau_caffe_mobile/models/ReservasModel.dart';
import 'package:miau_caffe_mobile/services/Api%20Rest/Reservas_services.dart';
import 'package:miau_caffe_mobile/services/Preferences/PreferenciasUsuario.dart';
import 'package:intl/intl.dart';

class MyReservacionesPage extends StatefulWidget {
  MyReservacionesPage({Key key}) : super(key: key);

  @override
  _MyReservacionesPageState createState() => _MyReservacionesPageState();
}

class _MyReservacionesPageState extends State<MyReservacionesPage> {
  final prefs = PreferenciasUsuario();
  List<Reserva> listaReservas = List();
  int stateData;

  @override
  void initState() {
    stateData = 0;
    cargarReservas();
    super.initState();
  }

  cargarReservas() async {
    listaReservas = await servicesReservas.listarReservasUsuario(prefs.dni);
    if (listaReservas.length > 0) {
      setState(() {
        stateData = 1;
      });
    } else {
      setState(() {
        stateData = 2;
      });
    }
  }

  Widget bodyListaReservas() {
    if (stateData == 0) {
      return Center(child: CupertinoActivityIndicator());
    } else if (stateData == 1) {
      return ListView.builder(
        itemCount: listaReservas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(DateFormat('dd-MM-yyyy').format(listaReservas[index].fecha)),
          );
        },
      );
    } else {
      return Column(
        children: [
          Image.asset('assets/imagenes/cat_sad.png'),
          Text('No tiene reservas o algo no esta bien.')
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: bodyListaReservas());
  }
}
