import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miau_caffe_mobile/models/ProductoModel.dart';
import 'package:miau_caffe_mobile/provider/PedidoProvider.dart';
import 'package:miau_caffe_mobile/services/Api%20Rest/Productos_services.dart';
import 'package:miau_caffe_mobile/views/constants/constantsDesign.dart';
import 'package:miau_caffe_mobile/views/pedidos/PedidosPage.dart';
import 'package:provider/provider.dart';

class CatalogoProductos extends StatefulWidget {
  CatalogoProductos(this.enrutamiento, this.enroot);
  final String enrutamiento;
  final int enroot;

  @override
  _CatalogoProductosState createState() => _CatalogoProductosState();
}

class _CatalogoProductosState extends State<CatalogoProductos>
    with SingleTickerProviderStateMixin {
  String titulo;
  int root;
  List<String> categorias = List();
  List<Producto> items = new List();
  int selectCategoria;
  ////////////llenado y estado del vista
  List<Producto> listaProductos;
  bool stateView;
  /////////////
  List<Producto> listaTotal = List();
  List<Producto> listaFcafes = List();
  List<Producto> listaFdesayunos = List();
  List<Producto> listaFpostres = List();
  List<Producto> listaFtortas = List();
  List<Producto> listaFbatidos = List();
  List<Producto> listaFespeciales = List();
  @override
  void initState() {
    titulo = widget.enrutamiento;
    root = widget.enroot;
    stateView = false;
    categorias = [
      'Todos',
      'Cafés',
      'Desayunos',
      'Postres',
      'Tortas',
      'Batidos',
      'Especiales'
    ];
    selectCategoria = 0;
    super.initState();
    cargarProductos();
  }

  void cargarProductos() async {
    listaProductos = await productosServices.listarProductos();
    if (listaProductos.length != 0) {
      setState(() {
        stateView = true;
      });
    } else {
      setState(() {
        stateView = false;
      });
    }
    cargarFiltros();
  }

  void cargarFiltros() async {
    listaTotal.addAll(listaProductos);
    for (var item in listaProductos) {
      if (item.categories == categorias[1]) {
        listaFcafes.add(item);
      } else if (item.categories == categorias[2]) {
        listaFdesayunos.add(item);
      } else if (item.categories == categorias[3]) {
        listaFpostres.add(item);
      } else if (item.categories == categorias[4]) {
        listaFtortas.add(item);
      } else if (item.categories == categorias[5]) {
        listaFbatidos.add(item);
      } else if (item.categories == categorias[6]) {
        listaFespeciales.add(item);
      }
    }
  }

  void selectFiltro(int indicador) {
    switch (indicador) {
      case 0:
        listaProductos.addAll(listaTotal);
        break;
      case 1:
        listaProductos.addAll(listaFcafes);
        break;
      case 2:
        listaProductos.addAll(listaFdesayunos);
        break;
      case 3:
        listaProductos.addAll(listaFpostres);
        break;
      case 4:
        listaProductos.addAll(listaFtortas);
        break;
      case 5:
        listaProductos.addAll(listaFbatidos);
        break;
      case 6:
        listaProductos.addAll(listaFespeciales);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '$titulo',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            categories(),
            stateView
                ? gridViewProductos()
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Center(child: CircularProgressIndicator()),
                  ),
            SizedBox(height: 30)
          ],
        ),
      ),
      floatingActionButton: context.watch<PedidoProvider>().existeListaPedidos
          ? FloatingActionButton.extended(
              icon: Icon(Icons.card_membership),
              label: Text('Terminar Pedido'),
              onPressed: () => Navigator.of(context).push(
                  CupertinoPageRoute(builder: (context) => PedidosPage(root))),
            )
          : Container(),
    );
  }

  categories() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
            itemCount: categorias.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print('TAMAÑO ${listaProductos.length}');
                  listaProductos.clear();
                  setState(() {
                    selectCategoria = index;
                    selectFiltro(index);
                    print(index);
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 100,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(categorias[index]),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          height: 2,
                          width: 30,
                          color: selectCategoria == index
                              ? Colors.black
                              : Colors.transparent,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  gridViewProductos() {
    List<Producto> products = listaProductos;
    if (products.length != 0) {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(
                    color: Colors.white, // agregar el generador de colores
                    product: products[index],
                    press: () {
                      print(products[index].categories);
                      showModalBottomSheet<void>(
                        builder: (BuildContext context) {
                          return DetalleProducto(producto: products[index]);
                        },
                        clipBehavior: Clip.hardEdge,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        context: context,
                      );
                    },
                  )),
        ),
      );
    } else {
      return Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Image.asset('assets/imagenes/cat_sad.png', height: 200),
            Text(
              '¡Uy! Por el momento no hay Miau Productos de este tipo.',
              style: GoogleFonts.robotoSlab(fontSize: 20),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }
  }
}

class ItemCard extends StatefulWidget {
  final Producto product;
  final Color color;
  final Function press;
  const ItemCard({
    Key key,
    this.color,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: FadeInImage.assetNetwork(
                image: widget.product.image,
                imageErrorBuilder: (context, obj, _) {
                  widget.product.image =
                      'https://firebasestorage.googleapis.com/v0/b/miau-cafe.appspot.com/o/Cafe.png?alt=media&token=cea14fa4-46e3-4af4-8a69-3a6a833a77af';
                  return Image.network(widget.product.image);
                },
                placeholder: 'assets/imagenes/load_cat.gif',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              widget.product.title,
              style: TextStyle(color: Colors.black38),
            ),
          ),
          Text(
            "\$${widget.product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class DetalleProducto extends StatefulWidget {
  final Producto producto;
  DetalleProducto({Key key, this.producto}) : super(key: key);

  @override
  _DetalleProductoState createState() => _DetalleProductoState();
}

class _DetalleProductoState extends State<DetalleProducto> {
  Producto _producto;
  @override
  void initState() {
    _producto = widget.producto;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FlipInX(
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          width: size.width,
          decoration: BoxDecoration(
            color: colorBlanco,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(children: [
                Image.network(
                  _producto.image,
                  height: size.height / 2.5,
                ),
                Positioned(
                  bottom: 25,
                  right: 25,
                  child: ZoomIn(
                    delay: Duration(milliseconds: 400),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      decoration: BoxDecoration(
                          color: colorPrimario,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Column(
                        children: [
                          Text(
                            'Precio :',
                            style: TextStyle(
                                color: colorBlanco,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            'S/. ${_producto.price}',
                            style: GoogleFonts.oswald(
                                fontSize: 22, color: colorBlanco),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ]),
              Text(
                '${_producto.title}',
                style: GoogleFonts.lemon(fontSize: 24),
              ),
              SizedBox(height: 10),
              Text(
                '${_producto.description}',
                textAlign: TextAlign.start,
                style: GoogleFonts.lateef(fontSize: 22),
              ),
              RaisedButton.icon(
                color: colorPrimario,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                icon: Icon(
                  Icons.add,
                  color: colorBlanco,
                ),
                label: Text(
                  'Agregar al Carrito',
                  style: GoogleFonts.lemonada(color: colorBlanco),
                ),
                onPressed: () {
                  context.read<PedidoProvider>().agregarProducto(_producto);
                  context.read<PedidoProvider>().existeLista();
                  Navigator.pop(context);
                },
              )
            ],
          )),
    );
  }
}
