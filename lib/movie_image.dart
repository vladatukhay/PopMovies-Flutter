import 'package:flutter/material.dart';

class MovieImage extends StatelessWidget {

  final movies;
  final i;
  Color mainColor = const Color(0xff3C3261);
  var image_url = 'https://image.tmdb.org/t/p/w500/';

  MovieImage(this.movies, this.i);

  @override
  Widget build(BuildContext context) {
    return new Container(
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
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              width: 80.0,
              height: 120.0,
              image: NetworkImage(image_url + movies[i]['poster_path']),
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
