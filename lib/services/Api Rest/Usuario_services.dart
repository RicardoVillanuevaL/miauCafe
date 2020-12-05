import 'package:miau_caffe_mobile/models/UsuarioModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsuarioServices {
  Future<bool> registroUsuario(Usuario model) async {
    final url = 'https://api-pruebas2020.herokuapp.com/Usuario/registroUsuario';
    final response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: usuarioToJson(model));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<Usuario> loginUsuario(String email, String pass) async {
    final url = 'https://api-pruebas2020.herokuapp.com/Usuario/loginUser/$email/$pass';
    final response = await http.get(url);
    final List<dynamic> decodedData = json.decode(response.body);
    if (decodedData != null) {
      Usuario temp = Usuario();
      decodedData.forEach((item){
        final tempJson = Usuario.fromJson(item);
        temp = tempJson;
      });
      return temp;
    } else {
      return null;
    }
  }
}

final usuarioServices = UsuarioServices();
