import 'package:miau_caffe_mobile/models/PedidoModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PedidoServices {
  Future<bool> registraPedido(Pedido model) async {
    final url = 'https://api-pruebas2020.herokuapp.com/Pedido/registroPedido';
    final response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: pedidoToJson(model));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Pedido>> listaPedidos(String usuario) async {
    try {
      final url =
          'https://api-pruebas2020.herokuapp.com/Pedido/ConsultarPedido/$usuario';
      final response = await http.get(url);
      final List<dynamic> decodedData = json.decode(response.body);
      final List<Pedido> listTemp = List();
      decodedData.forEach((item) {
        print(item);
        final temp = Pedido.fromJsonConsulta(item);
        listTemp.add(temp);
      });
      return listTemp;
    } catch (e) {
      print(e);
      return [];
    }
  }
}

final servicesPedido = PedidoServices();
