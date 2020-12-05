import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
