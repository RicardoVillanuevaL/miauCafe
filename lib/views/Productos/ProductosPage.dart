import 'package:flutter/material.dart';
import 'package:miau_caffe_mobile/models/ProductoModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:miau_caffe_mobile/services/Api%20Rest/Productos_services.dart';

class CatalogoProductos extends StatefulWidget {
  CatalogoProductos({this.app});
  final FirebaseApp app;

  @override
  _CatalogoProductosState createState() => _CatalogoProductosState();
}

class _CatalogoProductosState extends State<CatalogoProductos> {
  List<String> categorias = List();
  List<Producto> items = new List();
  int selectCategoria;
  ////////////llenado y estado del vista
  List<Producto> listaProductos;
  bool stateView;
  @override
  void initState() {
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
                'Productos',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            categories(),
            stateView
                ? gridViewProductos()
                : Center(
                    child: CircularProgressIndicator(),
                  ),
            SizedBox(height: 30)
          ],
        ),
      ),
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
                  setState(() {
                    selectCategoria = index;
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
                  press: () {},
                )),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: FadeInImage.assetNetwork(
                  image: product.image,
                  placeholder: 'assets/imagenes/load_cat.gif',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              product.title,
              style: TextStyle(color: Colors.black38),
            ),
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
