import 'package:flutter/material.dart';
import 'package:podoriginals/partials/cards.dart';
import 'package:podoriginals/watchlist.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/cupertino.dart';
import 'partials/section.dart';
import 'partials/data.dart';
import 'partials/hero.dart';
import 'settings.dart';
import 'search.dart';
import 'partials/cards.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _panelHeightOpen = 575.0;
  double _panelHeightClosed = 65.0;
 
  var currentPage = images.length - 1.0;

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    return CupertinoPageScaffold(
      child: Stack(
        children: <Widget>[
          Container(
            color: CupertinoColors.darkBackgroundGray,
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                HeroSection(),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'NEW RELEASES',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'poppins-regular',
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              children: <Widget>[
                                CardScrollWidget(currentPage),
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
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Section(data[1]["name"], data[1]["images"]),
                BigMovieCard('assets/6.png'),
                SizedBox(
                  height: 20,
                ),
                Section(data[2]["name"], data[2]["images"]),
                Section(data[3]["name"], data[3]["images"]),
                BigMovieCard('assets/7.png'),
                SizedBox(
                  height: 20,
                ),
                Section(data[4]["name"], data[4]["images"]),
                Section(data[5]["name"], data[5]["images"]),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
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
              "Explore",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 24.0,
                fontFamily: 'poppins-regular',
              ),
            ),
            Text(
              " pod",
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button("Home", Icons.video_library, Colors.blue),
           
            GestureDetector(child: _button("Search", Icons.search, Colors.red),
            onTap: (){
              Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute<bool>(
                    fullscreenDialog: true,
                    builder: (BuildContext context) => Search(),
                  ),
                );
            },
            ),
            GestureDetector(child: _button("Watch List", Icons.folder_open, Colors.amber),
            onTap: (){
              
             Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute<bool>(
                    fullscreenDialog: true,
                    builder: (BuildContext context) => Watchlist(),
                  ),
                );
            
            },
            ),
            GestureDetector(child: _button("More", Icons.settings, Colors.green),onTap: (){
             Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute<bool>(
                    fullscreenDialog: true,
                    builder: (BuildContext context) => ProfilePage(),
                  ),
                );
            },),
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
        Container(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/core/1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/core/2.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/core/3.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/core/4.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 36.0,
        ),
      ],
    );
  }

  Widget _button(String label, IconData icon, Color color) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
          decoration:
              BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 8.0,
            )
          ]),
        ),
        SizedBox(
          height: 12.0,
        ),
        Text(label),
      ],
    );
  }
}
