

import 'package:flutter/material.dart';
import 'package:mvvm_movieapp/const/styling.dart';
import 'package:mvvm_movieapp/viewmodels/movie_view_model.dart';

class MovieList extends StatelessWidget {

  final List<MovieViewModel> movies; 

  MovieList({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: this.movies.length,
        itemBuilder: (context, index) {
          final movie = this.movies[index];
          return SizedBox(
            height: 200,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              horizontalTitleGap:16,
              leading: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(movie.poster)
                  ),
                  borderRadius: BorderRadius.circular(14)
                ),
                width: 80, 
                height: 300,
                ),
              title: Text(movie.title, style: TextStyle(color: AppTheme.lightText, fontWeight: FontWeight.w500),),
              subtitle: Text('9.3', style: TextStyle(color: AppTheme.lightText, fontWeight: FontWeight.w500),),
            ),
          );
        },
      ),
    );
  }
}