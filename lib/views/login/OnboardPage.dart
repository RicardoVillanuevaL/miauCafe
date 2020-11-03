import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miau_caffe_mobile/views/login/LoginPage.dart';

class OnBoardPage extends StatefulWidget {
  OnBoardPage({Key key}) : super(key: key);

  @override
  _OnBoardPageState createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicador() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(
          i == _currentPage ? _indicadorPage(true) : _indicadorPage(false));
    }
    return list;
  }

  Widget _indicadorPage(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF87569A),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightView = size.height;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                0.1,
                0.4,
                0.7,
                0.9
              ],
                  colors: [
                Color(0xFFbeaac6),
                Color(0xFFb992c9),
                Color(0xFFb992c9),
                Color(0xFFbeaac6),
              ])),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                skipWidget(),
                pageView(heightView),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicador(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Siguiente',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: heightView / 8.4,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    CupertinoPageRoute(builder: (context) => LoginPage()),
                    (route) => false),
                child: Center(
                  child: Text(
                    'Empezar',
                    style: TextStyle(
                      color: Color(0xFFb992c9),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }

  Widget pageView(double height) {
    return Container(
      height: height / 1.4,
      child: PageView(
        physics: ClampingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: <Widget>[
          itemPageView(
              'assets/imagenes/adoptionSVG.svg',
              'Bienvenidos Humanos',
              'Cualquier persona puede acceder a nuestro espacio felino, sin importar edad o condición.Tenemos una tarifa general para nuestros visitantes y otras especiales para niños hasta 12 años (incluido).',
              height),
          itemPageView(
              'assets/imagenes/muffinSVG.svg',
              '¿Dónde están los gatos?',
              'Los gatos de nuestra colonia se mueven libremente por el espacio, juegan, duermen, se acicalan... y nuestros visitantes pueden ir recorriendo el espacio e interactuar con ellos',
              height),
          itemPageView(
              'assets/imagenes/coffeSVG.svg',
              'Disfruta en Miau Cafe',
              'Nos apasiona los gatos, el café y buenos momentos con amigos.\nPero sobretodo los GATOS.',
              height),
        ],
      ),
    );
  }

  itemPageView(String image, String subtitulo, String texto, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: SvgPicture.asset(
              image,
              height: height / 2.8,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            subtitulo,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'CM Sans Serif',
              fontSize: 26.0,
              height: 1.5,
            ),
          ),
          SizedBox(height: 15.0),
          Flexible(
            child: Text(
              texto,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget skipWidget() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(builder: (context) => LoginPage()),
            (route) => false),
        child: Text(
          'Skip',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
