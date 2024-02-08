import 'package:big_game/screens/faqs/faqs_screen.dart';
import 'package:big_game/screens/profile/profile_screen.dart';
import 'package:big_game/screens/settings/settings_screen.dart';
import 'package:big_game/screens/share_with_friends/share_with_friend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/event_calender/event_calender.dart';
import '../../screens/terms_and_condition/terms_and_condition.dart';
import '../custom_text.dart';

class DrawerMenuu extends StatefulWidget {

  @override
  State<DrawerMenuu> createState() => _DrawerMenuuState();
}

class _DrawerMenuuState extends State<DrawerMenuu> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      backgroundColor: Color(0xff010A11),
       body: SafeArea(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children:
           [
             Padding(
               padding: const EdgeInsets.only(left: 15,top: 20),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children:
                 [
                   InkWell(
                     onTap:(){
                           Get.to(()=>ProfileScreen());
                     },child: Container(
                     height: 66,
                     width: 68,

                     margin: EdgeInsets.only(bottom: 10),
                     padding: EdgeInsets.all(5),
                     decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         color:  Color(0xff010A11).withOpacity(0.5)
                     ),
                     child: Image.asset(
                       "images/profile.png",
                       height: 66,
                       width: 66,
                       fit: BoxFit.fill,
                     ),
                   ),
                   ),

                   SizedBox(width: 20,),
                   InkWell(
                     onTap: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) =>  ProfileScreen()),
                       );

                     },
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Jessica Benson",style: GoogleFonts.openSans(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),
                         Text("Los Angeles, USA",style: GoogleFonts.openSans(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white.withOpacity(0.6)),),
                             ],
                     ),
                   ),

                 ],
               ),
             ),
             SizedBox(height: height*0.03,),

             Padding(
             padding: EdgeInsets.only(left: width*0.08,top: height*0.06),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 InkWell(
                   onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) =>  SettingsScreen()),
                     );
                   },
                   child: Row(
                     children: [
                       Icon(Icons.settings,color: Color(0xff626262),size: 20,),

                       SizedBox(width: width*0.02,),
                       Text("Settings",style: GoogleFonts.openSans(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),),

                     ],
                   ),
                 ),
                 SizedBox(height: height*0.08,),
                 InkWell(
                   onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) =>  ShareWithFriendScreen()),
                     );

                   },
                   child: Row(
                     children: [
                       Icon(Icons.share,color: Color(0xff626262),size: 20,),
                       SizedBox(width: width*0.02,),
                       Text("Share with a Friend",style: GoogleFonts.openSans(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),),

                     ],
                   ),
                 ),
                 SizedBox(height: height*0.08,),
                 InkWell(
                   onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) =>  FaqsScreen()),
                     );

                   },
                   child: Row(
                     children: [
                       Image.asset("images/faqs.png",height: 20,width: 20,fit: BoxFit.fill,),
                       SizedBox(width: width*0.02,),
                       Text("FAQ’s",style: GoogleFonts.openSans(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),),

                     ],
                   ),
                 ),
                 SizedBox(height: height*0.08,),
                 InkWell(
                   onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) =>  EventCleenderScreen()),
                     );

                   },
                   child: Row(
                     children: [
                       Image.asset("images/tems.png",height: 20,width: 20,fit: BoxFit.fill,),
                       SizedBox(width: width*0.02,),
                       Text("Events Calendar",style: GoogleFonts.openSans(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),),

                     ],
                   ),
                 ),
                 SizedBox(height: height*0.08,),
                 InkWell(
                   onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) =>  TermsAndConditionScreen()),
                     );

                   },
                   child: Row(
                     children: [
                       Image.asset("images/tems.png",height: 20,width: 20,fit: BoxFit.fill,),
                       SizedBox(width: width*0.02,),
                       Text("Terms & Conditions",style: GoogleFonts.openSans(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),),

                     ],
                   ),
                 ),
               ],
             ),
           ),
             Spacer(),

             Padding(
               padding: EdgeInsets.only(left: width*0.08,top: height*0.06),
               child: Row(
                 children: [
                   Image.asset("images/logout.png",height: 20,width: 20,fit: BoxFit.fill,),
                   SizedBox(width: width*0.02,),
                   Text("Logout",style: GoogleFonts.openSans(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),),
                 ],
               ),
             ),
             SizedBox(height: 45),
           ],
         ),
       ),
    );
  }

  customRow({final text,final icon,final onTap}){
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8)
            ),
            child: icon,
          ),
          SizedBox(width: 12,),
          CustomText(text: text,size: 14,bold: FontWeight.w500,color: Colors.white,),
        ],
      ),
    );
  }
}


