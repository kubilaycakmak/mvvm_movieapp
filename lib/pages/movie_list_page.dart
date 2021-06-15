import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mvvm_movieapp/const/styling.dart';
import 'package:mvvm_movieapp/viewmodels/movie_list_view_model.dart';
import 'package:mvvm_movieapp/widgets/movie_list.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  @override 
  _MovieListPageState createState() => _MovieListPageState(); 
}

class _MovieListPageState extends State<MovieListPage> {

  final TextEditingController _controller = TextEditingController(); 

  @override
  void initState() {
    super.initState();
    // you can uncomment this to get all batman movies when the page is loaded
    //Provider.of<MovieListViewModel>(context, listen: false).fetchMovies("batman");
  }

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<MovieListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: 
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          
          child: Text.rich(
            TextSpan(
              text: '', // default text style
              children: <TextSpan>[
                TextSpan(text: 'the ', style: TextStyle(fontWeight: FontWeight.w200)),
                TextSpan(text: 'white ', style: TextStyle(fontWeight: FontWeight.w900)),
                TextSpan(text: 'screen.', style: TextStyle(fontWeight: FontWeight.w900)),
              ],
            ),
          ),
        ),
        // Text("the white screen", style: TextStyle(color: AppTheme.lightText),),
        backgroundColor: AppTheme.darkBackground,
        elevation: 0,

      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color:  AppTheme.darkBackground,
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10),
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppTheme.searchBarColor, 
              borderRadius: BorderRadius.circular(16)
            ),
            child: TextField(
              controller: _controller,
              onSubmitted: (value) {
                if(value.isNotEmpty) {
                  vm.fetchMovies(value);
                  _controller.clear();
                }
              },
              
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: AppTheme.lightText,),
                hintText: "Search",
                hintStyle: TextStyle(color: Color.fromRGBO(255,255, 255,0.3)),
                border: InputBorder.none
              ),
            ),
          ), 
          Expanded(
            child: MovieList(movies: vm.movies))
        ])
      )
   
    );
  }
}