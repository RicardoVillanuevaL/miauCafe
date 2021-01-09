import 'package:miau_caffe_mobile/models/DetallePedidoModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetallePedidoServices {
  Future<bool> registrarDetallePedido(DetallePedido model) async {
    final url =
        'https://api-pruebas2020.herokuapp.com/Detalle_Pedido/registroDetallePedido';
    final response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: detallePedidoToJson(model));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<DetallePedido>> listarDetallePedido(String pedido) async {
    try {
      final url =
          'https://api-pruebas2020.herokuapp.com/Detalle_Pedido/ConsultarDetallePedido/$pedido';
      final response = await http.get(url);
      final List<dynamic> decodedData = json.decode(response.body);
      final List<DetallePedido> listTemp = List();
      decodedData.forEach((item) {
        print(item);
        final temp = DetallePedido.fromJsonConsulta(item);
        listTemp.add(temp);
      });
      return listTemp;
    } catch (e) {
      print(e);
      return [];
    }
  }
}

final detallePedidoServices = DetallePedidoServices();
