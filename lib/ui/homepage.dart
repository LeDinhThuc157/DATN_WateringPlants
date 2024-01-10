import 'package:apptuoicay/ui/timerPage.dart';
import 'package:apptuoicay/ui/historyPage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'myhome.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                icon: Icons.heat_pump,
                text: 'Home',
                textSize: 25,
                iconSize: 40,
              ),
              // GButton(
              //   icon: Icons.location_on,
              //   text: 'Map',
              //   textSize: 25,
              //   iconSize: 40,
              // ),
              GButton(
                icon: Icons.watch_later,
                text: 'Timer',
                textSize: 25,
                iconSize: 40,
              ),
              GButton(
                icon: Icons.history_edu_outlined,
                text: 'Logs',
                textSize: 25,
                iconSize: 40,
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
        // MyHomePage(),
        MyHomePage(),
        TimerPage(),
        HistoryPage()
        // Graph(),
      ],
    );
  }
}