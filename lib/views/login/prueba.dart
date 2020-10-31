import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:miau_caffe_mobile/views/login/OnboardPage.dart';

class PruebaPage extends StatelessWidget {
  const PruebaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola'),
        leading: Icon(Icons.local_cafe),
      ),
      body: Center(
        child: FadeInDown(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue[900],
                ),
                Text(
                  'Hola',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue[900],
                ),
                Text(
                  'Hola',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue[900],
                ),
                Text(
                  'Hola',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => OnBoardPage()));
        },
        child: Icon(Icons.add_location),
      ),
    );
  }
}
