// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:course_scheduler/src/providers/navbarProvider.dart';
import 'package:course_scheduler/src/view/homePage/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:course_scheduler/src/utils/colors.dart';
import 'package:provider/provider.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.date_range),
          label: 'scedule',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: context.watch<NavbarProvider>().currentIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          context.read<NavbarProvider>().setIndex(index);
        });
      },
    );
  }
}
