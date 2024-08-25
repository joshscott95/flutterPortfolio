import 'package:flutter/material.dart';
import 'package:flutterportfolio/constants/colors.dart';
import 'package:flutterportfolio/constants/nav_items.dart';
import 'package:flutterportfolio/styles/style.dart';
import 'package:flutterportfolio/widgets/header_desktop.dart';
import 'package:flutterportfolio/widgets/header_mobile.dart';
import 'package:flutterportfolio/widgets/site_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.scaffoldBG,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // MAIN
            // HeaderDesktop(),
            HeaderMobile(
              onLogoTap: () {},
              onMenuTap: () {},
            ),
            
            
            //SKILLS
            Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey
                ), //PROJECTS
            Container(
              height: 500,
              width: double.maxFinite,
            ), //CONTACT
            Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey), //FOOTER
            Container(
              height: 500,
              width: double.maxFinite,
            ),
        ]
    ));
        
  }
}
