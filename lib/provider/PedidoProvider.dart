import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:miau_caffe_mobile/models/ProductoModel.dart';

class PedidoProvider with ChangeNotifier, DiagnosticableTreeMixin {
  List<Producto> _listaPedido = List();
  bool _existeLista = false;

  List<Producto> get listaPedido => this._listaPedido;
  bool get existeListaPedidos => this._existeLista;

  void agregarProducto(Producto value) {
    _listaPedido.add(value);
    notifyListeners();
  }

  void eliminarProducto(Producto value) {
    _listaPedido.remove(value);
    notifyListeners();
  }

  void existeLista() {
    if (_listaPedido.length > 0) {
      _existeLista = true;
      notifyListeners();
    } else {
      _existeLista = false;
      notifyListeners();
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('list_pedido', _listaPedido));
  }
}
