import 'package:flutter/material.dart';
import 'models.dart';

class RatingInformation extends StatelessWidget {
  RatingInformation(this.movie);
  final Movie movie;

  Widget _buildRatingBar(ThemeData theme) {
    var stars = <Widget>[];

    for (var i = 1; i <= 5; i++) {
      var color = i <= movie.starRating ? Colors.red : Colors.white;
      var star = Icon(
        Icons.star,
        color: color,
      );

      stars.add(star);
    }

    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var ratingCaptionStyle = textTheme.caption.copyWith(color: Colors.black45);

    var numericRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRatingBar(theme),
        SizedBox(height: 4.0),
        Wrap(
          children: <Widget>[
            Text(
              'Director :   Nikshay Maurya',
              style: TextStyle(color: Colors.grey,fontSize: 12,fontFamily: 'poppins-regular',),
            ),
          ],
        ),
      ],
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        numericRating,
        SizedBox(width: 16.0),
      ],
    );
  }
}
