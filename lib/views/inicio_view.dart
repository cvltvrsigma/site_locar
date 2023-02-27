import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locar_website/utils/onHover.dart';
import 'package:locar_website/utils/theme_selector.dart';
import 'package:locar_website/utils/view_wrapper.dart';
import 'dart:js' as js;
import 'package:locar_website/widgets/navigation_arrow.dart';
//import 'package:locar_website/widgets/bottom_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InicioView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<InicioView> {
  double screenWidth;
  double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return ViewWrapper(desktopView: desktopView(), mobileView: mobileView());
  }

  Widget desktopView() {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/homeg.png"),
                  fit: BoxFit.cover,
                  opacity: 1),
            ),
          ),
        ),
        NavigationArrow(isBackArrow: false),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: screenWidth / 20),
                width: screenWidth * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.1),
                    headerDesktop(1),
                    SizedBox(height: screenHeight * 0.05),
                    subHeader(
                        'Alugue um veículo com as melhores condições do mercado\nEconomize no combustível e na manutenção',
                        getFontSize(false)),
                    Padding(
                      padding:
                          EdgeInsets.fromLTRB(0, this.screenHeight / 8, 0, 0),
                      // child: InkWell(
                      //   splashColor: Colors.green,
                      //   highlightColor: Colors.blue,
                      //   onTap: () {
                      //     js.context.callMethod(
                      //         'open', ['https://forms.gle/DFzdZtY21duVdwnv9']);
                      //   },
                      child: OnHoverButton(
                        builder: (isHovered) {
                          final color =
                              isHovered ? Color(0xffea5f21) : Colors.grey;
                          return TextButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: color,
                                //side: BorderSide(
                                //color: Color(0xffEA5F21), width: 2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 16)),
                            child: Text('Quero LoCar',
                                style: TextStyle(
                                    fontSize: 32, color: Colors.white)),
                            onPressed: () {
                              js.context.callMethod('open',
                                  ['https://forms.gle/DFzdZtY21duVdwnv9']);
                            },
                          );
                        },
                        //),
                      ),
                    )
                    // SizedBox(height: screenHeight * 0.01),
                    // subHeader('front page deve ser atrativa', getFontSize(false)),
                    // SizedBox(height: screenHeight * 0.01),
                    // subHeader('melhorar isso', getFontSize(false)),
                    // SizedBox(height: screenHeight * 0.1),
                  ],
                ),
              ),
              //SizedBox(width: screenWidth * 0.03),
              //pictureDesktop()
            ],
          ),
        ),
        Row()
      ],
    );
  }

  Widget mobileView() {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xff333333),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.02),
                //headerMobile(30),
                //pictureMobile(),
                //SizedBox(height: screenHeight * 0.02),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff333333),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  height: 320,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            //color: Colors.red,
                            padding: EdgeInsets.fromLTRB(45, 0, 0, 20),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          'Somos a melhor\nsolução em\nmobilidade.\n',
                                      style: GoogleFonts.raleway(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp,
                                          color: Colors.white)),
                                  TextSpan(
                                      text:
                                          'Alugue veículos\nGNV por um\npreço justo.',
                                      style: GoogleFonts.raleway(
                                          color: Color(0xFFEA5F21),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp)),
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(height: screenHeight * 0.02),
                          TextButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Color(0xffea5f21),
                                //side: BorderSide(
                                //color: Color(0xffEA5F21), width: 2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 16)),
                            child: RichText(
                              text: TextSpan(
                                  text: 'Quero LoCar',
                                  style: GoogleFonts.raleway(
                                      fontSize: (screenWidth / 3) / 7,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff333333))),
                            ),
                            onPressed: () {
                              js.context.callMethod('open',
                                  ['https://forms.gle/DFzdZtY21duVdwnv9']);
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Flexible(
                              flex: 1,
                              child: Image.asset('assets/circulo.png')),
                          SizedBox(height: screenHeight * 0.1),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Stack(
              children: [
                Image.asset('assets/foto.png'),
                Container(
                  padding: EdgeInsets.fromLTRB(32, 20, 0, 0),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Uma locadora\nparceira é assim,\n',
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: Color(0xff333333))),
                        TextSpan(
                            text: 'feita para o seu corre\nrender mais!',
                            style: GoogleFonts.raleway(
                                color: Color.fromARGB(255, 1, 32, 96),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  double getImageSize() {
    if (screenWidth > 1600 && screenHeight > 800) {
      return 500;
    } else if (screenWidth > 1300 && screenHeight > 600) {
      return 450;
    } else if (screenWidth > 1000 && screenHeight > 400) {
      return 400;
    } else {
      return 350;
    }
  }

  double getFontSize(bool isHeader) {
    double fontSize = screenWidth > 950 && screenHeight > 550 ? 30 : 25;
    return isHeader ? fontSize * 2.25 : fontSize;
  }

  Widget pictureDesktop() {
    return Container(
      height: screenHeight,
      width: screenWidth / 1.9,
      child: ClipRRect(
        //borderRadius: BorderRadius.circular(getImageSize() / 2),
        child: Image.asset(
          'assets/homeg.png',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget pictureMobile() {
    return Container(
      height: getImageSize(),
      width: getImageSize(),
      child: Image.asset(
        'assets/logo_laranja.png',
        fit: BoxFit.scaleDown,
      ),
    );
  }

  Widget headerMobile(double fontSize) {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: ThemeSelector.selectHeadline(context),
        children: <TextSpan>[
          TextSpan(
              text: 'A LOCADORA PARCEIRA DO MOTORISTA\n',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w100,
                fontSize: 18,
                letterSpacing: 3,
              )),
/*           TextSpan(
              text: '            LoCar',
              style: TextStyle(
                  color: Color(0xFFEA5F21),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Comic Sans')), */
        ],
      ),
    );
  }

  Widget headerDesktop(double fontSize) {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: ThemeSelector.selectHeadline(context),
        children: <TextSpan>[
          TextSpan(
              text: 'Uma empresa de ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48)),
          TextSpan(
              text: 'soluções em mobilidade',
              style: TextStyle(
                  color: Color(0xFFEA5F21),
                  fontWeight: FontWeight.bold,
                  fontSize: 48)),
        ],
      ),
    );
  }

  Widget subHeader(String text, double fontSize) {
    return Text(text,
        style: GoogleFonts.raleway(fontWeight: FontWeight.w200, fontSize: 22));
  }

  Widget subHeaderMobile(double fontsize) {
    return RichText(
      text: TextSpan(
        style: ThemeSelector.selectHeadline(context),
        children: <TextSpan>[
          TextSpan(
              text:
                  'Manutenção? Seguro? Gasolina? Esqueça tudo!\nAqui na LoCar você dirige e nós cuidamos do resto.',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w200,
                fontSize: 22,
              )),
        ],
      ),
    );
  }
}
