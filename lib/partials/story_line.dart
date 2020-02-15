import 'package:flutter/material.dart';

class Storyline extends StatelessWidget {
  Storyline(this.storyline);
  final String storyline;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'STORY LINE',
          style: textTheme.subhead.copyWith(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          storyline,
          style: textTheme.body1.copyWith(
            color: Colors.grey,
            fontSize: 16.0,
            fontFamily: 'poppins-regular',
          ),
        ),
       
      ],
    );
  }
}
