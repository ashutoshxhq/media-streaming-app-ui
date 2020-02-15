import 'package:flutter/material.dart';
import 'cards.dart';

class Section extends StatelessWidget {
  final name;
  final images;

  Section(this.name, this.images);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'poppins-regular',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MovieCard(images[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}