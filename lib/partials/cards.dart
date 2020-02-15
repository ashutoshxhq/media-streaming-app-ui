import 'package:flutter/material.dart';
import 'data.dart';
import 'dart:math';

class MovieCard extends StatelessWidget {
  var image;

  MovieCard(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        width: 220.0,
        child: ClipRRect(
          borderRadius: new BorderRadius.circular(10.0),
          child: Image.asset(image, fit: BoxFit.fill),
        ));
  }
}

class BigMovieCard extends StatelessWidget {
  var image;
BigMovieCard(this.image);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 250,
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            borderRadius: new BorderRadius.circular(8),
            child: Image.asset(image, fit: BoxFit.fill),
          ),
        ),
        Container(
          height: 250,
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.circular(8),
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        Positioned(
          top:180,
          right: 10,
          left: MediaQuery.of(context).size.width/2 -20,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
              color: Colors.red,
            ),
            height: 50,
            width: MediaQuery.of(context).size.width/2 + 20,
            padding: EdgeInsets.all(5),
            child: Row(
              children: <Widget>[
                Container(
                  child:Icon(Icons.play_arrow,color: Colors.white,),
                  padding: EdgeInsets.all(5),
                  height:35,
                  width:35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red[700]
                  ),
                ),

                Expanded(
                  child: Container(
                    child: Center(
                      child: Text('Watch Now',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'poppins-regular'
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

var cardAspectRatio = 20.0 / 18.0;
var widgetAspectRatio = cardAspectRatio * 1.2;


class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                height: 100,

                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Image.asset(images[i], fit: BoxFit.cover),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}