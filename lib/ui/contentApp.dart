import 'package:apptuoicay/ui/homePage.dart';
import 'package:apptuoicay/ui/timerPage.dart';
import 'package:apptuoicay/ui/historyPage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'settingsPage.dart';

class ContentApp extends StatefulWidget {
  const ContentApp({super.key});

  @override
  State<ContentApp> createState() => _ContentAppState();
}

class _ContentAppState extends State<ContentApp> {
  int chooseIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBarPage(),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget bottomNavigationBar(){
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFC9D2C9),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: GNav(
            tabBorderRadius: 20,
            backgroundColor: Color(0xFFC9D2C9),
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade700,
            padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
            gap: 20,
            onTabChange: (index){
              setState(() {
                chooseIndex = index;
              });
            },
            selectedIndex: chooseIndex,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                textSize: 20,
                iconSize: 30,
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
                textSize: 20,
                iconSize: 30,
              ),
              GButton(
                icon: Icons.watch_later,
                text: 'Timer',
                textSize: 20,
                iconSize: 30,
              ),
              GButton(
                icon: Icons.history_edu_outlined,
                text: 'Logs',
                textSize: 20,
                iconSize: 30,
              ),
            ]
        ),
      ),
    );
  }
  Widget getBarPage(){
    return IndexedStack(
      index: chooseIndex,
      children: <Widget>[
        HomePage(),
        SettingsPage(),
        TimerPage(),
        HistoryPage()
        // Graph(),
      ],
    );
  }
}