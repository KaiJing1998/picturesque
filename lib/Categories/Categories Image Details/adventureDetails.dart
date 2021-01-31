import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:picturesque/addscreen.dart';
import 'package:picturesque/images.dart';
import 'package:picturesque/profilescreen.dart';
import 'package:picturesque/searchscreen.dart';
import 'package:picturesque/mainscreen.dart';

class AdventureDetails extends StatefulWidget {
  final Images image;

  const AdventureDetails({Key key, this.image}) : super(key: key);
  @override
  _AdventureDetailsState createState() => _AdventureDetailsState();
}

class _AdventureDetailsState extends State<AdventureDetails> {
  double screenHeight, screenWidth;
  List imagesList;
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Feather.home,
                color: Colors.grey,
              ),
              label: 'HOME',
              activeIcon: Icon(
                Feather.home,
                color: Colors.red,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesome.search,
                color: Colors.grey,
              ),
              label: 'SEARCH',
              activeIcon: Icon(
                Feather.search,
                color: Colors.red,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                EvilIcons.plus,
                color: Colors.grey,
              ),
              label: 'ADD',
              activeIcon: Icon(
                Feather.plus,
                color: Colors.red,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                EvilIcons.user,
                color: Colors.grey,
                size: 36,
              ),
              label: 'PROFILE',
              activeIcon: Icon(
                Feather.user,
                color: Colors.red,
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              if (index == 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MainScreen()));
              } else if (index == 1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SearchScreen(
                              user: null,
                            )));
              } else if (index == 2) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddScreen()));
              } else if (index == 3) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProfileScreen()));
              }
            });
          },
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(widget.image.imagesdestination,
              style: TextStyle(color: Colors.black)),
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(15.0),
                height: screenHeight / 1.4,
                width: screenWidth / 1.0,
                child: CachedNetworkImage(
                  imageUrl:
                      "https://techvestigate.com/picturesque/image/${widget.image.imagescover}.jpg",
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(
                    Icons.broken_image,
                    size: screenWidth / 3,
                  ),
                )),
            /*Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: Column(children: <Widget>[
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.image.imagesdestination,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Product Story: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'ABOUT THE ARTIST',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.image.imagescaption,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
            ),*/
          ],
        ))));
  }
}