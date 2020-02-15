import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models.dart';
import 'poster.dart';
import 'rating_information.dart';

class MovieDetailHeader extends StatelessWidget {
  MovieDetailHeader(this.movie);
  final Movie movie;

  List<Widget> _buildCategoryChips(TextTheme textTheme) {
    return movie.categories.map((category) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Text(
          category,
          style: TextStyle(color: Colors.white),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    var movieInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(movie.title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'poppins-regular',
                fontSize: 25)),
        SizedBox(height: 8.0),
        RatingInformation(movie),
        SizedBox(height: 12.0),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5,),
              Container(
                child: Text('Favourite',style: TextStyle(color: Colors.grey,fontSize: 10),),
              ),
              
                ],
              ),
              
              Column(
                children: <Widget>[
                  Container(
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5,),
              Container(
                child: Text('Share',style: TextStyle(color: Colors.grey,fontSize: 10),),
              ),
              
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                child: Icon(
                  Icons.videocam,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5,),
              Container(
                child: Text('Watch Trailer',style: TextStyle(color: Colors.grey,fontSize: 10),),
              ),
              
                ],
              )
            ],
          ),
        )
      ],
    );

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 120.0),
          child: Image.asset(
            movie.bannerUrl,
            width: MediaQuery.of(context).size.width,
            height: 280.0,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 350,
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
        ),
        Positioned(
          top: 100,
          left: MediaQuery.of(context).size.width / 2 - 30,
          child: Container(
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 60,
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 15,
          child: GestureDetector(
            child: Container(
              width: 100,
              height: 30,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 30,
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'poppins-regular',
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(2),
                color: Colors.white,
                child: Poster(
                  movie.posterUrl,
                  height: 180.0,
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(child: movieInformation),
            ],
          ),
        ),
      ],
    );
  }
}
