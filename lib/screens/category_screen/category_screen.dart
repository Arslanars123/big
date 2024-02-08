import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/custom_text.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _ColorChangeOnTapState createState() => _ColorChangeOnTapState();
}

class _ColorChangeOnTapState extends State<CategoryScreen> {
  int selectedIndex = -1; // Initialize with -1 to indicate no selection

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF04121B),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("images/background.png")
            )
        ),
        child: Padding(
          padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width/30,right:MediaQuery.of(context).size.width/30 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height/60,top:MediaQuery.of(context).size.height/30 ),
                child: appBarWidget()
              ),
              SizedBox(height: height/5,),
              CustomText(
                text: "Category",
                size: 30,
                bold: FontWeight.w400,
                color: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildContainer(0,"images/socket.png","Foot Ball"),
                  buildContainer(1,"images/ball.png","BaseBall"),
                  buildContainer(2,"images/basket.png","BasketBall"),
                ],
              ),
            ],
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
  Widget buildContainer(int containerIndex,var image, String text) {
    bool isSelected = selectedIndex == containerIndex;
    Color containerColor =
    isSelected ? Color(0xFFD8C33A) : Color(0xFF264658).withOpacity(0.3);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = containerIndex;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.height / 8,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 8,
                height: MediaQuery.of(context).size.width / 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Center(
                  child: ClipOval(
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                      scale: 1.7,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/60,),
              Text(
                text,
                style: GoogleFonts.openSans(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



