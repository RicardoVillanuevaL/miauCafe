import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miau_caffe_mobile/views/dashboard/DashBoardPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/imagenes/main_top.png',
                width: size.width * 0.35,
              )),
          Positioned(
              top: 50,
              left: 300,
              child: Image.asset(
                'assets/imagenes/huellita.png',
                width: 60,
              )),
          Positioned(
              top: 150,
              left: 130,
              child: Image.asset(
                'assets/imagenes/huellita.png',
                width: 60,
              )),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/imagenes/login_bottom.png",
              width: size.width * 0.4,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LOGIN',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  'assets/imagenes/welcome.svg',
                  height: size.height * 0.35,
                ),
                TextFieldContainer(
                  hintText: 'Correo Electronico',
                  icon: Icons.person,
                  onChanged: (value) {},
                  obscure: false,
                  suffixIcon: null,
                ),
                TextFieldContainer(
                  hintText: 'Contraseña',
                  icon: Icons.lock,
                  onChanged: (value) {},
                  obscure: true,
                  suffixIcon: Icons.visibility,
                ),
                RoundedButton(
                  text: 'INGRESAR',
                  press: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DashBoardMenu()));
                  },
                ),
                SizedBox(height: size.height * 0.03),
                LinkTextChange(
                  pageLogin: true,
                  press: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterPage()));
                  },
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class TextFieldContainer extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool obscure;
  final IconData suffixIcon;
  TextFieldContainer(
      {Key key,
      this.hintText,
      this.icon,
      this.onChanged,
      this.obscure,
      this.suffixIcon})
      : super(key: key);

  @override
  _TextFieldContainerState createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  Color colorPrimario = Color(0xFFF1E6FF);
  Color colorSecundario = Color(0xFFb992c9);
  bool obscureChange;

  @override
  void initState() {
    obscureChange = widget.obscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: colorPrimario,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextField(
        obscureText: obscureChange,
        onChanged: widget.onChanged,
        maxLines: 1,
        cursorColor: colorSecundario,
        decoration: InputDecoration(
            icon: Icon(
              widget.icon,
              color: colorSecundario,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  obscureChange = !obscureChange;
                });
              },
              child: Icon(
                widget.suffixIcon,
                color: colorSecundario,
              ),
            ),
            hintText: widget.hintText,
            border: InputBorder.none),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: Color(0xFFb992c9),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class LinkTextChange extends StatelessWidget {
  final bool pageLogin;
  final Function press;
  const LinkTextChange({this.pageLogin, this.press});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          pageLogin ? '¿No tienes una cuenta?' : '¿Ya tienes una cuenta?',
          style: TextStyle(color: Colors.purple[300]),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: press,
          child: Text(pageLogin ? 'Regístrate' : 'Logeate',
              style: TextStyle(
                color: Color(0xFFb992c9),
                fontWeight: FontWeight.bold,
              )),
        )
      ],
    );
  }
}

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  List<String> documentos = ['DNI', 'PASAPORTE', 'BREVETE'];
  final documentController = TextEditingController();
  String selectDocument = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/imagenes/main_top.png",
                width: size.width * 0.3,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/imagenes/main_bottom.png",
                width: size.width * 0.2,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "REGISTRO",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFieldContainer(
                    hintText: 'Nombre',
                    onChanged: (value) {},
                    icon: Icons.person,
                    obscure: false,
                    suffixIcon: null,
                  ),
                  TextFieldContainer(
                    hintText: 'Apellido',
                    onChanged: (value) {},
                    icon: Icons.person,
                    obscure: false,
                    suffixIcon: null,
                  ),
                  TextFieldContainer(
                    hintText: 'Correo Electronico',
                    onChanged: (value) {},
                    icon: Icons.mail_outline,
                    obscure: false,
                    suffixIcon: null,
                  ),
                  TextFieldContainer(
                    hintText: 'Contraseña',
                    onChanged: (value) {},
                    icon: Icons.lock,
                    obscure: true,
                    suffixIcon: Icons.visibility,
                  ),
                  RoundedButton(
                    text: "REGISTRAR",
                    press: () {},
                  ),
                  SizedBox(height: size.height * 0.03),
                  LinkTextChange(
                    pageLogin: false,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginPage();
                          },
                        ),
                      );
                    },
                  ),
                  OrDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocalIcon(
                        iconSrc: "assets/iconos/facebook.svg",
                        press: () {},
                      ),
                      SocalIcon(
                        iconSrc: "assets/iconos/twitter.svg",
                        press: () {},
                      ),
                      SocalIcon(
                        iconSrc: "assets/iconos/google-plus.svg",
                        press: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: TextStyle(
                color: Color(0xFF6F35A5),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Color(0xFFD9D9D9),
        height: 1.5,
      ),
    );
  }
}

class SocalIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const SocalIcon({
    Key key,
    this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Color(0xFFb992c9),
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
