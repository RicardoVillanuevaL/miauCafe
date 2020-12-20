import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:miau_caffe_mobile/views/constants/complementsScaffold.dart';
import 'package:miau_caffe_mobile/views/constants/constantsDesign.dart';
import 'package:intl/intl.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';

class ReservasPage extends StatefulWidget {
  ReservasPage({Key key}) : super(key: key);

  @override
  _ReservasPageState createState() => _ReservasPageState();
}

class _ReservasPageState extends State<ReservasPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            BodyReserva(
              height: size.height * 0.20,
            ),
            Positioned(
              top: 0,
              child: SpecialAppBar(
                title: 'Reservaciones',
                height: size.height * 0.24,
                child: Container(),
                icon: Icons.local_cafe,
                width: size.width,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: SpecialBottomSheet(
        width: size.width,
      ),
    );
  }
}

class BodyReserva extends StatefulWidget {
  final double height;
  const BodyReserva({
    this.height,
    Key key,
  }) : super(key: key);

  @override
  _BodyReservaState createState() => _BodyReservaState();
}

class _BodyReservaState extends State<BodyReserva> {
  double cantPersonas, cantGatos;
  bool gatos;
  int setSelectGato;
  String diaReserva;
  TimeOfDay _time = TimeOfDay(hour: 11, minute: 00);

  @override
  void initState() {
    setSelectGato = 1;
    cantPersonas = 1;
    cantGatos = 1;
    gatos = true;
    inistanciarDiaHora();
    super.initState();
  }

  void inistanciarDiaHora() {
    diaReserva = DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }

  Future<Null> selectTimePicker(BuildContext context) async {
    DateTime temp = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: temp,
        firstDate: DateTime(temp.year, temp.month),
        lastDate: temp.add(Duration(days: 60)));
    if (picked != null && picked != temp) {
      setState(() {
        diaReserva = DateFormat('dd-MM-yyyy').format(picked);
        print(temp.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: widget.height / 2,
            ),
            Text(
              'Seleccione Fecha de Reserva',
              style: styleTextFieldReserva,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$diaReserva'),
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => selectTimePicker(context),
                )
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Seleccione Hora',
              style: styleTextFieldReserva,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${_time.format(context)}'),
                IconButton(
                  icon: Icon(Icons.timer),
                  onPressed: () {
                    Navigator.of(context).push(
                      showPicker(
                        context: context,
                        value: _time,
                        onChange: onTimeChanged,
                        minuteInterval: MinuteInterval.FIVE,
                        disableHour: false,
                        disableMinute: false,
                        minMinute: 7,
                        maxMinute: 56,
                        // Optional onChange to receive value as DateTime
                        onChangeDateTime: (DateTime dateTime) {
                          print(dateTime);
                        },
                      ),
                    );
                  },
                )
              ],
            ),
            SizedBox(height: 25),
            Text(
              'Cantidad de Personas',
              style: styleTextFieldReserva,
            ),
            Container(
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    child: Text(
                      '1',
                      style: styleTextSlider,
                    ),
                    bottom: 0,
                    left: 20,
                  ),
                  Positioned(
                    child: Text(
                      '8',
                      style: styleTextSlider,
                    ),
                    bottom: 0,
                    left: 342,
                  ),
                  Positioned(
                    child: Text(
                      '${cantPersonas.toInt()}',
                      style: styleTextSlider,
                    ),
                    bottom: 0,
                    left: 20 + (cantPersonas - 1) * (46),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Slider(
                      onChanged: (value) {
                        setState(() {
                          cantPersonas = value;
                        });
                      },
                      inactiveColor: colorPrimario,
                      activeColor: colorSecundario,
                      value: cantPersonas,
                      min: 1,
                      max: 8,
                      divisions: 7,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Mesas Disponibles',
                  style: styleTextFieldReserva,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '¿Va con gato?',
                  style: styleTextFieldReserva,
                ),
                Container(
                  child: Row(
                    children: [
                      Radio(
                        groupValue: setSelectGato,
                        value: 1,
                        onChanged: (val) {
                          setState(() {
                            setSelectGato = val;
                            gatos = true;
                          });
                        },
                      ),
                      Text(
                        'SI',
                        style: styleTextFieldReserva,
                      ),
                      Radio(
                        groupValue: setSelectGato,
                        value: 0,
                        onChanged: (val) {
                          setState(() {
                            setSelectGato = val;
                            gatos = false;
                          });
                        },
                      ),
                      Text(
                        'NO',
                        style: styleTextFieldReserva,
                      ),
                    ],
                  ),
                )
              ],
            ),
            gatos
                ? Container(
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Text(
                            '1',
                            style: styleTextSlider,
                          ),
                          bottom: 0,
                          left: 20,
                        ),
                        Positioned(
                          child: Text(
                            '4',
                            style: styleTextSlider,
                          ),
                          bottom: 0,
                          left: 342,
                        ),
                        Positioned(
                          child: Text(
                            '${cantGatos.toInt()}',
                            style: styleTextSlider,
                          ),
                          bottom: 0,
                          left: 20 + (cantGatos - 1) * (107),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Slider(
                            onChanged: (value) {
                              setState(() {
                                cantGatos = value;
                              });
                            },
                            inactiveColor: colorPrimario,
                            activeColor: colorSecundario,
                            value: cantGatos,
                            min: 1,
                            max: 4,
                            divisions: 3,
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: colorPrimario,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Text(
                  'Reservar',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: widget.height / 2,
            ),
          ],
        ),
      ),
    );
  }
}
