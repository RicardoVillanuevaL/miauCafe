import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:miau_caffe_mobile/notifications%20and%20dialog/dialogsCute.dart';
import 'package:miau_caffe_mobile/services/Api%20Rest/Usuario_services.dart';
import 'package:miau_caffe_mobile/services/Firebase/Authentication.dart';
import 'package:miau_caffe_mobile/services/Preferences/PreferenciasUsuario.dart';
import 'package:miau_caffe_mobile/views/dashboard/DashBoardPage.dart';
import 'package:miau_caffe_mobile/views/login/LoginPage.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final prefs = PreferenciasUsuario();

  @override
  void initState() {
    cargarNavegacion();
    super.initState();
  }

  void cargarNavegacion() async {
    if (prefs.session && prefs.correo.length > 0 && prefs.password.length > 0) {
      final response = await context
          .read<AuthenticationServices>()
          .logeoUsuario(prefs.correo, prefs.password);
      if (response == 'ingreso') {
        final resp =
            await usuarioServices.loginUsuario(prefs.correo, prefs.password);
        if (resp != null) {
           await Future.delayed(Duration(milliseconds: 2000));
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DashBoardMenu(
                    usuario: resp,
                  )));
        } else {
          await Future.delayed(Duration(milliseconds: 3200));
          Navigator.of(context).pushAndRemoveUntil(
              CupertinoPageRoute(builder: (context) => LoginPage()),
              (route) => false);
        }
      } else {
        await Future.delayed(Duration(milliseconds: 3200));
        Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(builder: (context) => LoginPage()),
            (route) => false);
      }
    } else {
      await Future.delayed(Duration(milliseconds: 3200));
      Navigator.of(context).pushAndRemoveUntil(
          CupertinoPageRoute(builder: (context) => LoginPage()),
          (route) => false);
    }
  }
   Future<bool> fnWillScope() {
    showDialog(
        context: context,
        builder: (context) {
          return WillScopeOptionDialog(
            message: '¿Desea cerrar el aplicativo?',
            function: () {
              SystemNavigator.pop();
            },
          );
        });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: fnWillScope,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset('assets/lottie/coffe_cat.json',
                  repeat: false, height: size.height / 2.5),
              SizedBox(height: size.height * 0.05),
              ZoomIn(
                duration: Duration(milliseconds: 2500),
                child: Text('BIENVENIDO',
                    style: GoogleFonts.pacifico(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 0.8)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
