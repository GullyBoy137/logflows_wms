import 'package:flutter/material.dart';

import 'package:splash_tokenauth/ui/homeScreen.dart';
import 'package:splash_tokenauth/ui/loginScreen.dart';
import 'package:splash_tokenauth/ui/splashScreen.dart';
import 'package:splash_tokenauth/webview/webview_class.dart';
import 'package:splash_tokenauth/common/apifunctions/requestLoginAPI.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_tokenauth/common/functions/getToken.dart';

/*void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  var _splashShown = false;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Splash and Token Authentication",
      routes: <String,WidgetBuilder>{
        "/HomeScreen": (BuildContext context) => HomeScreen(),
        "/LoginScreen": (BuildContext context) => LoginScreen(),
        //"/WebView": (BuildContext context) => WebViewDemo(),
      },

      home: LoginScreen()
    );
  }

}*/

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {

  var _splashShown = false;
   @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //String checkToken = getToken();
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Splash and Token Authentication",
        routes: <String, WidgetBuilder>{
          "/HomeScreen": (BuildContext context) => HomeScreen(),
          "/LoginScreen": (BuildContext context) => LoginScreen(),
          //"/WebView": (BuildContext context) => WebViewDemo(),
        },

        home: ((getToken() == "")? LoginScreen():HomeScreen())
    );
  }
  @override
  void initState() {
    super.initState();
  }
}