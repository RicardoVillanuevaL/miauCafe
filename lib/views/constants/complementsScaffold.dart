import 'package:flutter/material.dart';

class SpecialAppBar extends StatelessWidget {
  final double width,height;
  final Widget child;
  final String title;
  final IconData icon;
  const SpecialAppBar({Key key, this.width, this.height,this.child, this.title, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        width: width,
        height: height,
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
      Positioned(
        bottom: 0,
        child: child,
      ),
    ]);
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
        height: 80,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/imagenes/huellitassss.jpg'))),
      ),
    ]);
  }
}