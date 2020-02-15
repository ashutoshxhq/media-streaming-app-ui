import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'partials/movie_detail_header.dart';
import 'partials/photo_scroller.dart';
import 'partials/story_line.dart';
import 'partials/models.dart';
import 'partials/cast.dart';
class Single extends StatefulWidget {
  Single(this.movie);
  final Movie movie;
  @override
  _SingleState createState() => _SingleState();
}

class _SingleState extends State<Single> {
  double _panelHeightOpen = 575.0;
  double _panelHeightClosed = 65.0;
  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: CupertinoColors.darkBackgroundGray,
        systemNavigationBarColor: CupertinoColors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        //or set color with: Color(0xFF0000FF)
        statusBarBrightness: Brightness.light));
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      child: Stack(
        children: <Widget>[
          ListView(
            physics: ClampingScrollPhysics(),
            children: [
              MovieDetailHeader(widget.movie),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Storyline(widget.movie.storyline),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Cast(widget.movie.storyline),
              ),
              SizedBox(height: 10.0),
              PhotoScroller(widget.movie.photoUrls),
              SizedBox(height: 100.0),
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
              "Swipe up for",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20.0,
                fontFamily: 'poppins-regular',
              ),
            ),
            Text(
              " episodes",
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
