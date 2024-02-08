import 'package:big_game/create_pool/create_pool.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MenuBox extends StatefulWidget {
  const MenuBox({super.key});

  @override
  State<MenuBox> createState() => _MenuBoxState();
}

class _MenuBoxState extends State<MenuBox> {
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
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.all(MediaQuery.of(context).size.height/25),
                    child: Container(
                      height: height/14,
                      width: width/7,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/menu_svg.png")
                          )

                      ),
                    ),
                  ),

                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CeatePoolScreen()),
                        );
                      },
                        child: MenuItem(height: height, width: width,title: "Create A Pool",desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ",)),
                    SizedBox(width: 10,),
                    MenuItem(height: height, width: width,title: "Join A Friend Pool",desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ",),

                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CeatePoolScreen()),
                        );
                      },
                        child: MenuItem(height: height, width: width,title: "Join In a House Pool",desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ",)),
                    SizedBox(width: 10,),
                    MenuItem(height: height, width: width,title: "Manage Your Pool",desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ",),

                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height/7,
                    width: width/5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/group.png")
                      )

                    ),
                  ),
                  Container(
                    height: height/13,
                    width: width/5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/group_two.png")
                        )

                    ),
                  ),
                  Container(
                    height: height/13,
                    width: width/5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                            image: AssetImage("images/group_3.png")
                        )

                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this. desc,
  });

  final double height;
  final double width;
final title;
  final desc;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(

          children: [
            SizedBox(height: height/5.9,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: height/8,
                width: width/2.4,

                decoration: BoxDecoration(

                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/container.png")
                    )
                ),
              ),
            ),
          ],
        ),
        Container(
          height: height/3.5,
          width: width/2.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Center(
                child: Container(
                  height: height/12,
                  width: width/7,
                  child: Icon(Icons.arrow_forward,color:Color(0xFFDEC739),size: width/15,),


                  decoration: BoxDecoration(
                    color: Color(0xFF0B3C5F),
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
                SizedBox(height: height/40,),

              Center(child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Text(title,style: GoogleFonts.luckiestGuy(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white),),
              )),

              Container(
                width: width/2.5,
                  child: Center(child: Text(desc,style: GoogleFonts.openSans(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.white),)))

            ],
          ),

          decoration: BoxDecoration(

            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("images/border.png")
            )
          ),
        ),

      ],
    );
  }
}
