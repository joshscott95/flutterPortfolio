import 'package:flutter/material.dart';
import 'package:flutterportfolio/constants/colors.dart';
import 'package:flutterportfolio/constants/drawer_constraints.dart';
import 'package:flutterportfolio/constants/nav_items.dart';
import 'package:flutterportfolio/styles/style.dart';
import 'package:flutterportfolio/widgets/drawer_mobile.dart';
import 'package:flutterportfolio/widgets/header_desktop.dart';
import 'package:flutterportfolio/widgets/header_mobile.dart';
import 'package:flutterportfolio/widgets/main_desktop.dart';
import 'package:flutterportfolio/widgets/site_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBG,
          endDrawer: constraints.maxWidth >= kMinDekstopWidth
              ? null
              : const DrawerMobile(),
          body: ListView(scrollDirection: Axis.vertical, children: [
            // MAIN
            if (constraints.maxWidth >= kMinDekstopWidth)
              const HeaderDesktop()
            else
              HeaderMobile(
                onLogoTap: () {},
                onMenuTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),

            const MainDesktop(),

            //SKILLS
            Container(
                height: 500,
                width: double.maxFinite,
                color: Color.fromRGBO(26, 31, 54, 1)), //PROJECTS
            Container(
              height: 500,
              width: double.maxFinite,
            ), //CONTACT
            Container(
                height: 500,
                width: double.maxFinite,
                color: Color.fromRGBO(26, 31, 54, 1)), //FOOTER
            Container(
              height: 500,
              width: double.maxFinite,
            ),
          ]));
    });
  }
}
