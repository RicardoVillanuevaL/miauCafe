import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:miau_caffe_mobile/models/ReservasModel.dart';

class ReservasServices {
  Future<bool> registrarReserva(Reserva model) async {
    final url = 'https://api-pruebas2020.herokuapp.com/Reserva/registroReserva';
    final response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: reservaToJson(model));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Reserva>> listarReservasUsuario(String dni) async {
    final url = 'https://api-pruebas2020.herokuapp.com/Reserva/ConsultarReserva/$dni';
    final response = await http.get(url);
    final List<dynamic> decodedData = json.decode(response.body);
    final List<Reserva> listTemp = List();
    if (decodedData != null) {
      decodedData.forEach((item) {
        final temp = Reserva.fromJson(item);
        listTemp.add(temp);
      });
      return listTemp;
    } else {
      return [];
    }
  }
}
