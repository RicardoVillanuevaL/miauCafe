import 'package:miau_caffe_mobile/models/PagoModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PagoServices {
  Future<bool> registrarPago(Pago model) async {
    final url = 'https://api-pruebas2020.herokuapp.com/Pago/registroPago';
    final response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: pagoToJson(model));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Pago>> listaPagos(String dni) async {
    try {
      final url =
          'https://api-pruebas2020.herokuapp.com/Pago/ConsultarPago/$dni';
      final response = await http.get(url);
      final List<dynamic> decodedData = json.decode(response.body);
      final List<Pago> listTemp = List();
      decodedData.forEach((item) {
        print(item);
        final temp = Pago.fromJsonConsulta(item);
        listTemp.add(temp);
      });
      return listTemp;
    } catch (e) {
      print(e);
      return [];
    }
  }
}

final servicesPago = PagoServices();
