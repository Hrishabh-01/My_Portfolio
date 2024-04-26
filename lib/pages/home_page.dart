import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/sns_links.dart';
import 'package:my_portfolio/widgets/About.dart';
import 'package:my_portfolio/widgets/certification_section.dart';
import 'package:my_portfolio/widgets/contact.dart';
import 'package:my_portfolio/widgets/drawerMob.dart';
import 'package:my_portfolio/widgets/header_desk.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/main_desk.dart';
import 'package:my_portfolio/widgets/main_mob.dart';
import 'package:my_portfolio/widgets/project_section.dart';
import 'package:my_portfolio/widgets/skill_mob.dart';
import 'package:my_portfolio/widgets/skilss_desk.dart';
import 'dart:js' as js;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(5, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth
              ? null
              : DrawerMob(onNavItemTap: (int navIndex) {
                  //call function
                  scaffoldKey.currentState?.closeEndDrawer();
                  scrollToSection(navIndex);
                }),
          body: Stack(fit: StackFit.expand, children: [
            // Background Image
            Image.asset(
              'assets/images/backgound1.jpg', // Replace with your image asset path
              fit: BoxFit.cover,
            ),
            Scaffold(
              backgroundColor:
                  Colors.transparent, // Make Scaffold background transparent

              // Make app bar background transparent

              body: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      key: navbarKeys.first,
                    ),
                    // MAIN
                    if (constraints.maxWidth >= kMinDesktopWidth)
                      HeaderDesk(onNavMenuTap: (int navIndex) {
                        //call funct
                        scrollToSection(navIndex);
                      })
                    else
                      HeaderMob(
                        onLogoTap: () {},
                        onMenuTap: () {
                          scaffoldKey.currentState?.openEndDrawer();
                        },
                      ),
                    if (constraints.maxWidth >= kMinDesktopWidth)
                      const MainDesk()
                    else
                      const MainMob(),
                    //About
                    About(
                      key: navbarKeys[1],
                    ),
                    //SKILLS
                    Container(
                      key: navbarKeys[2],
                      width: screenWidth,
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                      color: Colors.transparent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //title
                          Container(
                            width: screenWidth,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors
                                  .white24, // Set background color of the box
                              borderRadius: BorderRadius.circular(
                                  50), // Add border radius to the box
                            ),
                            padding: const EdgeInsets.all(20),
                            child: Center(
                              child: RichText(text: TextSpan(
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Preah',
                                      fontSize: 20),
                                  children: [
                                    TextSpan(text: 'What I Can Do',
                                        style: TextStyle(fontWeight: FontWeight.bold)),
                                  ]
                              )),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          if (constraints.maxWidth >= kMedDesktopWidth)
                            const SkillDesk()
                          else
                            const SkillMob(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Certificate_Section(),
                    //PROJECTS
                    Project_Section(
                      key: navbarKeys[3],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //CONTACTS
                    Contact(
                      key: navbarKeys[4],
                    ),
                    //Footer
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      child: const Text(
                        "Made by Hrishabh HΔ with ❤️",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          // color: CustomColor.whiteSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]));
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 5) {
      //open a blog page
      js.context.callMethod('open', [SnsLinks.resume]);
      return;
    }

    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
