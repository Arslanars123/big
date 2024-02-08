import 'package:big_game/auth/login_screen.dart';
import 'package:big_game/auth/sign_up_screen.dart';
import 'package:big_game/screens/category_screen/category_screen.dart';
import 'package:big_game/screens/menu_box.dart';
import 'package:big_game/widget/zoom_drawer_widget/zoom_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'auth_model/providers/auth_model.dart';
import 'auth_model/providers/signin_provider.dart';
import 'create_pool/create_pool.dart';
import 'create_pool/pool_detail_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegistrationProvider()),
        ChangeNotifierProvider(create: (_) => SignInProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ZoomDwrMenu(),
      ),
    );
  }
}

