import 'package:flutter/material.dart';
import 'package:miau_caffe_mobile/models/UsuarioModel.dart';
import 'package:miau_caffe_mobile/services/Preferences/PreferenciasUsuario.dart';
import 'package:miau_caffe_mobile/views/Productos/ProductosPage.dart';
import 'package:miau_caffe_mobile/views/constants/complementsScaffold.dart';
import 'package:miau_caffe_mobile/notifications and dialog/dialogsCute.dart';

class DashBoardMenu extends StatefulWidget {
  final Usuario usuario;
  DashBoardMenu({Key key, this.usuario}) : super(key: key);

  @override
  _DashBoardMenuState createState() => _DashBoardMenuState();
}

class _DashBoardMenuState extends State<DashBoardMenu> {
  Usuario _usuario;
  final prefs = PreferenciasUsuario();

  @override
  void initState() {
    cargarDatos();
    super.initState();
  }

  cargarDatos() {
    if (widget.usuario != null) {
      _usuario = widget.usuario;
    } else {
      final temp = Usuario(
          id: prefs.dni,
          nombre: prefs.nombre,
          apellido: prefs.apellido,
          correo: prefs.correo,
          pass: prefs.password);
      _usuario = temp;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            color: Colors.white,
            width: double.infinity,
            height: size.height,
            child: Stack(alignment: Alignment.center, children: [
              Positioned(
                  child: SpecialAppBar(
                      width: size.width,
                      height: size.height * 0.24,
                      title: 'Miau Cafe',
                      icon: Icons.local_cafe,
                      child: Column(children: [
                        CircleAvatar(
                            radius: 28,
                            backgroundColor: Color(0xFF8c5f9e),
                            child: Text('${_usuario.nombre.substring(0, 1)}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold))),
                        SizedBox(height: 5),
                        Text('${_usuario.nombre} ${_usuario.apellido}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))
                      ])),
                  top: 0),
              Positioned(
                  child: SpecialBottomSheet(
                    width: size.width,
                  ),
                  bottom: 0),
              DashBoardBody()
            ])));
  }
}

class DashBoardBody extends StatefulWidget {
  DashBoardBody({Key key}) : super(key: key);

  @override
  _DashBoardBodyState createState() => _DashBoardBodyState();
}

class _DashBoardBodyState extends State<DashBoardBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      SpecialCard(
          text: 'Reservar',
          press: () => showDialog(
              context: context,
              builder: (context) => SelectionReservacionDialog()),
          position: 'TOP'),
      SpecialCard(
          text: 'Ver carta / Promociones',
          press: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CatalogoProductos()));
          },
          position: 'MID'),
      SpecialCard(text: 'Compra / Delivery', press: () {}, position: 'BOT'),
    ]));
  }
}

class SpecialCard extends StatelessWidget {
  //PARA LA POSICION SE TOMARAN LAS 3 PALABRAS
  // TOP, BOT, MID => PARA SABER EN QUE POSICION SE DARA EL BORDE RESPETIVO
  final String text, position;
  final Function press;
  const SpecialCard({Key key, this.text, this.position, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (position == 'TOP') {
      return GestureDetector(
          onTap: press,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Color(0xFFb992c9)),
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ListTile(
                      title: Text(text,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 28)),
                      trailing:
                          Icon(Icons.navigate_next, color: Colors.white)))));
    } else if (position == 'BOT') {
      return GestureDetector(
          onTap: press,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  color: Color(0xFFb992c9)),
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ListTile(
                      title: Text(text,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 28)),
                      trailing:
                          Icon(Icons.navigate_next, color: Colors.white)))));
    } else {
      return GestureDetector(
          onTap: press,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              color: Color(0xFFb992c9),
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ListTile(
                      title: Text(text,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 28)),
                      trailing:
                          Icon(Icons.navigate_next, color: Colors.white)))));
    }
  }
}
