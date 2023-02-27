import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//rimport 'package:locar_website/utils/theme_selector.dart';
import 'package:locar_website/utils/view_wrapper.dart';
import 'package:locar_website/widgets/bullet_list.dart';
import 'package:locar_website/widgets/navigation_arrow.dart';

class SobreView extends StatefulWidget {
  const SobreView({Key key}) : super(key: key);

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<SobreView>
    with SingleTickerProviderStateMixin {
  double screenWidth;
  double screenHeight;
  String loremIpsum = 'MEU DEUS QUE SONO';
  String titulo = 'NOSSAS CONQUISTAS:';
  String a = 'Startup Lab - Núcleo de Empreendedorismo da USP (NEU) 2020';
  String b = 'StartNEU - Núcleo de Empreendedorismo da USP (NEU) 2021';
  String c = 'Selecionada pelo programa AUSPIN (USP & Santander) 2021-2022';
  String d = 'OceanLab (NEU & Samsung) 2022';

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return ViewWrapper(
      desktopView: desktopView(),
      mobileView: mobileView(),
    );
  }

  Widget desktopView() {
    return Stack(
      children: [
        NavigationArrow(isBackArrow: true),
        NavigationArrow(isBackArrow: true),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Text('Nossas conquistas'),
            Spacer(flex: 1),
            Expanded(flex: 3, child: infoSection()),
            Spacer(flex: 1),

            // Expanded(flex:3, child: Container(
            //   child: Row(
            //     children: <Widget>[
            //       Column(
            //         children: <Widget>[
            //           Container(
            //             width: 2,
            //             height: 50,
            //             color: Colors.black,
            //           ),
            //           Container(
            //             decoration: BoxDecoration(
            //                 color: Colors.orange,
            //                 borderRadius: BorderRadius.circular(50)),
            //             child: Icon(
            //               Icons.ac_unit,
            //               color: Colors.white,
            //             ),
            //           ),
            //           Container(
            //             width: 2,
            //             height: 30,
            //             color: Colors.black,
            //           )
            //         ],
            //       )
            //     ],
            //   ),
            // ),
            // )

            Expanded(
                flex: 3,
                child: BulletList(
                  strings: [titulo, a, b, c, d],
                )),
            Spacer(flex: 1),
          ],
        )
      ],
    );
  }

  Widget mobileView() {
    return Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // children: [
        //   SizedBox(height: screenHeight * 0.05),
        //   infoText(),
        //   //SizedBox(height: screenHeight * 0.05),
        //   Container(
        //     height: screenHeight * 0.3,
        //     child: BulletList(
        //       strings: [
        //         'Manutenção inclusa',
        //         'Caução parcelado',
        //         'Aluguel semanal',
        //         'Carro GNV'
        //       ],
        //     ),
        //   ),
        // ],
        );
  }

  Widget infoSection() {
    return Container(
      width: screenWidth * 0.35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          infoText(),
          SizedBox(height: screenHeight * 0.05),
          profilePicture()
        ],
      ),
    );
  }

  Widget profilePicture() {
    return Container(
      height: screenHeight / 1080 * 347,
      width: screenWidth / 1920 * 496,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/sudestepin.png"),
            fit: BoxFit.cover,
            opacity: 1),
      ),
    );
  }

  double getImageSize() {
    if (screenWidth > 1600 && screenHeight > 800) {
      return 350;
    } else if (screenWidth > 1300 && screenHeight > 600) {
      return 300;
    } else if (screenWidth > 1000 && screenHeight > 400) {
      return 200;
    } else {
      return 150;
    }
  }

  Widget infoText() {
    return Column(
      children: [
        Text(
          'Somos uma Startup de gestão em mobilidade e financeirização de ativos reais, selecionada pelo Programa Santander USP de Inovação e Empreendedorismo para o ano de 2022. Oferecemos soluções para quem quer investir em mobilidade.',
          textAlign: TextAlign.start,
          overflow: TextOverflow.clip,
          style: GoogleFonts.raleway(fontWeight: FontWeight.w100, fontSize: 24),
        ),
      ],
    );
  }
}

// class TimeLine extends StatefulWidget {
//   const TimeLine({
//     Key key,
//   }) : super(key: key);

//   @override
//   _TimeLineState createState() => _TimeLineState();
// }

// class _TimeLineState extends State<TimeLine> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text('timeline'),
//     );
//   }
// }
