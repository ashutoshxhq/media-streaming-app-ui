import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'partials/data.dart';

class Watchlist extends StatefulWidget {
  @override
  _WatchlistState createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {
  var currentPage = images.length - 1.0;
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
     double _panelHeightOpen = 575.0;
     double _panelHeightClosed = 65.0;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: CupertinoColors.darkBackgroundGray,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        //or set color with: Color(0xFF0000FF)
        statusBarBrightness: Brightness.light));
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.darkBackgroundGray,
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
      child: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                  height: 100.0,
                  child: Center(
                    child: Text(
                      'Saved Content',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                          fontFamily: 'poppins-regular'),
                    ),
                  ),
                ),
              Container(
                  child: Stack(
                children: <Widget>[
                  CardScroll(currentPage),
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: images.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  )
                ],
              )),
            ],
          ),
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            panel: _panel(),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
          ),
        ],
      ),
    );
  }

  Widget _panel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 12.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
            ),
          ],
        ),
        SizedBox(
          height: 2.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Recommended for",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20.0,
                fontFamily: 'poppins-regular',
              ),
            ),
            Text(
              " you",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 24.0,
                  fontFamily: 'Cocon',
                  color: Colors.red),
            ),
          ],
        ),
        SizedBox(
          height: 36.0,
        ),
        
      ],
    );
  }
}

var cardAspectRatio = 3 / 4;
var widgetAspectRatio = cardAspectRatio * 1.2;

class CardScroll extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScroll(this.currentPage);

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
              borderRadius: BorderRadius.circular(10.0),
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
