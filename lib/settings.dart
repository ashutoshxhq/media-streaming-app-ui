import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: CupertinoColors.darkBackgroundGray,
        systemNavigationBarColor: CupertinoColors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        //or set color with: Color(0xFF0000FF)
        statusBarBrightness: Brightness.light));
    final hr = Divider();

    final userImage = Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/i.png'),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
    );

    final userNameLocation = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Ashutosh Dubey',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Ranchi,JH',
            style: TextStyle(
              color: Colors.grey.withOpacity(0.6),
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );

    final userInfo = Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(8.0),
            shadowColor: Colors.white,
            child: Container(
              height: 220.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0, bottom: 20.0,top: 20),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    userImage,
                    SizedBox(height: 10.0),
                    userNameLocation
                  ],
                ),
              ),
            ),
          ),
        ),
      
      ],
    );

    final secondCard = Padding(
      padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 30.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8.0),
        shadowColor: Colors.white,
        child: Container(
          height: 200.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: <Widget>[
              _buildIconTile(Icons.favorite, Colors.red, 'Family Mode'),
              hr,
              _buildIconTile(
                  Icons.panorama_fish_eye, Colors.green, 'Subscription'),
              hr,
              _buildIconTile(Icons.face, Colors.purpleAccent, 'Change Profile'),
            ],
          ),
        ),
      ),
    );

    final thirdCard = Padding(
      padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 30.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8.0),
        shadowColor: Colors.white,
        child: Container(
          height: 280.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: <Widget>[
              _buildIconTile(Icons.folder, Colors.red, 'Watch List'),
              hr,
              _buildIconTile(Icons.home, Colors.blue, 'Media Settings'),
              hr,
              _buildIconTile(Icons.supervised_user_circle, Colors.orangeAccent,
                  'About & Legal'),
              hr,
              _buildIconTile(
                  Icons.settings, Colors.grey.withOpacity(0.6), 'Logout'),
            ],
          ),
        ),
      ),
    );

    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 350.0,
                      ),
                      Container(
                        height: 250.0,
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                      Positioned(top: 100, right: 0, left: 0, child: userInfo),
                      Positioned(
                        top: 0,
                        left: 20,
                        child: GestureDetector(
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.transparent,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  CupertinoIcons.back,
                                  color: Colors.white,
                                  size: 30,
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
                      )
                    ],
                  ),
                  secondCard,
                  thirdCard
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserStats(String name, String value) {
    return Column(
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
            color: Colors.grey.withOpacity(0.6),
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w900,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }

  Widget _buildIconTile(IconData icon, Color color, String title) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: Container(
        height: 30.0,
        width: 30.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
      trailing: Icon(Icons.child_care),
    );
  }
}
