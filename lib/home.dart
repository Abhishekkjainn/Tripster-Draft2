import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tripster_draft2/screens/homeScreen.dart';
import 'package:tripster_draft2/screens/MyTripsScreen.dart';
import 'package:tripster_draft2/screens/ProfileScreen.dart';
import 'package:tripster_draft2/screens/SupportScreen.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int ScreenIndex = 0;
  List Screens = [
    const HomeScreen(),
    const MyTripsScreen(),
    const SupportScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarMain(),
      bottomNavigationBar: BottomNav(),
      body: Screens[ScreenIndex],
    );
  }

  Padding BottomNav() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
      child: GNav(
          haptic: true, // haptic feedback
          tabBorderRadius: 40,
          tabActiveBorder:
              Border.all(color: Colors.black, width: 2), // tab button border
          onTabChange: (value) {
            setState(() {
              ScreenIndex = value;
              print(ScreenIndex);
            });
          },
          // curve: Curves.easeOutExpo, // tab animation curves
          duration: Duration(milliseconds: 300), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: Colors.grey, // unselected icon color
          activeColor: Colors.black, // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor:
              Colors.yellow.withOpacity(0), // selected tab background color
          padding: EdgeInsets.symmetric(
              horizontal: 20, vertical: 10), // navigation bar padding
          tabs: [
            GButton(
              icon: CupertinoIcons.house_alt_fill,
              text: 'Home',
            ),
            GButton(
              icon: CupertinoIcons.tickets_fill,
              text: 'My Trips',
            ),
            GButton(
              icon: CupertinoIcons.headphones,
              text: 'Support',
            ),
            GButton(
              icon: CupertinoIcons.person_alt,
              text: 'Profile',
            )
          ]),
    );
  }

  //Main App Bar for Home
  AppBar AppbarMain() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 255, 214, 0),
      toolbarHeight: 80,
      centerTitle: true,
      title: Image(
        image: AssetImage('assets/images/Tripster-logo.png'),
        width: 100,
      ),
      actions: [
        IconButton(
            onPressed: () {
              print('Pressed Notification');
            },
            icon: Icon(
              CupertinoIcons.bell,
              color: Colors.black,
            ))
      ],
    );
  }
}



// Home - Routes , AppBar , Bottom Nav bar