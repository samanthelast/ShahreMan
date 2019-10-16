import 'dart:async';
import 'dart:io';
import 'package:flutkart/utils/connection_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutkart/utils/flutkart.dart';
import 'package:flutkart/utils/my_navigator.dart';
import 'package:flutter/scheduler.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isConnected = null;
  navigateCondition(isConnected) {
    if (isConnected == true) {
    }
    if (isConnected == false) {
      
    } else {
      print('wtf');
    }
  }

  _checkNetwork(bool isConnected) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        isConnected = true;
        
      Timer(Duration(seconds: 5), () => MyNavigator.goToIntro(context));
      print('lets go');
      }
    } on SocketException catch (_) {
      print('not connected');
      isConnected = false;
      WidgetsBinding.instance.addPostFrameCallback((_) => _scaffoldKey
          .currentState
          .showSnackBar(SnackBar(content: Text('Can not connect to the server'))));
      print('cant go');
    }

    navigateCondition(isConnected);

  }
  @override
  void initState() {


    super.initState();

    _checkNetwork(isConnected);
    print('current $isConnected 2');
    // WidgetsBinding.instance
    //     .addPostFrameCallback((_) => navigateCondition(isConnected));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Scaffold(
          body: Builder(
            builder: (context) => Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.orange),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50.0,
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.greenAccent,
                                size: 50.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                            ),
                            Text(
                              Flutkart.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          CircularProgressIndicator(),
                          Padding(
                            padding: EdgeInsets.only(top: 20.0),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  final snackBar = SnackBar(
    content: Text('Yay! A SnackBar!'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
}
