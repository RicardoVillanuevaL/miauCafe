import 'package:flutter/material.dart';
import 'package:miau_caffe_mobile/models/ProductoModel.dart';

class CatalogoProductos extends StatefulWidget {
  CatalogoProductos({Key key}) : super(key: key);

  @override
  _CatalogoProductosState createState() => _CatalogoProductosState();
}

class _CatalogoProductosState extends State<CatalogoProductos> {
  List<String> categorias = List();
  int selectCategoria;
  @override
  void initState() {
    categorias = [
      'Cafés',
      'Gatos',
      'Desayunos',
      'Postres',
      'Tortas',
      'Batidos'
    ];
    selectCategoria = 0;
    super.initState();
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
            gridViewProductos()
          ],
        ),
      ),
    );
  }

  categories() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
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
                  child: Column(
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
              );
            }),
      ),
    );
  }

  gridViewProductos() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) => ItemCard(
                  product: products[index],
                  press: () => print('${products[index]}'),
                )),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
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
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image),
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
