import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miau_caffe_mobile/provider/PedidoProvider.dart';
import 'package:miau_caffe_mobile/services/Firebase/Authentication.dart';
import 'package:miau_caffe_mobile/services/Preferences/PreferenciasUsuario.dart';
import 'package:miau_caffe_mobile/views/login/OnboardPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:miau_caffe_mobile/views/login/SplashScreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  //NUEVA VERSION ES NECESARIO EL SIGUIENTE CODIGO
  WidgetsFlutterBinding.ensureInitialized();

  //INICIALIZACION DE SERVICIOS O PREFERENCIAS
  await Firebase.initializeApp();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  //CORRIDA DE LA APLICACION
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> globalKey = new GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    final prefs = PreferenciasUsuario();
    print(prefs.skipCarrusel);
    return MultiProvider(
      providers: [
        Provider<AuthenticationServices>(
          create: (_) => AuthenticationServices(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationServices>().authStateChanges,
        ),
        ChangeNotifierProvider(create: (_) => PedidoProvider()) // para los pedidos
      ],
      child: MaterialApp(
        navigatorKey: globalKey,
        title: 'Miau',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: prefs.skipCarrusel ? SplashScreen() : OnBoardPage(),
      ),
    );
  }
}
