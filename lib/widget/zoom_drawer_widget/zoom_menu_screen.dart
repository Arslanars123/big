import 'package:big_game/screens/category_screen/category_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


import '../../screens/home/home_screen.dart';
import 'drawer_menu.dart';

class ZoomDwrMenu extends StatelessWidget {
  final zoomController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("images/background.png")
          )
      ),
      child: ZoomDrawer(
       // mainScreenScale: 0.7,
       // showShadow: false,
        controller: zoomController,
        style: DrawerStyle.defaultStyle,
          menuBackgroundColor: Colors.black,
          menuScreen: DrawerMenuu(),
          mainScreen:CategoryScreen(),
        borderRadius: 24.0,
        showShadow: false,
        angle: -15.0,
       menuScreenWidth: 500,
       slideWidth: MediaQuery.of(context).size.width*0.7,
        slideHeight:MediaQuery.of(context).size.height*0.1,
        duration: Duration(microseconds: 600),
      ),
    );
  }
}
