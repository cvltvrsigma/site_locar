import 'package:flutter/material.dart';
import 'package:locar_website/homepage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("images/homeg.png"), context);
    precacheImage(AssetImage("images/home2g.png"), context);
    precacheImage(AssetImage("assets/circulo.png"), context);
    return MaterialApp(
      title: 'LoCar',
      debugShowCheckedModeBanner: false,
      //locale: DevicePreview.locale(context), // Add the locale here
      //builder: DevicePreview.appBuilder,
      theme: ThemeData(

          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          fontFamily: 'Barlow',
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 70, color: Colors.white, fontFamily: 'DM Sans'),
              headline2: TextStyle(
                  fontSize: 55, color: Colors.white, fontFamily: 'DM Sans'),
              headline3: TextStyle(
                  fontSize: 40, color: Colors.white, fontFamily: 'DM Sans'),
              subtitle1: TextStyle(fontSize: 30, color: Colors.grey[500]),
              subtitle2: TextStyle(fontSize: 20, color: Colors.grey[500]),
              bodyText1:
                  TextStyle(fontSize: 20, color: Colors.white, height: 1.25),
              bodyText2:
                  TextStyle(fontSize: 17, color: Colors.white, height: 1.25),
              caption:
                  TextStyle(fontSize: 15, color: Colors.white, height: 1.25),
              button: TextStyle(
                  fontSize: 17, color: Color.fromARGB(255, 0, 0, 253)))),
      home: ResponsiveSizer(builder: (context, orientation, screenType) {
        return HomePage();
      }),
    );
  }
}
