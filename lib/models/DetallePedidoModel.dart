// To parse this JSON data, do
//
//     final detallePedido = detallePedidoFromJson(jsonString);

import 'dart:convert';

DetallePedido detallePedidoFromJson(String str) =>
    DetallePedido.fromJson(json.decode(str));

String detallePedidoToJson(DetallePedido data) => json.encode(data.toJson());

List<DetallePedido> detallePedidoFromJsonConsulta(String str) => List<DetallePedido>.from(json.decode(str).map((x) => DetallePedido.fromJsonConsulta(x)));

String detallePedidoToJsonConsulta(List<DetallePedido> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJsonConsulta())));

class DetallePedido {
  DetallePedido({
    this.id,
    this.producto,
    this.cantProducto,
    this.pedido,
  });
  int id;
  int producto;
  int cantProducto;
  int pedido;

  factory DetallePedido.fromJson(Map<String, dynamic> json) => DetallePedido(
        producto: json["producto"],
        cantProducto: json["cant_producto"],
        pedido: json["pedido"],
      );

  Map<String, dynamic> toJson() => {
        "producto": producto,
        "cant_producto": cantProducto,
        "pedido": pedido,
      };

  factory DetallePedido.fromJsonConsulta(Map<String, dynamic> json) => DetallePedido(
        id: json["id_detalle_pedido"],
        producto: json["id_producto"],
        cantProducto: json["cant_producto"],
        pedido: json["id_pedido"],
    );

    Map<String, dynamic> toJsonConsulta() => {
        "id_detalle_pedido": id,
        "id_producto": producto,
        "cant_producto": cantProducto,
        "id_pedido": pedido,
    };
}
