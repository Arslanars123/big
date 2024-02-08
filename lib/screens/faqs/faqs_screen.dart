import 'package:big_game/auth/sign_up_screen.dart';
import 'package:big_game/widget/custom_text.dart';
import 'package:big_game/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqsScreen extends StatefulWidget {

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {

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
  bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return  Scaffold(
      backgroundColor: Color(0xff010A11).withOpacity(0.2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Image.asset("images/arrow.png",height: 47,width: 50,fit: BoxFit.fill,),
                    SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                    CustomText(text: "FAQS",size: 26,bold: FontWeight.w400,color: Colors.white,),
                    SizedBox(height: height*0.05,),

                    Padding(

                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Column(
                            children: [
                              Text("1 How can we download the app?",style: GoogleFonts.openSans(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),),

                              ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: 230),
                                  child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet, in. Ipsum viverra pretium tellus neque.",style: GoogleFonts.openSans(fontSize: 11,fontWeight: FontWeight.w400,color: Colors.white.withOpacity(0.7)),)),
                            ],
                          ),
                        Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.only(bottom: 20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color(0xff93DBFE),
                              Color(0xff93DBFE),
                            //  Color(0xffFFFFFF).withOpacity(0.7),
                            ]),
                          ),
                          child: Icon(Icons.minimize_rounded,color: Colors.white,),
                        )
                        ],
                      ),
                    ),

                    SizedBox(height: height*0.05,),

                    Padding(

                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 240),
                              child: Text("2.What can be done after joining this app?",style: GoogleFonts.openSans(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.white),)),

                          Container(
                            height: 40,
                            width: 40,
                          //  padding: EdgeInsets.only(bottom: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xff93DBFE),
                                Color(0xff93DBFE),
                                //  Color(0xffFFFFFF).withOpacity(0.7),
                              ]),
                            ),
                            child: Icon(Icons.add,color: Colors.white,),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: height*0.05,),

                    Padding(

                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 240),
                              child: Text("3. Lorem ipsum dolor sit amet, consectetur elit?",style: GoogleFonts.openSans(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.white),)),

                          Container(
                            height: 40,
                            width: 40,
                            //  padding: EdgeInsets.only(bottom: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xff93DBFE),
                                Color(0xff93DBFE),
                                //  Color(0xffFFFFFF).withOpacity(0.7),
                              ]),
                            ),
                            child: Icon(Icons.add,color: Colors.white,),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: height*0.05,),

                    Padding(

                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 240),
                              child: Text("4. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra ?",style: GoogleFonts.openSans(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.white),)),

                          Container(
                            height: 40,
                            width: 40,
                            //  padding: EdgeInsets.only(bottom: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xff93DBFE),
                                Color(0xff93DBFE),
                                //  Color(0xffFFFFFF).withOpacity(0.7),
                              ]),
                            ),
                            child: Icon(Icons.add,color: Colors.white,),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height*0.06,),


            ],
          ),
        ),
      ),
    );
  }

  customButton({required final text})
  {
    return Container(
      height: 45,
      width: 220,
      // padding: EdgeInsets.only(left: 25),
      // margin: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // color: ConstantColors.white,
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(image: AssetImage("images/button.png"),fit: BoxFit.fill)
      ),
      child: CustomText(text:text,size: 21,bold: FontWeight.w400,color: Colors.white,),

    );
  }


  customContainer({ final gradientColor,required final text,required var icon, final bgColor}){
    return   Container(
      height:  MediaQuery.of(context).size.height*0.065,
      width: MediaQuery.of(context).size.width*0.43,
      // margin: EdgeInsets.symmetric(horizontal: 25),
      padding: EdgeInsets.symmetric(horizontal: 3),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: gradientColor,
          color: bgColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 10,),
          Icon(icon,color: Colors.white,size: 25,),
          SizedBox(width: 5,),
          Expanded(child: Text(text,style: GoogleFonts.luckiestGuy(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w700),)),

        ],
      ),
    );
  }
  customSqrContainer({ final title,final value}){
    return   Container(
      height:  MediaQuery.of(context).size.height*0.08,
      width: MediaQuery.of(context).size.width*0.22,
      // margin: EdgeInsets.symmetric(horizontal: 25),
      padding: EdgeInsets.symmetric(horizontal: 3),
      //alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.white.withOpacity(0.3),width: 1),
        color: Color(0xff09273d),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(title,style: GoogleFonts.luckiestGuy(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w400),),
          Text(value,style: GoogleFonts.luckiestGuy(fontSize: 8,color: Colors.white,fontWeight: FontWeight.w400),),

        ],
      ),
    );
  }
  cutomTextFormWidget({required final height,final title,final hintText,final prefixImage}){
    return  Container(
      height: height,
      width: double.infinity,

      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xff09273d),
          borderRadius: BorderRadius.circular(10)
      ),
      child: TextFormField(

        textAlign: TextAlign.left,
        // obscureText: obscTextTrue,

        decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.only(top: 10),
            hintStyle: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.white.withOpacity(0.5)),
            prefixIcon:prefixImage,
            prefixIconColor: Colors.black,
            border: InputBorder.none

        ),
      ),
    );
  }
}
