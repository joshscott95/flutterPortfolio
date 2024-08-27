import 'package:flutter/material.dart';
import 'package:flutterportfolio/constants/colors.dart';
import 'package:flutterportfolio/constants/drawer_constraints.dart';
import 'package:flutterportfolio/constants/nav_items.dart';
import 'package:flutterportfolio/constants/skill_items.dart';
import 'package:flutterportfolio/constants/sns_links.dart';
import 'package:flutterportfolio/styles/style.dart';
import 'package:flutterportfolio/widgets/contact_section.dart';
import 'package:flutterportfolio/widgets/custom_textfield.dart';
import 'package:flutterportfolio/widgets/desktop_skills.dart';
import 'package:flutterportfolio/widgets/drawer_mobile.dart';
import 'package:flutterportfolio/widgets/footer.dart';
import 'package:flutterportfolio/widgets/header_desktop.dart';
import 'package:flutterportfolio/widgets/header_mobile.dart';
import 'package:flutterportfolio/widgets/main_desktop.dart';
import 'package:flutterportfolio/widgets/main_mobile.dart';
import 'package:flutterportfolio/widgets/mobile_skills.dart';
import 'package:flutterportfolio/widgets/project_card.dart';
import 'package:flutterportfolio/widgets/projects_section.dart';
import 'package:flutterportfolio/widgets/site_logo.dart';
import 'package:flutterportfolio/utils/project_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

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
            : DrawerMobile(
                onNavItemTap: (int navIndex) {
                  //call function
                  scaffoldKey.currentState?.closeEndDrawer();

                  scrollToSection(navIndex);
                },
              ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/tech.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6),
                BlendMode.dstATop,
              ),
            ),
          ),
          child: SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(key: navbarKeys.first),
                // MAIN
                if (constraints.maxWidth >= kMinDekstopWidth)
                  HeaderDesktop(onNavMenuTap: (int navIndex) {
                    //call function
                  })
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
                  key: navbarKeys[1],
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: const Color.fromRGBO(26, 31, 54, 1),
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
                      if (constraints.maxWidth >= kMedDekstopWidth)
                        const DesktopSkills()
                      else
                        const MobileSkills(),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                //PROJECTS
                ProjectsSection(
                  key: navbarKeys[2],
                ),

                const SizedBox(height: 30),
                //CONTACT
                ContactSection(
                  key: navbarKeys[3],
                ),
                const SizedBox(height: 30),

                //FOOTER
                Footer(),
              ],
            ),
          ),
        ),
      );
    });
  }

 void scrollToSection(int navIndex) async {
  if (navIndex == 4) {
    // open Twitter link
    final Uri url = Uri.parse(SnsLinks.twitter);
    if (await canLaunchUrlString(SnsLinks.twitter)) {
      await launchUrlString(SnsLinks.twitter);
    } else {
      // Handle error - unable to launch URL
      print('Could not launch $url');
    }
    return;
  }
  final key = navbarKeys[navIndex];
  Scrollable.ensureVisible(key.currentContext!, 
    duration: const Duration(milliseconds: 500), 
    curve: Curves.easeInOut
  );
}
}