import 'package:flutter/material.dart';
import 'package:flutterportfolio/constants/colors.dart';
import 'package:flutterportfolio/constants/drawer_constraints.dart';
import 'package:flutterportfolio/constants/nav_items.dart';
import 'package:flutterportfolio/constants/skill_items.dart';
import 'package:flutterportfolio/styles/style.dart';
import 'package:flutterportfolio/widgets/desktop_skills.dart';
import 'package:flutterportfolio/widgets/drawer_mobile.dart';
import 'package:flutterportfolio/widgets/header_desktop.dart';
import 'package:flutterportfolio/widgets/header_mobile.dart';
import 'package:flutterportfolio/widgets/main_desktop.dart';
import 'package:flutterportfolio/widgets/main_mobile.dart';
import 'package:flutterportfolio/widgets/mobile_skills.dart';
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
    final screenHeight = screenSize.height;

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

            if (constraints.maxWidth >= kMinDekstopWidth)
              const MainDesktop()
            else
              const MainMobile(),

            //SKILLS
            Container(
              width: screenWidth,
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
              color: Color.fromRGBO(26, 31, 54, 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //title
                  const Text(
                    "What I can do",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                  const SizedBox(height: 50),

                  //platforms and skills
                  if(constraints.maxWidth>=kMedDekstopWidth)
                    const DesktopSkills()
                  else
                    const MobileSkills(),
                  
                ],
              ),
            ),
            //PROJECTS
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
