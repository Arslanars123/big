import 'package:big_game/auth/login_screen.dart';
import 'package:big_game/widget/custom_text.dart';
import 'package:big_game/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../auth_model/providers/auth_model.dart';

class SignUpScreen extends StatefulWidget {

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final registrationProvider = Provider.of<RegistrationProvider>(context);

    return  Scaffold(
      backgroundColor: Color(0xff010A11),
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
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: 20,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Image.asset("images/arrow.png",height: 47,width: 50,fit: BoxFit.fill,),
                     Padding(
                       padding: const EdgeInsets.only(right: 10),
                       child: Image.asset("images/icon.png",height: 104,width: 116,fit: BoxFit.fill,),
                     ),
                   ],
                 ),
            SizedBox(height: 30,),
              CustomText(text: "REGISTER ACCOUNT",size: 30,bold: FontWeight.w400,color: Colors.white,)
                ,Text("Fill your details or continue with social media",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w400),),
                 SizedBox(height: 20,),
                 Container(
                   height: 56,
                   width: double.infinity,

                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(5)
                   ),
                   child: TextFormField(
                     controller: registrationProvider.emailController,

                     textAlign: TextAlign.left,
                     // obscureText: obscTextTrue,

                     decoration: InputDecoration(
                         hintText: "Email Address",
                         contentPadding: EdgeInsets.only(top: 10),
                         hintStyle: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.black.withOpacity(0.5)),
                         prefixIcon: Icon(Icons.mail_outline,color: Colors.blue,),

                         suffixIconColor: Colors.black,
                         prefixIconColor: Colors.black,
                         border: InputBorder.none

                     ),
                   ),
                 ),
                 SizedBox(height: 20,),
                 Container(
                   height: 56,
                   width: double.infinity,

                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(5)
                   ),
                   child: TextFormField(
                     controller: registrationProvider.passwordController,

                     textAlign: TextAlign.left,
                     // obscureText: obscTextTrue,

                     decoration: InputDecoration(
                         hintText: "Password",
                         contentPadding: EdgeInsets.only(top: 10),
                         hintStyle: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.black.withOpacity(0.5)),
                         prefixIcon: Icon(Icons.lock_outline,color: Colors.blue,),
                         suffixIcon: Icon(Icons.visibility_off),

                         prefixIconColor: Colors.black,
                         border: InputBorder.none

                     ),
                   ),
                 ),
                 SizedBox(height: 20,),
                 Container(
                   height: 56,
                   width: double.infinity,

                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(5)
                   ),
                   child: TextFormField(
                     controller: registrationProvider.confirmController,
                     textAlign: TextAlign.left,
                     decoration: InputDecoration(
                         hintText: "Conform Password",
                         contentPadding: EdgeInsets.only(top: 10),
                         hintStyle: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.black.withOpacity(0.5)),
                         prefixIcon: Icon(Icons.lock_outline,color: Colors.blue,),
                         suffixIcon: Icon(Icons.visibility_off),
                         prefixIconColor: Colors.black,
                         border: InputBorder.none

                     ),
                   ),
                 ),
                 SizedBox(height: 40,),
                Center(
                  child: InkWell(
                    onTap: (){

                      print(registrationProvider.emailController.text);
                      String email = registrationProvider.emailController.text;
                      String password = registrationProvider.passwordController.text;
                      String confirm = registrationProvider.confirmController.text;
                      registrationProvider.registerUser(email, password,confirm,context);
                    },
                    child:  customButton(text: "SIGNUP"),),
                ),
                 SizedBox(height: 20,),
                 registrationProvider.isLoading ? Center(child: CircularProgressIndicator(color: Color(0xFFD4a654),)):SizedBox(),
                 SizedBox(height: 20,),
                 Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(
                     width: 35,
                     height: 1,
                     color: Colors.white,
                   ),
                   Text(" Or Continue with ",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w400),),
                   Container(
                     width: 35,
                     height: 1,
                     color: Colors.white,
                   ),
                 ],
               ),
                 SizedBox(height: 20,),
                 customSocilaRow(),
                 SizedBox(height: 20,),
             Center(
               child: InkWell(
                 onTap: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) =>  LoginScreen()),
                   );
                 },
                 child: RichText(
                   text: TextSpan(
                     text: 'Already have an account? ',
                     style: GoogleFonts.openSans(
                       fontSize: 14,
                       fontWeight: FontWeight.w400,
                       color: Colors.white
                     ),
                     children: <TextSpan>[
                       TextSpan(
                         text: 'Sign In',
                         style: GoogleFonts.openSans(
                             fontSize: 14,
                             fontWeight: FontWeight.w700,
                             color: Colors.white
                         )
                       ),
                     ],
                   ),
                 ),
               ),
             ),

               ],
             ),
           ),
         ),
       ),
     ),
    );
  }

  customButton({required final text})
  {
    return Container(
      height: 60,
      width: 220,
      // padding: EdgeInsets.only(left: 25),
      // margin: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // color: ConstantColors.white,
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(image: AssetImage("images/button.png"))
      ),
      child: CustomText(text:text,size: 21,bold: FontWeight.w400,color: Colors.white,),

    );
  }


  customImageContainer({final image,final bgColor,final padding}){
    return   Container(
      height: 57,
      width: 57,
      padding:padding ,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: bgColor
      ),
      child: Image.asset(image,height: 28,width: 30,fit: BoxFit.fill,),
    );
  }
  customSocilaRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customImageContainer(image: "images/google.png",bgColor: Colors.white,padding: EdgeInsets.all(10)),
      SizedBox(width: 10,),
        customImageContainer(image: "images/fb.png",bgColor: Color(0xff4460A1),padding: EdgeInsets.all(15)),
        SizedBox(width: 10,),
        customImageContainer(image: "images/apple.png",bgColor:Colors.white,padding: EdgeInsets.all(10)),
      ],
    );
  }
}
