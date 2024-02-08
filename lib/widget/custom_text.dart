import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomText extends StatelessWidget {
  String text;
  Color? color;
  double size;
  TextOverflow? textOverflow;
  var underLine;
  FontWeight? bold;
  var fontFamily;


  CustomText({required this.text, this.color =const Color(0xff332d2b),
    this.textOverflow,
    this.bold,
    this.size = 0,
    this.underLine,
    this.fontFamily
  });

  @override
  Widget build(BuildContext context) {
    return
      Text(
      text,
            maxLines: 4,
      overflow: textOverflow,
      textAlign: TextAlign.start,
      style: GoogleFonts.luckiestGuy(

        color: color,
        fontSize:size==0? 20:size,
        fontWeight: bold,
        decoration: underLine,
      ),
          );
  }
}
