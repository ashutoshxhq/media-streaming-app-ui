import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: CupertinoColors.darkBackgroundGray,
        systemNavigationBarColor: CupertinoColors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        //or set color with: Color(0xFF0000FF)
        statusBarBrightness: Brightness.light));
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.darkBackgroundGray,
        actionsForegroundColor: CupertinoColors.white,
        leading: GestureDetector(
                    
            child: Container(
              width: 100,
              height: 100,
              color: Colors.transparent,
              child: Row(
                children: <Widget>[
                  Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                  ),
                  Text(
                    'Back',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            onTap: () {
              
              Navigator.of(context, rootNavigator: true).pop();
              
            },
          ),
      ),
      child: Container(
        child: ListView(
          children: <Widget>[
            Container(
              height: 100.0,
              child: Center(
                child: Text(
                  'Search',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 45.0,
                      fontFamily: 'poppins-regular'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                elevation: 2.0,
                shadowColor: Colors.white,
                child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search,
                            color: Colors.black87, size: 20.0),
                        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                        hintText: 'Please enter search information',
                        hintStyle: TextStyle(
                            color: Colors.black87, fontFamily: 'Quicksand'))),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: new BorderRadius.circular(10.0),
                    child: Container(
                      width: 150,
                      color: Colors.red,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Center(
                        child: Text(
                          'SiFi',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: new BorderRadius.circular(10.0),
                    child: Container(
                      width: 150,
                      color: Colors.red,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Center(
                        child: Text(
                          'Drama',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: new BorderRadius.circular(10.0),
                    child: Container(
                      width: 150,
                      color: Colors.red,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Center(
                        child: Text(
                          'Action',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: new BorderRadius.circular(10.0),
                    child: Container(
                      width: 150,
                      color: Colors.red,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Center(
                        child: Text(
                          'Kids',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: new BorderRadius.circular(10.0),
                    child: Container(
                      width: 150,
                      color: Colors.red,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Center(
                        child: Text(
                          'Romance',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: new BorderRadius.circular(10.0),
                    child: Container(
                      width: 150,
                      color: Colors.red,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Center(
                        child: Text(
                          'Thrillers',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: new BorderRadius.circular(10.0),
                    child: Container(
                      width: 150,
                      color: Colors.red,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Center(
                        child: Text(
                          'Hindi',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: new BorderRadius.circular(10.0),
                    child: Container(
                      width: 150,
                      color: Colors.red,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Center(
                        child: Text(
                          'English',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: new BorderRadius.circular(10.0),
                    child: Container(
                      width: 150,
                      color: Colors.red,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Center(
                        child: Text(
                          'Crime',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: new BorderRadius.circular(10.0),
                    child: Container(
                      width: 150,
                      color: Colors.red,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Center(
                        child: Text(
                          'Horror',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        color: CupertinoColors.darkBackgroundGray,
      ),
    );
  }
}
