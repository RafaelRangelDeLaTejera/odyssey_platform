import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:odyssey_platform/theme/my_colors.dart';
import 'package:odyssey_platform/globals.dart' as globals;

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color.fromRGBO(128, 128, 128, 0.2),
      child: Column(
        children: [
          const SizedBox(height: 50,),
          (globals.sideBar == 0)
              ? BarButton(
                  selected: true,
                  icon: Icons.home,
                  path: "/",
                )
              : BarButton(
                  selected: false, icon: Icons.home_outlined, path: "/"), //home
                  const SizedBox(height: 80,),
          (globals.sideBar == 1)
              ? BarButton(selected: true, icon: Icons.store, path: "/store")
              : BarButton(
                  selected: false,
                  icon: Icons.store_outlined,
                  path: "/store"), //store
                                    const SizedBox(height: 80,),

          (globals.sideBar == 2)
              ? BarButton(selected: true, icon: Icons.send, path: "/messages")
              : BarButton(
                  selected: false,
                  icon: Icons.send_outlined,
                  path: "/messages"), //messages
                                    const SizedBox(height: 80,),

          (globals.sideBar == 3)
              ? BarButton(selected: true, icon: Icons.insert_chart, path: "/score")
              : BarButton(
                  selected: false,
                  icon: Icons.insert_chart_outlined,
                  path: "/score"), //scores
                                    const SizedBox(height: 80,),

        ],
      ),
    );
  }
}

class BarButton extends StatelessWidget {
  bool selected;
  IconData icon;
  String path;

  BarButton(
      {super.key,
      required this.selected,
      required this.icon,
      required this.path});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double sidePadding = screenHeight/40;
    double iconSize = screenHeight/25;
    return Row(
      children: [
        (selected)
            ? Container(
                width: 5,
                height: screenHeight/15,
                decoration: const BoxDecoration(
                  color: Colors.white, // Color of the rectangle
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight:
                          Radius.circular(20)), // Adjust radius as needed
                ),
              )
            : Container(),
         SizedBox(
          width: sidePadding,
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, path);
          },
          icon: (icon == Icons.send || icon == Icons.send_outlined)
              ? Transform.rotate(
                  angle: -45 * 3.1415926535 / 180, // Rotate by 45 degrees
                  child: Icon(
                    icon,
                    color: (selected) ? Colors.white : Colors.grey,
                    size: iconSize,
                  ),
                )
              : Icon(
                  icon,
                  color: (selected) ? Colors.white : Colors.grey,
                  size: iconSize,
                ),
        ),
         SizedBox(
          width: sidePadding,
        )
      ],
    );
  }
}
