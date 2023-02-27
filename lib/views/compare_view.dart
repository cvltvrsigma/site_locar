// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:locar_website/utils/project_model.dart';
// import 'package:locar_website/utils/theme_selector.dart';
import 'package:locar_website/utils/view_wrapper.dart';
import 'package:locar_website/widgets/navigation_arrow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locar_website/utils/onHover.dart';
import 'dart:js' as js;
import 'package:responsive_sizer/responsive_sizer.dart';
//import 'package:locar_website/widgets/project_image.dart';
//import 'package:locar_website/widgets/project_model.dart';
import 'package:locar_website/utils/calculadora.dart';
import 'dart:math';

class CompareView extends StatefulWidget {
  const CompareView({Key key}) : super(key: key);

  @override
  _ProjectsViewState createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<CompareView> {
  double screenWidth;
  double screenHeight;
  int selectedIndex = 0;
  List<Project> projects = [
    Project(
        title: 'Manutenção inclusa',
        imageURL: 'manu.png',
        description:
            'Pneu furado? Carburador quebrado? Imagina o prejuízo... só que não! Todos os nossos veículos são 100% assegurados, entao é simples quebrou? trocou!'),
    Project(
        title: 'Caução Parcelado',
        imageURL: 'parcela.png',
        description:
            'Ta precisando fazer umas corridas mas não ta com grana pro caução? Acho que por essa você nao esperava, somos a unica lcoadora do brasil com parcelamento do caução'),
    Project(
        title: 'Aluguel Semanal',
        imageURL: 'deal.png',
        description:
            'Flexibiidade é tudo né. Pra que alugar o carro mensalmente se a maioria dos motoristas prefere o pagamento semanal? Vocês pediram e nós escutamos')
  ];

  @override
  void didChangeDependencies() {
    precacheImage(AssetImage('project1.jpg'), context);
    precacheImage(AssetImage('project2.jpg'), context);
    precacheImage(AssetImage('project3.jpg'), context);
    super.didChangeDependencies();
  }

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
    // double space = MediaQuery.of(context).size.height * 0.03;
    // List<Widget> images =
    //     List.generate((projects.length * 1.5).ceil(), (index) {
    //   if (index.isEven) {
    //     return ProjectImage(
    //         project: projects[index ~/ 2],
    //         onPressed: () => updateIndex(index ~/ 2));
    //   } else {
    //     return SizedBox(height: space);
    //   }
    // });

    return Stack(
      children: [
        //background
        Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/home2g.png"), fit: BoxFit.cover),
            ),
          ),
        ),
        //flechas
        NavigationArrow(isBackArrow: true),
        NavigationArrow(isBackArrow: false),
        //row princial
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //vantagens
            SizedBox(
              width: screenWidth / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //vantagens
                  Text(
                    'Vantagens',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                        fontSize: (screenWidth / 3) / 7,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: screenHeight / 30,
                  ),
                  Container(
                    width: screenWidth / 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            vantagem(Icons.taxi_alert, 'Seguro sob Medida'),
                            SizedBox(
                              width: screenWidth / 50,
                            ),
                            vantagem(
                                Icons.handshake_rounded, 'Negociação flexível'),
                            SizedBox(
                              width: screenWidth / 50,
                            ),
                            vantagem(
                                Icons.event_repeat_outlined, 'Aluguel Semanal'),
                          ],
                        ),
                        SizedBox(height: screenHeight / 90),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            vantagem(Icons.gavel_rounded, 'Menos Burocracia'),
                            SizedBox(
                              width: screenWidth / 50,
                            ),
                            vantagem(Icons.engineering_rounded,
                                'Manutenção Inclusa'),
                            SizedBox(
                              width: screenWidth / 50,
                            ),
                            vantagem(
                                Icons.savings_outlined, 'Caução Parcelado'),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight / 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            vantagem(Icons.recycling, 'Carro GNV'),
                            SizedBox(
                              width: screenWidth / 50,
                            ),
                            vantagem(Icons.trending_up, 'Melhor preço'),
                            SizedBox(
                              width: screenWidth / 50,
                            ),
                            vantagem(Icons.calculate, 'Gestor de corridas'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            //texto
            SizedBox(
              width: screenWidth / 3,
              child: Column(
                children: [
                  //texto diferene das outras
                  Container(
                    width: screenWidth / 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.05),
                        //texto
                        RichText(
                          text: TextSpan(
                              text: 'Diferente de outras',
                              style: GoogleFonts.raleway(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                        ),
                        RichText(
                            text: TextSpan(
                                text:
                                    'a LoCar é uma empresa pensada para ajudar o motorista profissional no dia a dia',
                                style: GoogleFonts.raleway(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ))),

                        SizedBox(height: screenHeight / 4),
                        //botao calculadora / PRECISA LINKAR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        OnHoverButton(
                          builder: (isHovered) {
                            final color =
                                isHovered ? Color(0xffea5f21) : Colors.grey;
                            return TextButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: color,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 32, vertical: 16)),
                              child: Text('Compare os benefícios',
                                  style: TextStyle(
                                      fontSize: 32, color: Colors.white)),
                              onPressed: () {
                                js.context.callMethod(
                                    'open', ['https://www.calculat.org/']);
                              },
                            );
                          },
                          //),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
            // //icons
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: images,
            // ),
            // SizedBox(width: space),
            // //negocinho q mexe
            // Container(
            //   height: screenHeight * 0.2 * 2 + space * 2,
            //   child: Stack(
            //     children: [
            //       AnimatedAlign(
            //         alignment: selectedIndex == 0
            //             ? Alignment.topCenter
            //             : selectedIndex == 1
            //                 ? Alignment.center
            //                 : Alignment.bottomCenter,
            //         duration: Duration(milliseconds: 400),
            //         curve: Curves.fastOutSlowIn,
            //         child: Row(
            //           children: [
            //             Container(
            //               color: Color(0xFFEA5F21),
            //               width: screenWidth * 0.05,
            //               height: 3,
            //             ),
            //             texto(selectedIndex)
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(width: space),
            // //texto
            // Expanded(child: ProjectEntry(project: projects[selectedIndex])),
            // Column(
            //   children: [
            //     SizedBox(width: screenWidth * 0.35),
            //     Text('QUEM COMPARA ESCOLHE LOCAR!',
            //         style: GoogleFonts.raleway(
            //             fontWeight: FontWeight.w200, fontSize: 32)),
            //     SizedBox(height: screenHeight * 0.01),
            //     Text(
            //         'Diferente de outras, a LoCar é uma empresa \nque tem como maior objetivo ajudar o motorista\nprofissional no dia a dia.\nAlém de uma frota 100% GNV, que gera uma economia\nde até 60% - temos diversas outras vantagens, confira:',
            //         style: GoogleFonts.raleway(
            //             fontWeight: FontWeight.w200, fontSize: 22)),
            //   ],
            // ), //texto
          ],
        )
      ],
    );
  }

  Widget mobileView() {
    return Column(
      children: [
        //quadrado azul
        Container(
          width: screenWidth,
          //height: Adaptive.h(53),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 1, 32, 96),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.03),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                      text: 'Só comparar',
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.white)),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.payment_outlined,
                    color: Colors.white,
                    size: 40.sp,
                  ),
                  SizedBox(
                    width: screenWidth / 12,
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RichText(
                        text: TextSpan(
                            text:
                                'Pagamento em PIX.\nCartão ou boleto.\nCaução parcelado.\nMelhor preço.',
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                                color: Color(0xffea5f21))),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: RichText(
                        text: TextSpan(
                            text:
                                'Carros GNV.\nManutenção inclusa.\nRastreador e seguro.',
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                                color: Color(0xffea5f21))),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth / 12,
                  ),
                  Icon(
                    Icons.directions_car,
                    color: Colors.white,
                    size: 40.sp,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.description,
                    color: Colors.white,
                    size: 40.sp,
                  ),
                  SizedBox(
                    width: screenWidth / 12,
                  ),
                  Container(
                    child: RichText(
                      text: TextSpan(
                          text:
                              'Análise online em 48h\nLocação semanal.\nContrato digital.',
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: Color(0xffea5f21))),
                    ),
                  )
                ],
              ),
              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
        //textos + botao calculadora
        Column(
          children: [
            //Caixa de Texto 1
            Container(
              padding: EdgeInsets.fromLTRB(70, 50, 70, 50),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            r"Caução a partir de R$800,00, em até 10x sem juros. ",
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Color.fromARGB(255, 1, 32, 96))),
                    TextSpan(
                        text:
                            r'Locação completa a partir de R$475,00. Você dirige nós cuidamos do resto.',
                        style: GoogleFonts.raleway(
                            color: Color(0xff333333),
                            fontWeight: FontWeight.bold,
                            fontSize: 28)),
                  ],
                ),
              ),
            ),

            //new Calculadora(),

            //botao abre calculadora
            TextButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: Color(0xffea5f21),
                  //side: BorderSide(
                  //color: Color(0xffEA5F21), width: 2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.sp, vertical: 15.sp)),
              child: RichText(
                text: TextSpan(
                    text: 'Veja o quanto ganharia!',
                    style: GoogleFonts.raleway(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white70)),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        // shape: RoundedRectangleBorder(
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(30.0))),

                        /* ANIMAÇÃO  TO-DO***********************************************************************************/
                        // insetAnimationDuration: Duration(milliseconds: 1000),
                        // insetAnimationCurve: Curves.elasticIn,
                        backgroundColor: Color.fromARGB(251, 1, 255, 1),
                        insetPadding:
                            EdgeInsets.fromLTRB(25.sp, 50.sp, 25.sp, 45.sp),
                        child: Calculadora(),
                      );
                    });
              },
            ),

            //Caixa de Texto 2
            Container(
              padding: EdgeInsets.fromLTRB(70, 50, 70, 50),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            r"Transparência e flexibilidade são os nossos valores. ",
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Color(0xffea5f21))),
                    TextSpan(
                        text: r'Cancele após 2 semanas, quando quiser.',
                        style: GoogleFonts.raleway(
                            color: Color(0xff333333),
                            fontWeight: FontWeight.bold,
                            fontSize: 28)),
                  ],
                ),
              ),
            ),
          ],
        ),
        //caixa cinza no final
        Container(
          decoration: BoxDecoration(
            color: Color(0xff333333),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Adaptive.w(20),
                    child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(pi),
                        child: Image.asset('assets/circulo.png',
                            color: Color.fromARGB(255, 1, 32, 96)
                                .withOpacity(1.0))),
                  ),

                  //text
                  Container(
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      'Atuamos nos estados de\nSão Paulo e Rio de Janeiro.',
                                  style: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                      color: Colors.white)),
                              TextSpan(
                                  text:
                                      '\n\nAv Tereza Palmeira Gallon, 425\nRibeirão Preto, SP 14040-600.\n\nRua Simão Cunha Gago, 107\nVolta Redonda, RJ. 27213-170\n',
                                  style: GoogleFonts.raleway(
                                      color: Color(0xFFEA5F21),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp)),
                              TextSpan(
                                  text: '\nCentral de Atendimento\n\n',
                                  style: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                      color: Colors.white)),
                              TextSpan(
                                  text: '(16) 9 9768 8773',
                                  style: GoogleFonts.raleway(
                                      color: Color(0xFFEA5F21),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.sp)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.1),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
              RichText(
                text: TextSpan(
                    text:
                        'LoCar Soluções em locação ltda. | Todos os direitos reservados',
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w100,
                        fontSize: 14,
                        color: Colors.white)),
              ),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ],
    );
  }

  Widget texto(indice) {
    // return Column(
    //   children: [
    //     Text(
    //       projects[selectedIndex].title,
    //       style: ThemeSelector.selectSubHeadline(context),
    //     ),
    //     SizedBox(height: screenHeight * 0.05),
    //     Text(
    //       projects[selectedIndex].description,
    //       style: ThemeSelector.selectBodyText(context),
    //     )
    //   ],
    // );
    return Container(
      child: Text('a'),
    );
  }

  Widget vantagem(imagem, texto) {
    return Container(
      width: (screenWidth / 3) / 5,
      //color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            imagem,
            size: screenWidth / 15,
            color: Color(0xffea5f21),
          ),
          Text(
            texto,
            style:
                GoogleFonts.raleway(fontWeight: FontWeight.w200, fontSize: 16),
          )
        ],
      ),
    );
  }

  void updateIndex(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }
}
