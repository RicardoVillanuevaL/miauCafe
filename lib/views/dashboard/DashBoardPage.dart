import 'package:flutter/material.dart';
import 'package:miau_caffe_mobile/views/Productos/ProductosPage.dart';
import 'package:miau_caffe_mobile/views/reservas/ReservasPage.dart';

class DashBoardMenu extends StatefulWidget {
  DashBoardMenu({Key key}) : super(key: key);

  @override
  _DashBoardMenuState createState() => _DashBoardMenuState();
}

class _DashBoardMenuState extends State<DashBoardMenu> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                child: SpecialAppBar(
                  width: size.width,
                  title: 'Miau Cafe',
                  icon: Icons.local_cafe,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xFF8c5f9e),
                        child: Text(
                          'F',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Fiorella Loayza',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                top: 0),
            Positioned(
                child: SpecialBottomSheet(
                  width: size.width,
                ),
                bottom: 0),
            DashBoardBody(),
          ],
        ),
      ),
    );
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
      child: Column(
        children: [
          SpecialCard(
            text: 'Reservar',
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ReservasPage()));
            },
            position: 'TOP',
          ),
          SpecialCard(
            text: 'Ver carta / Promociones',
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CatalogoProductos()));
            },
            position: 'MID',
          ),
          SpecialCard(
            text: 'Compra / Delivery',
            press: () {},
            position: 'BOT',
          ),
        ],
      ),
    );
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
    return GestureDetector(
      onTap: press,
      child: Container(
        color: Color(0xFFb992c9),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            title: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            trailing: Icon(
              Icons.navigate_next,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////
class SpecialBottomSheet extends StatelessWidget {
  final double width;
  const SpecialBottomSheet({Key key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: width,
        height: 100,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/imagenes/huellitassss.jpg'))),
      ),
    ]);
  }
}

class SpecialAppBar extends StatelessWidget {
  final double width;
  final Widget child;
  final String title;
  final IconData icon;
  const SpecialAppBar({Key key, this.width, this.child, this.title, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        width: width,
        height: 180,
        child: Card(
          elevation: 10,
          color: Color(0xFFb992c9),
          margin: EdgeInsets.only(bottom: 60),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 28)),
                Icon(
                  icon,
                  color: Colors.white,
                  size: 40,
                )
              ],
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        child: child,
      ),
    ]);
  }
}
