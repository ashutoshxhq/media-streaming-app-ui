import 'package:flutter/material.dart';

class Cast extends StatelessWidget {
  Cast(this.storyline);
  final String storyline;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CAST',
          style: textTheme.subhead.copyWith(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          'Ashutosh Dubey, Nikshay Maurya, Gaurav, Nikhil, Rahul, Aman Nirala',
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
