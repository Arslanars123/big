import 'dart:convert';
import 'dart:io';
import 'package:big_game/screens/category_screen/category_screen.dart';
import 'package:http/http.dart' as http;
import 'package:big_game/auth/sign_up_screen.dart';
import 'package:big_game/widget/custom_text.dart';
import 'package:big_game/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../widget/zoom_drawer_widget/zoom_menu_screen.dart';

class PoolDetailScreen extends StatefulWidget {
  final TeamOneColor;
  final TeamOneName;
  final TeamTwoColor;
  final TeamTwoName;
  PoolDetailScreen({
    this.TeamOneColor,
    this.TeamOneName,
    this.TeamTwoColor,
    this.TeamTwoName,
});
  @override
  State<PoolDetailScreen> createState() => _PoolDetailScreenState();
}

class _PoolDetailScreenState extends State<PoolDetailScreen> {
  Color selectedColor1 = Colors.yellow; // Default color
  Color selectedColor2 = Colors.red; // Default color
  final groupName = TextEditingController();
  final numberOfShuffles = TextEditingController();
  final numberofQuarters = TextEditingController();
  final firstQuarterController = TextEditingController();
  final halfTimeQuarterController = TextEditingController();
  final thirdQuarterController = TextEditingController();
  final finalScoreController = TextEditingController();
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

  bool isChecked = false;
  DateTime? _selectedDate; // Initialize with current date
  TimeOfDay? _selectedTwoTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  DateTime? _selectedCloseDate;

  Future<void> _selectCloseDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedCloseDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedCloseDate = picked;
      });
  }

  TimeOfDay? _selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Future<void> _selectTimeAnother(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTwoTime) {
      setState(() {
        _selectedTwoTime = picked;
      });
    }
  }
  var _image;

  Future getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  void showFirstQuarterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Color(0xff09273d),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Name First Quarter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff09273d),
                  ),
                  child: TextFormField(
                    controller: firstQuarterController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: 'Enter your text...',
                      hintStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (firstQuarterController.text.isEmpty) {
                      firstQuarterController.text = "0";
                    }

                    Navigator.of(context).pop();
                  },
                  child: Text('Add'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  void showHalfTimeQuarterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Color(0xff09273d),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Name Half Time Quarter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff09273d),
                  ),
                  child: TextFormField(
                    controller: halfTimeQuarterController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: 'Enter your text...',
                      hintStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (halfTimeQuarterController.text.isEmpty) {
                      halfTimeQuarterController.text = "0";
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text('Add'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  void showThirdQuarterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Color(0xff09273d),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Name Third Quarter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff09273d),
                  ),
                  child: TextFormField(
                    controller: thirdQuarterController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: 'Enter your text...',
                      hintStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (thirdQuarterController.text.isEmpty) {
                      thirdQuarterController.text = "0";
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text('Add'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  void showFinalScoreDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Color(0xff09273d),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Name Final Score',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff09273d),
                  ),
                  child: TextFormField(
                    controller: finalScoreController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: 'Enter your text...',
                      hintStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (finalScoreController.text.isEmpty) {
                      finalScoreController.text = "0";
                    }

                    Navigator.of(context).pop();
                  },
                  child: Text('Add'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }


  Future<void> sendPostRequest() async {
    print("data");

      // Show loader here
      print('Loading...');

      // Check internet connectivity
      var response = await http.get(Uri.parse('https://www.google.com'));
      if (response.statusCode != 200) {
        throw Exception('No internet connection');
      }
    List<String> dateParts = _selectedDate.toString().split(":");

    // Extract year, month, and day from the parts
    String year = dateParts[0];
    String month = dateParts[1];
    String day = dateParts[2];
    String formattedDate = "$year-$month-$day";
      print(formattedDate);


    // Define the format of the string
    DateFormat dateFormat = DateFormat('yyyy-MM-dd HH-mm-ss.SSS');

    // Parse the string into a DateTime object
    DateTime dateTime = dateFormat.parse(formattedDate);

   String selectDateChange= dateTime.year.toString()+"-"+dateTime.month.toString()+"-"+dateTime.day.toString();
    List<String> datePartsClose = _selectedCloseDate.toString().split(":");

    // Extract year, month, and day from the parts
    String yearClose = dateParts[0];
    String monthClose = dateParts[1];
    String dayClose = dateParts[2];
    String formattedDateClose = "$yearClose-$monthClose-$dayClose";
    print(formattedDateClose);


    // Define the format of the string
    DateFormat dateFormatClose = DateFormat('yyyy-MM-dd HH-mm-ss.SSS');

    // Parse the string into a DateTime object
    DateTime dateTimeClose = dateFormat.parse(formattedDateClose);

    String selectDateClose= dateTimeClose.year.toString()+"-"+dateTimeClose.month.toString()+"-"+dateTimeClose.day.toString();


    // Split the date string based on colons ":"
    /*  List<String> dateParts = _selectedDate.toString().split(":");

      // Extract year, month, and day from the parts
      String year = dateParts[0];
      String month = dateParts[1];
      String day = dateParts[2];

      // Concatenate the year, month, and day with hyphens "-"
      String formattedDate = "$year-$month-$day";


      // Define the URL
      var url = Uri.parse('https://game-ten-self.vercel.app/api/create-pool');

      // Define the data to be sent in the request body
      var data = {
        "poolName": groupName.text,
        "perSquare": numberOfShuffles.text,
        "date": formattedDate.toString(), // Example date, you should replace it with the actual date
        "optionalTime": _selectedTime.toString(),
        "firstQuarter": firstQuarterController.text,
        "halfQuarter": halfTimeQuarterController.text,
        "thirdQuarter": thirdQuarterController.text,
        "finalScope": finalScoreController.text,
        "numberOfShufeles": numberofQuarters.text,
        "team1Name": widget.TeamOneName,
        "team2Name": widget.TeamTwoName,
        "team1Color": widget.TeamOneColor.toString(),
        "team2Color": widget.TeamTwoColor.toString(),
      };

      // Send the POST request
      var dataResponse = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json', // Set the content type of the request
        },
        body: jsonEncode(data), // Convert the data to JSON format
      );
var decode = jsonDecode(dataResponse.body);
print(decode);*/
    var url = Uri.parse('https://game-ten-self.vercel.app/api/create-pool');

    // Define the data to be sent in the request body
    var data = {
      "poolName": groupName.text,
      "perSquare": numberOfShuffles.text,
      "date": selectDateChange.toString(), // Example date, you should replace it with the actual date
      "optionalTime": _selectedTime.toString(),
      "firstQuarter": firstQuarterController.text,
      "halfQuarter": halfTimeQuarterController.text,
      "thirdQuarter": thirdQuarterController.text,
      "finalScope": finalScoreController.text,
      "numberOfShufeles": numberofQuarters.text,
      "team1Name": widget.TeamOneName,
      "team2Name": widget.TeamTwoName,
      "team1Color": widget.TeamOneColor.toString(),
      "team2Color": widget.TeamTwoColor.toString(),
    };

    // Send the POST request
    var dataResponse = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json', // Set the content type of the request
      },
      body: jsonEncode(data), // Convert the data to JSON format
    );
    var decode = jsonDecode(dataResponse.body);
    print(decode);
      if (response.statusCode == 200) {
        print('POST request successful');
        Fluttertoast.showToast(
          msg: "Pool Created",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ZoomDwrMenu()),
        );
      } else {
        print('Failed to send POST request');
        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    setState(() {
      loader= false;
    });
  }
bool loader = false;
  void checkData() {
    setState(() {
      loader= true;
    });
print(loader);
    if (
    groupName.text.isEmpty ||
        numberOfShuffles.text.isEmpty ||
        numberofQuarters.text.isEmpty ||
        firstQuarterController.text.isEmpty ||
        halfTimeQuarterController.text.isEmpty ||
        thirdQuarterController.text.isEmpty ||
        finalScoreController.text.isEmpty

    ) {
      setState(() {
        loader= false;
      });
      Fluttertoast.showToast(
        msg: "Please Fill All Fields",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      return;
    }else{
      sendPostRequest();
    }

    print(loader);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
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
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text(
                        "Step 03",
                        style: GoogleFonts.openSans(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      CustomText(
                        text: "Pool details",
                        size: 30,
                        bold: FontWeight.w400,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      cutomTextFormWidget(
                        controller: groupName,

                          height: height * 0.07,
                          title: "Pool Name",
                          hintText: "Grid Group",
                          prefixImage: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Image.asset(
                              "images/person.png",
                              height: 10,
                              width: 10,
                              fit: BoxFit.fill,
                            ),
                          )),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      cutomTextFormWidget(
                        controller: numberofQuarters,
                          height: height * 0.07,
                          title: "Ptz. Per Square",
                          hintText: "0.00",
                          prefixImage: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Image.asset(
                              "images/spuare.png",
                              height: 10,
                              width: 10,
                              fit: BoxFit.fill,
                            ),
                          )),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Text(
                        "Cover Photo (optional)",
                        style: GoogleFonts.openSans(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                        onTap: (){
                          getImage();
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              "images/file_attach.png",
                              height: 17,
                              width: 17,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              "Upload Image (Size should not exceed 12mb)",
                              style: GoogleFonts.openSans(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Center(
                          child: CustomText(
                        text: "pool opens",
                        size: 18,
                        bold: FontWeight.w400,
                        color: Colors.white,
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                            // shape: CircleBorder(),
                          ),
                          SizedBox(width: 8.0),
                          // Add some spacing between the checkbox and text
                          Text(
                            'Open Pool Right Away',
                            style: GoogleFonts.openSans(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withOpacity(0.5)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: customContainer(
                              gradientColor: LinearGradient(colors: [
                                Color(0xffF2C157),
                                Color(0xffD23D22),
                              ]),
                              // bgColor: Colors.transparent,
                              text:_selectedDate == null ? "SELECT DATE": _selectedDate.toString(),
                              icon: Icons.date_range_rounded,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _selectTime(context);
                            },
                            child: customContainer(
                              gradientColor: LinearGradient(colors: [
                                Color(0xff650205),
                                Color(0xff5F1012),
                              ]),
                              // bgColor: Colors.transparent,
                              text: _selectedTime == null ? "Select Time(optional)":_selectedTime.toString(),
                              icon: Icons.timer_sharp,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Center(
                          child: CustomText(
                        text: "pool Close",
                        size: 18,
                        bold: FontWeight.w400,
                        color: Colors.white,
                      )),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Center(
                        child: Row(

                          children: [
                            InkWell(
                              onTap: () {
                                _selectCloseDate(context);
                              },
                              child: customContainer(
                                gradientColor: LinearGradient(colors: [
                                  Color(0xffBBBEC1),
                                  Color(0xff010A11),
                                ]),
                                // bgColor: Colors.transparent,
                                text:_selectedCloseDate == null ? "Select Date" :_selectedCloseDate.toString(),
                                icon: Icons.date_range_rounded,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _selectTimeAnother(context);
                              },
                              child: customContainer(
                                gradientColor: LinearGradient(colors: [
                                  Color(0xffE0B15D),
                                  Color(0xffCA973C),
                                ]),
                                // bgColor: Colors.transparent,
                                text: _selectedTwoTime == null ?"Select Time": _selectedTwoTime.toString(),
                                icon: Icons.timer_sharp,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Center(
                          child: CustomText(
                        text: "Ptz. per Quarter prizes",
                        size: 18,
                        bold: FontWeight.w400,
                        color: Colors.white,
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        showFirstQuarterDialog(context);
                      },
                      child:  customSqrContainer(title: "first\nqtr.", value: firstQuarterController.text),
                    ),
                    InkWell(
                      onTap: (){
                        showHalfTimeQuarterDialog( context);
                      },
                      child:customSqrContainer(title: "half\ntime", value: halfTimeQuarterController.text),
                    ),

                    InkWell(
                      onTap: (){
                        showThirdQuarterDialog( context);
                      },
                      child:    customSqrContainer(title: "third\nqtr.", value: thirdQuarterController.text),
                    ),
                    InkWell(
                      onTap: (){
                        showFinalScoreDialog( context);
                      },
                      child:    customSqrContainer(title: "final\nScore", value: finalScoreController.text),
                    ),

                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        "Numbers & Team Shuffle",
                        style: GoogleFonts.openSans(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "After pool closure",
                        style: GoogleFonts.openSans(
                            fontSize: 10,
                            color: Colors.white.withOpacity(0.5),
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Container(
                        height: height * 0.075,
                        width: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xff09273d),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: numberOfShuffles,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          // obscureText: obscTextTrue,

                          decoration: InputDecoration(
                              hintText: "10",
                              //   contentPadding: EdgeInsets.only(top: 10),
                              hintStyle: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white.withOpacity(0.5)),
                              //suffixIcon:Icon(Icons.keyboard_arrow_down_rounded,color: Colors.white.withOpacity(0.5),),
                              prefixIconColor: Colors.black,
                              border: InputBorder.none),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: height * 0.075,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xff09273d),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            enabled: false,
                            textAlign: TextAlign.left,
                            // obscureText: obscTextTrue,

                            decoration: InputDecoration(
                                hintText: "Minutes",
                                contentPadding:
                                    EdgeInsets.only(left: 10, top: 10),
                                hintStyle: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white.withOpacity(0.5)),
                                suffixIcon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                                prefixIconColor: Colors.black,
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Center(
                  child: customButton(text: "NEXT"),
                ),
                SizedBox(
                  height: height/60,
                ),
                loader == true ? Center(child: CircularProgressIndicator(backgroundColor: Colors.yellow,)):SizedBox(),
                SizedBox(
                  height: height/80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  customButton({required final text}) {
    return InkWell(
      onTap: (){
        checkData();
      },
      child: Container(
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
      ),
    );
  }

  customContainer(
      {final gradientColor,
      required final text,
      required var icon,
      final bgColor}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.065,
      width: MediaQuery.of(context).size.width * 0.43,
      // margin: EdgeInsets.symmetric(horizontal: 25),
      padding: EdgeInsets.symmetric(horizontal: 3),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: gradientColor,
          color: bgColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 10,
          ),
          Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: Text(
            text,
            style: GoogleFonts.luckiestGuy(
                fontSize: 12, color: Colors.white, fontWeight: FontWeight.w700),
          )),
        ],
      ),
    );
  }

  customSqrContainer({final title, final value}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.22,
      // margin: EdgeInsets.symmetric(horizontal: 25),
      padding: EdgeInsets.symmetric(horizontal: 3),
      //alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
        color: Color(0xff09273d),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.luckiestGuy(
                fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400),
          ),
          Text(
            value,
            style: GoogleFonts.luckiestGuy(
                fontSize: 8, color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  cutomTextFormWidget(
      {required final height, final title, final hintText, final prefixImage,TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.openSans(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: height,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xff09273d),
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            style: TextStyle(color: Colors.white),
            controller: controller,
            textAlign: TextAlign.left,
            onChanged: (value){


            },
            // obscureText: obscTextTrue,

            decoration: InputDecoration(
                hintText: hintText,
                contentPadding: EdgeInsets.only(top: 10),
                hintStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.5)),
                prefixIcon: prefixImage,
                prefixIconColor: Colors.black,
                border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
