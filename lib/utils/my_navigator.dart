import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class MyNavigator {
  static void goToHome(BuildContext context) {
    
    //Navigator.pop(context);
    //Navigator.popAndPushNamed(context, '/screen4');
    Navigator.pushNamed(context, "/home");
  }

  static void goToIntro(BuildContext context) {
    Navigator.pushNamed(context, "/intro");
  }
}
