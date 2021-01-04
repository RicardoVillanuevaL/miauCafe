import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miau_caffe_mobile/models/ReservasModel.dart';
import 'package:miau_caffe_mobile/services/Api%20Rest/Reservas_services.dart';
import 'package:miau_caffe_mobile/services/Preferences/PreferenciasUsuario.dart';
import 'package:intl/intl.dart';
import 'package:miau_caffe_mobile/views/constants/complementsScaffold.dart';
import 'package:miau_caffe_mobile/views/dashboard/DashBoardPage.dart';
import 'package:miau_caffe_mobile/views/reservas/DetailReservaPage.dart';

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
          return Card(
            margin: const EdgeInsets.only(bottom: 15, right: 20, left: 20),
            child: ListTile(
              trailing: Image.asset('assets/imagenes/garrita.png', height: 30),
              title: Text('Mi miau pedido ${index + 1}'),
              subtitle: Text(
                  '${DateFormat('dd-MM-yyyy').format(listaReservas[index].fecha)}'),
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) =>
                        DetailReservaPage(listaReservas[index], () {
                          Navigator.pop(context);
                        })));
              },
            ),
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

  Future<bool> fnWillScope() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DashBoardMenu()));
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: fnWillScope,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 120),
                child: bodyListaReservas(),
              ),
              SpecialAppBar(
                height: size.height * 0.24,
                child: Container(),
                icon: Icons.local_cafe,
                title: 'Mis Reservaciones',
                width: size.width,
              ),
            ],
          ),
        ),
        bottomSheet: SpecialBottomSheet(
          width: size.width,
        ),
      ),
    );
  }
}
