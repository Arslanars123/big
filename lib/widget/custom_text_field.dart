import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class PasswordTextField extends StatelessWidget {
  var icon,suffixIcon;
  String? hintText;
  final obscTextTrue;
  var validation;
  var onSave;
  var controller;
  PasswordTextField({
    this.icon,
    this.suffixIcon,
   this.controller,
    this.hintText,
    // this.onSave,
     this.validation,
     this.obscTextTrue
  });

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            // border: Border.all(color:ConstantColors.textField,width: 1)
        ),
        child: TextFormField(
          validator: validation,
          controller: controller,
          obscureText: obscTextTrue,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.black),
              prefixIcon: icon,
              suffixIcon: suffixIcon,
              suffixIconColor: Colors.black,
              prefixIconColor: Colors.black,
            border: InputBorder.none

          ),
        ),
      );
  }
}

class CustomTextField extends StatelessWidget {
  var icon,suffixIcon;
  String? hintText;
  var maxline;
  var validation;
  var onSave;
  var onTap;
  var controller;
  CustomTextField({
    this.icon,
    this.suffixIcon,
    this.controller,
    this.hintText,
    this.maxline,
    this.onTap,
    this.validation,
  //  this.obscTextTrue
  });

  @override
  Widget build(BuildContext context) {
    return
      Container(
        //height: 50,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          // border: Border.all(color:ConstantColors.textField,width: 1)
        ),
        child:
        TextFormField(
          onTap: onTap,
          validator: validation,
          controller: controller,
        maxLines: maxline,
         textAlign: TextAlign.start,
         // obscureText: obscTextTrue,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.black),
              prefixIcon: icon,
              suffixIcon: suffixIcon,
              suffixIconColor: Colors.black,
              prefixIconColor: Colors.black,
              border: InputBorder.none

          ),
        ),
      );
  }
}