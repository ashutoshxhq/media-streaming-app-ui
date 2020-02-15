import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'section.dart';
import 'data.dart';
import '../single.dart';
import 'movie_api.dart';

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: Stack(
        children: <Widget>[
          Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/i.png', fit: BoxFit.cover)),
          Column(
            children: <Widget>[
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    stops: [0, 0.8],
                    colors: [
                      Colors.black.withOpacity(0.5),
                      CupertinoColors.darkBackgroundGray
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 260,
            left: MediaQuery.of(context).size.width / 2 - 60,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute<bool>(
                    fullscreenDialog: true,
                    builder: (BuildContext context) => Single(testMovie),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50)),
                  color: Colors.red,
                ),
                height: 60,
                width: MediaQuery.of(context).size.width / 2 + 60,
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(10),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red[700]),
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Text(
                            'Watch Now',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'poppins-regular'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 340,
              child: Container(
                  child: Section(data[0]["name"], data[0]["images"]))),
        ],
      ),
    );
  }
}
