import 'package:course_scheduler/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.midBlack,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home),
            color: AppColors.mainTextColor,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.date_range),
            color: AppColors.mainTextColor,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
            color: AppColors.mainTextColor,
          ),
        ],
      ),
    );
  }
}
