// import 'dart:ffi';

// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFFEA5F21);
const Color secondColor = Color(0xff333333);
const TargetPlatform platform = TargetPlatform.windows;

void main() {
  runApp(Calculadora());
}

abstract class CalculadoraP extends CustomPainter {
  final int days;
  final int gains;
  final int gasPrice;
  final int aluguel;

  CalculadoraP(this.days, this.gains, this.gasPrice, this.aluguel);
}

class Calculadora extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalculadoraState();
  }
}

class _CalculadoraState extends State<Calculadora> {
  double days = 1;
  double olddays = 0;
  double gains = 0; //25
  double oldgains = 0;
  double gasPrice = 0; //10
  double oldgasPrice = 0;
  double aluguel = 0; //25
  double oldaluguel = 0;
  double ganhoConcorrente = 0;
  double ganhoLocar = 0;
  double ganhoA = 0;

  bool mostraValor = false;

  int get daysCount => days.floor();
  int get gainsCount => gains.floor();
  int get gasPriceCount => gasPrice.floor();
  int get aluguelCount => aluguel.floor();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        platform: platform,
        brightness: Brightness.dark,
        sliderTheme: SliderThemeData.fromPrimaryColors(
          primaryColor: primaryColor,
          primaryColorLight: primaryColor,
          primaryColorDark: primaryColor,
          valueIndicatorTextStyle: const DefaultTextStyle.fallback().style,
        ),
      ),
      home: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            // border: Border.all(
            //   color: Colors.transparent,
            // ),
            color: Color.fromARGB(255, 233, 234, 238),
            //borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //ganhos
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                          text: 'Ganho semanal',
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: Colors.black)),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //textos
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Atual',
                                style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                    color: Colors.black)),
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Na LoCar',
                                style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                    color: Color(0xffea5f21))),
                          ),
                        ],
                      ),
                      //valores
                      Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            //color: Color.fromARGB(255, 219, 221, 228),
                          ),
                          child: mostraValor
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: RichText(
                                        text: TextSpan(
                                            text: '$ganhoA',
                                            style: GoogleFonts.raleway(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.sp,
                                                color: Color.fromARGB(
                                                    255, 63, 63, 63))),
                                      ),
                                    ),
                                    Container(
                                      child: RichText(
                                        text: TextSpan(
                                            text: '$ganhoLocar',
                                            style: GoogleFonts.raleway(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.sp,
                                                color: Colors.green)),
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: RichText(
                                        text: TextSpan(
                                            text: '0',
                                            style: GoogleFonts.raleway(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.sp,
                                                color: Color.fromARGB(
                                                    255, 63, 63, 63))),
                                      ),
                                    ),
                                    Container(
                                      child: RichText(
                                        text: TextSpan(
                                            text: '0',
                                            style: GoogleFonts.raleway(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.sp,
                                                color: Color.fromARGB(
                                                    255, 63, 63, 63))),
                                      ),
                                    ),
                                  ],
                                ))
                    ],
                  ),
                ],
              ),
              //imputs
              Column(
                children: [
                  Text("Trabalhar $daysCount dias por semana"),
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(width: 250),
                    child: Slider.adaptive(
                      activeColor: primaryColor,
                      min: 1,
                      max: 7,
                      divisions: 6,
                      value: days,
                      onChanged: (newValue) {
                        setState(() {
                          olddays = days;
                          days = newValue;
                          ganhoA = ((days * gains) - gasPrice - aluguel);
                          ganhoLocar =
                              ((days * gains) - (gasPrice * 0.53) - 475)
                                  .roundToDouble();
                        });
                      },
                    ),
                  ), //constrainedbox
                  Text("Com um ganho médio de $gainsCount reais diários"),
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(width: 250),
                    child: Slider.adaptive(
                      min: 0,
                      max: 500,
                      divisions: 100,
                      value: gains,
                      onChanged: (newValue) {
                        setState(() {
                          gains = newValue;
                          ganhoA = ((days * gains) - gasPrice - aluguel);
                          ganhoLocar =
                              ((days * gains) - (gasPrice * 0.53) - 475)
                                  .roundToDouble();
                        });
                      },
                    ),
                  ), //constbox

                  Text("Gastando $aluguelCount reais com aluguel semanalmente"),
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(width: 250),
                    child: Slider.adaptive(
                      min: 0,
                      max: 1000,
                      divisions: 50,
                      value: aluguel,
                      onChanged: (newValue) {
                        setState(() {
                          aluguel = newValue;
                          ganhoA = ((days * gains) - gasPrice - aluguel);
                          ganhoLocar =
                              ((days * gains) - (gasPrice * 0.53) - 475)
                                  .roundToDouble();
                        });
                      },
                    ),
                  ), //constbox

                  Text("E $gasPriceCount reais em gasolina nesse período"),
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(width: 250),
                    child: Slider.adaptive(
                      min: 0,
                      max: 500,
                      divisions: 50,
                      value: gasPrice,
                      onChanged: (newValue) {
                        setState(() {
                          gasPrice = newValue;
                          ganhoA = ((days * gains) - gasPrice - aluguel);
                          ganhoLocar =
                              ((days * gains) - (gasPrice * 0.53) - 475)
                                  .roundToDouble();
                        });
                      },
                    ),
                  ), //constbox
                ],
              ),

              //botao atualiza
              TextButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.green,
                      //side: BorderSide(
                      //color: Color(0xffEA5F21), width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.sp, vertical: 15.sp)),
                  child: RichText(
                    text: TextSpan(
                        text: 'Calcular',
                        style: GoogleFonts.raleway(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                  onPressed: () {
                    setState(() {
                      mostraValor = true;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
