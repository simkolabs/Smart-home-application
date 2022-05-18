import 'package:flutter/material.dart';
import 'package:home_security/user/Homemap.dart';
import 'package:home_security/user/allshops.dart';
import 'package:home_security/user/loginuser.dart';
import 'package:home_security/user/profile.dart';

import 'Home.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int _selected=0;
  bool started=false;
  void _ontapped(int index){
    setState(() {
      _selected=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
          child:<Widget>[
            HomeMap(),
            shops(),
            profile_main()

          ].elementAt(_selected)
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex:_selected ,
        onTap: _ontapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 30,),
            label: "Home",




          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications,size: 30),
            label: "Notifications",


          ),


          BottomNavigationBarItem(
            icon: Icon(Icons.person,size: 30),
            label: "Profile",


          )
        ],
      ),
    );
  }
}
