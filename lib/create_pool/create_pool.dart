import 'dart:io';

import 'package:big_game/auth/sign_up_screen.dart';
import 'package:big_game/create_pool/pool_detail_screen.dart';
import 'package:big_game/widget/custom_text.dart';
import 'package:big_game/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class CeatePoolScreen extends StatefulWidget {
  @override
  State<CeatePoolScreen> createState() => _CeatePoolScreenState();
}

class _CeatePoolScreenState extends State<CeatePoolScreen> {
  final teamOneController = TextEditingController();
  final teamTwoController = TextEditingController();
  Color selectedColor1 = Colors.yellow; // Default color
  Color selectedColor2 = Colors.red; // Default color

  void changeColor1(Color color) {
    setState(() {
      selectedColor1 = color;
    });
  }

  void changeColor2(Color color) {
    setState(() {
      selectedColor2 = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("images/Vector 10.png"),context);
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    double height = mediaQueryData.size
        .height; // Define the height of the container as 40% of the screen height
    double width = mediaQueryData.size.width;
    return Scaffold(
      backgroundColor: Color(0xff010A11).withOpacity(0.2),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("images/background.png")
              )
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: height / 6,
                      ),
                      Container(
                        height: height / 4,
                        width: width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("images/Vector 10.png"))),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "images/arrow.png",
                        height: 47,
                        width: 50,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      Text(
                        "Step 02",
                        style: GoogleFonts.openSans(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      CustomText(
                        text: "Pool Creation",
                        size: 26,
                        bold: FontWeight.w400,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 8,
                      ),
                      Center(
                          child: CustomText(
                        text: "ADD TEAMS",
                        size: 18,
                        bold: FontWeight.w400,
                        color: Colors.white,
                      )),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {

                          if (teamOneController.text.isNotEmpty &&
                              teamTwoController.text.isNotEmpty) {
                            // Navigate to the next screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PoolDetailScreen(TeamOneColor: selectedColor1,TeamTwoColor: selectedColor2,TeamOneName: teamOneController.text,TeamTwoName: teamTwoController.text,)),
                            );
                          } else {
                            // Show toast message indicating that both fields are required
                            Fluttertoast.showToast(
                                msg: "Please fill in both team names",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0);

                          }
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.46,
                          child: Stack(
                            children: [
                              customImageContainer(),
                              Positioned(
                                top: MediaQuery.of(context).size.height * 0.39,
                                left: MediaQuery.of(context).size.width * 0.25,
                                child: Center(
                                  child: customButton(text: "NEXT"),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  customButton({required final text}) {
    return Container(
      height: 45,
      width: 140,
      // padding: EdgeInsets.only(left: 25),
      // margin: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          // color: ConstantColors.white,
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
              image: AssetImage("images/button.png"), fit: BoxFit.fill)),
      child: CustomText(
        text: text,
        size: 21,
        bold: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }

  customImageContainer() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.43,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "images/container_back.png",
              ),
              fit: BoxFit.fill)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              "Team 1 Name",
              style: GoogleFonts.openSans(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: 36,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xFF0A1B29),
                  borderRadius: BorderRadius.circular(5)),
              child: TextFormField(
                controller: teamOneController,
                style: TextStyle(color: Colors.white),

                textAlign: TextAlign.left,
                // obscureText: obscTextTrue,

                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              children: [
                Text(
                  "Select Color",
                  style: GoogleFonts.openSans(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Pick a color'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: selectedColor1,
                              onColorChanged: changeColor1,
                              showLabel: true,
                              pickerAreaHeightPercent: 0.8,
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Done'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: selectedColor1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              "Team 2 Name",
              style: GoogleFonts.openSans(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: 36,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xFF0A1B29),
                  borderRadius: BorderRadius.circular(5)),
              child: TextFormField(
                controller: teamTwoController,
                style: TextStyle(color: Colors.white),

                textAlign: TextAlign.left,
                // obscureText: obscTextTrue,

                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              children: [
                Text(
                  "Select Color",
                  style: GoogleFonts.openSans(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Pick a color'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: selectedColor2,
                              onColorChanged: changeColor2,
                              showLabel: true,
                              pickerAreaHeightPercent: 0.8,
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Done'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: selectedColor2,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
