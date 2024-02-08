import 'package:big_game/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return  Scaffold(
      key: scaffoldKey,
 backgroundColor: Color(0xff052f50),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                appBarWidget(),
                SizedBox(height: height*0.05,),

              ],
            ),
          ),
        ),
      ),

    );
  }

  appBarWidget(){
    return   Padding(
      padding: const EdgeInsets.only(top: 30,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap:(){
              ZoomDrawer.of(context)!.toggle();
            },
            child: Image.asset(
              "images/drawer.png",
              height: 50,
              width: 50,
              fit: BoxFit.fill,
            ),
          ),

        ],
      ),
    );
  }



}
