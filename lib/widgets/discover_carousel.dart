import 'package:flutter/material.dart';

class DiscoverCarousel extends StatelessWidget {

  final movies;
  final i;
  final image_url = 'https://image.tmdb.org/t/p/w500/';
  final Color mainColor = const Color(0xFF000000);

  const DiscoverCarousel(this.movies, this.i);

  @override
  Widget build(BuildContext context) {
    return new Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'DISCOVER',
                            style: TextStyle(
                            fontSize: 18.0,
                            color: mainColor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5
                            ),
                          ),
                          GestureDetector(
                            onTap: () => print('Show all'),
                            child: Text(
                              'Show all',
                              style: TextStyle(
                              fontSize: 18.0,
                              color: mainColor,
                              ),
                            ),
                          ),
                      ],
                    ),),
                    SizedBox(height: 15.0),
                    Container(
                      height: 220.0,
                      //color: Colors.blue,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies == null ? 0 : movies.length,
                          itemBuilder: (context, i) {
                          return Container(
                            width: 150.0,
                           // color: Colors.red,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: <Widget>[
                                Positioned(
                                  bottom: 5.0,
                                  child: Container(
                                    height: 30.0,
                                    width: 130.0,
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          movies[i]['title'],
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0.0, 2.0),
                                          blurRadius: 6.0,
                                        )
                                      ]
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15.0),
                                        child: Image(
                                          width: 130.0,
                                          height: 180.0,
                                          image: NetworkImage(image_url + movies[i]['poster_path']),
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                  ],
                                ),
                              );
                              },
                          ),
                        )
                  ],
    );
  }
}