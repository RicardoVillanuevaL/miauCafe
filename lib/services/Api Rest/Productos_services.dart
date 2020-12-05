import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:miau_caffe_mobile/models/ProductoModel.dart';

//https://api-pruebas2020.herokuapp.com/Producto/registroProducto

class ProductosServices {
  Future<List<Producto>> listarProductos() async {
    final url = 'https://api-pruebas2020.herokuapp.com/Producto/ConsultarProducto';
    final response = await http.get(url);
    final List<dynamic> decodedData = json.decode(response.body);
    final List<Producto> listTemp = List();
    if (decodedData != null) {
      decodedData.forEach((item) {
        final temp = Producto.fromJson(item);
        listTemp.add(temp);
      });
      return listTemp;
    } else {
      return [];
    }
  }
}
final productosServices = ProductosServices();
