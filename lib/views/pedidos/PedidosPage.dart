import 'package:flutter/material.dart';
import 'package:miau_caffe_mobile/models/ProductoModel.dart';
import 'package:miau_caffe_mobile/provider/PedidoProvider.dart';
import 'package:provider/provider.dart';

class PedidosPage extends StatefulWidget {
  final int reserva;
  PedidosPage(this.reserva);

  @override
  _PedidosPageState createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  @override
  Widget build(BuildContext context) {
    final List<Producto> listaPedidos =
        context.watch<PedidoProvider>().listaPedido;
    return Scaffold(
        appBar: AppBar(title: Text('Pedido')),
        body: ListView.builder(
          itemCount: listaPedidos.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                title: Text(listaPedidos[index].title),
                leading: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    child: Image.network(listaPedidos[index].image)),
              ),
            );
          },
        ));
  }

  Widget controlCantidades() {
    return Row(children: []);
  }
}
