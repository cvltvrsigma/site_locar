import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child: Container(
              height: .9,
              width: screenWidth * 0.9,
              color: Colors.white,
            )),
        Container(
          height: screenHeight * 0.05,
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.05, right: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
/*                 Row(
                  children: [
                    CustomIconButton(
                      iconData: FontAwesomeIcons.phone,
                      url: 'tel:+551699768-8773',
                      color: Colors.white,
                    ),
                    SizedBox(width: screenWidth * 0.021),
                    CustomIconButton(
                      iconData: FontAwesomeIcons.envelope,
                      url: 'mailto:contato@locar.me',
                      color: Colors.white,
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    CustomIconButton(
                      iconData: FontAwesomeIcons.question,
                      url: 'https://www.google.com/',
                      color: Colors.blue,
                    )
                  ],
                ), */
                Text('LoCar  \u00a9 2022 | Todos os direitos reservados',
                    style: TextStyle(color: Colors.white, fontFamily: 'Barlow'))
              ],
            ),
          ),
        )
      ],
    );
  }
}
