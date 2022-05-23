import 'package:flutter/material.dart';
import 'package:save_me_applicationn/constants/constants.dart';
import 'package:save_me_applicationn/screens/chat.dart';
import 'package:save_me_applicationn/screens/donation.dart';
import 'package:save_me_applicationn/screens/home-page.dart';
import 'package:save_me_applicationn/screens/newsfeed.dart';
import 'package:save_me_applicationn/screens/profile.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final screens = [
    Home(),
    NewsFeed(),
    Donation(),
    ChatBot(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex,children: screens,),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          // ignore: prefer_const_constructors
          BottomNavigationBarItem(
            // ignore: prefer_const_constructors
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage(_selectedIndex == 1
                  ? "assets/icons/megaphone-active.png"
                  : "assets/icons/megaphone.png"),
              fit: BoxFit.contain,
              height: 25,
              width: 25,
            ),
            label: 'Newsfeed',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage(_selectedIndex == 2
                  ? "assets/icons/donation-active.png"
                  : "assets/icons/donation.png"),
              fit: BoxFit.cover,
              height: 25,
              width: 25,
            ),
            label: 'Donation',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage(_selectedIndex == 3
                  ? "assets/icons/chat-active.png"
                  : "assets/icons/chat.png"),
              fit: BoxFit.contain,
              height: 25,
              width: 25,
            ),
            label: 'Donation',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage(_selectedIndex == 4
                  ? "assets/icons/profile-active.png"
                  : "assets/icons/profile.png"),
              fit: BoxFit.contain,
              height: 25,
              width: 25,
            ),
            label: 'Donation',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: mainColor,
        onTap: _onItemTapped,
      ),
    );
  }

  // List<Widget> pages = [
  //   new HomePage(),
  //   new NewsFeed(),
  //   new Donation(),
  //   new ChatBot(),
  //   new Profile(),
  // ];
}
