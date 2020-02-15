import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.black,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        //or set color with: Color(0xFF0000FF)
        statusBarBrightness: Brightness.light));
    return CupertinoApp(
        title: 'Pod Originals',
        theme: CupertinoThemeData(
          primaryColor: Colors.teal,
        ),
        debugShowCheckedModeBanner: false,
        color: CupertinoColors.white,
        home: HomeScreen(),);
  }
}
