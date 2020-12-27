import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  // PATRON SINGLETON --
  static final PreferenciasUsuario _instancia = PreferenciasUsuario.internal();
  factory PreferenciasUsuario() {
    return _instancia;
  }
  PreferenciasUsuario.internal();
  // -- PATRON SINGLETON

  SharedPreferences _preferences;

  initPrefs() async {
    this._preferences = await SharedPreferences.getInstance();
  }

  // GET Y SET PREFERENCIAS DEL USUARIO

  //NOMBRE
  get nombre {
    return _preferences.getString('nombre') ?? '';
  }

  set nombre(String value) {
    _preferences.setString('nombre', value);
  }

  //APELLIDO
  get apellido {
    return _preferences.getString('apellido') ?? '';
  }

  set apellido(String value) {
    _preferences.setString('apellido', value);
  }

  //DNI
  get dni {
    return _preferences.getString('dni') ?? '';
  }

  set dni(String value) {
    _preferences.setString('dni', value);
  }

  //CORREO
  String get correo {
    return _preferences.getString('correo') ?? '';
  }

  set correo(String value) {
    _preferences.setString('correo', value);
  }

  //PASSWORD
  String get password {
    return _preferences.getString('password') ?? '';
  }

  set password(String value) {
    _preferences.setString('password', value);
  }

  //SESSION
  get session {
    return _preferences.getBool('session') ?? false;
  }

  set session(bool value) {
    _preferences.setBool('session', value);
  }

  //SKIP CARRUSEL
  get skipCarrusel {
    return _preferences.getBool('skip') ?? false;
  }

  set skipCarrusel(bool value) {
    _preferences.setBool('skip', value);
  }
}
