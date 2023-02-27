//import 'dart:ffi';

// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locar_website/utils/content_view.dart';
import 'package:locar_website/utils/tab_controller_handler.dart';
import 'package:locar_website/utils/view_wrapper.dart';
import 'package:locar_website/views/sobre_view.dart';
import 'package:locar_website/views/inicio_view.dart';
import 'package:locar_website/views/compare_view.dart';
//import 'package:locar_website/views/contato_view.dart';
import 'package:locar_website/widgets/bottom_bar.dart';
import 'dart:js' as js;
// import 'package:responsive_sizer/responsive_sizer.dart';
//import 'package:locar_website/widgets/whatsapp_button.dart';
import 'package:locar_website/widgets/custom_tab.dart';
import 'package:locar_website/widgets/custom_tab_bar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController; //
  ItemScrollController itemScrollController;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  double screenHeight;
  double screenWidth;
  double topPadding;
  double bottomPadding;
  double sidePadding;

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      color: Color(0xFF333333),
      border: Border(
        bottom: BorderSide(
          color: Color.fromARGB(190, 33, 33, 33),
          width: 1.5,
        ),
      ),
    );
  }

  List<ContentView> contentViews = [
    ContentView(
      tab: CustomTab(title: 'Inicio'),
      content: InicioView(),
    ),
    ContentView(
      tab: CustomTab(title: 'Compare'),
      content: CompareView(),
    ),
    ContentView(
      tab: CustomTab(title: 'Sobre'),
      content: SobreView(),
    ),
    // ContentView(
    //   tab: CustomTab(title: 'Contato'),
    //   content: ContatoView(),
    // )
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
    itemScrollController = ItemScrollController();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight * 0.0;
    double bottomPadding = screenHeight * 0;
    sidePadding = screenWidth * 0.05;

    print('Width: $screenWidth');
    print('Height: $screenHeight');
    return Scaffold(
      floatingActionButton: Container(
        height: screenHeight / 10,
        width: screenHeight / 10,
        child: FloatingActionButton(
          onPressed: () {
            js.context.callMethod('open', ['https://wa.me/5516997688773']);
          },
          backgroundColor: Colors.green,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(2, 0, 0, 8),
            child: Icon(
              FontAwesomeIcons.whatsapp,
              size: screenHeight / 14,
            ),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 233, 234, 238),
      key: scaffoldKey,
      endDrawer: drawer(),
      body: Padding(
        padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child:
            ViewWrapper(desktopView: desktopView(), mobileView: mobileView()),
      ),
    );
  }

  BoxDecoration decoTopPanel() {
    return BoxDecoration(
      color: Color(0xFF333333),
      border: Border(bottom: BorderSide(color: Colors.black38, width: 1.0)),
    );
  }

  Widget desktopView() {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.end,
      //crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        /// menu seleção de slides
        Container(
            padding: const EdgeInsets.fromLTRB(50, 20, 0, 20),
            height: screenHeight * 0.1,
            decoration: decoTopPanel(),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/cortada.png'), // <-- picture
                  CustomTabBar(
                      controller: tabController,
                      tabs: contentViews.map((e) => e.tab).toList()),
                ])),

        /// slides
        Container(
          height: screenHeight * 0.84,
          child: TabControllerHandler(
            tabController: tabController,
            child: TabBarView(
              controller: tabController,
              children: contentViews.map((e) => e.content).toList(),
            ),
          ),
        ),

        /// Bottom Bar
        BottomBar()
      ],
    );
  }

  Widget mobileView() {
    return Container(
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: myBoxDecoration(),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 180, child: Image.asset('assets/logo_branco.png')),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: TextButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0xffea5f21),
                        //side: BorderSide(
                        //color: Color(0xffEA5F21), width: 2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
                    child: RichText(
                      text: TextSpan(
                          text: 'Quero LoCar',
                          style: GoogleFonts.raleway(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff333333))),
                    ),
                    onPressed: () {
                      js.context.callMethod(
                          'open', ['https://forms.gle/DFzdZtY21duVdwnv9']);
                    },
                  ),
                ),
                // IconButton(
                //     iconSize: screenWidth * 0.08,
                //     icon: Icon(Icons.menu_sharp),
                //     color: Colors.white,
                //     splashColor: Colors.white,
                //     onPressed: () => scaffoldKey.currentState.openEndDrawer()),
              ],
            ),
          ),
          Expanded(
            child: ScrollablePositionedList.builder(
              scrollDirection: Axis.vertical,
              itemScrollController: itemScrollController,
              itemCount: contentViews.length,
              itemBuilder: (context, index) => contentViews[index].content,
            ),
          )
        ],
      ),
    );
  }

  Widget drawer() {
    return Container(
      width: screenWidth * 0.5,
      child: Drawer(
        child: ListView(
          children: [Container(height: screenHeight * 0.1)] +
              contentViews
                  .map((e) => Container(
                        child: ListTile(
                          title: Text(
                            e.tab.title,
                            style: Theme.of(context).textTheme.button,
                          ),
                          onTap: () {
                            itemScrollController.scrollTo(
                                index: contentViews.indexOf(e),
                                duration: Duration(milliseconds: 200));
                            Navigator.pop(context);
                          },
                        ),
                      ))
                  .toList(),
        ),
      ),
    );
  }
}
