import 'dart:async';
import 'dart:convert';
import 'package:first_flutter/widgets/discover_carousel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MoviesList extends StatefulWidget {
  @override
  MoviesListState createState() {
    return new MoviesListState();
  }
}

class MoviesListState extends State<MoviesList> {

  var movies;
  var i;
  Color mainColor = const Color(0xFF000000);
  String categoryTitle;

  void getData() async {
    var data = await fetchDiscoverMovies();

    setState(() {
      movies = data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("movietime"),
          centerTitle: true,
          leading: InkWell(
            child: Icon(Icons.menu),
            onTap: () {
              print("click menu");
            },
          ),
          actions: <Widget>[
            InkWell(
              child: Icon(Icons.search),
              onTap: () {
                print("click search");
              },
            ),
            SizedBox(width: 10),
            InkWell(
              child: Icon(Icons.perm_identity),
              onTap: () {
                print("click more");
              },
            ),
            SizedBox(width: 15.0),
          ],
          iconTheme: IconThemeData(color: Colors.black, size: 30),
          textTheme:
          TextTheme(title: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20.0),
              DiscoverCarousel(movies, i),
            ],
          )
        )
    );
  }
}

  Future<Map> fetchDiscoverMovies() async {
    final response = await http.get('https://api.themoviedb.org/3/discover/movie?api_key=apiKey');

    if (response.statusCode != 200) {
      throw new Exception('error getting quotes');
    }
    return json.decode(response.body);
  }



//  void _navigateToDetails(BuildContext context) {
//    Navigator.push(context, MaterialPageRoute(
//      builder: (context) => MovieDetails()
//    ));
//  }

class CategoryTitle extends StatelessWidget {
  final Color mainColor;
  final String categoryTitle;

  CategoryTitle(this.mainColor, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: new Text(
        categoryTitle,
        style: new TextStyle(
            fontSize: 18.0,
            color: mainColor,
            fontFamily: 'Arvo'
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}



