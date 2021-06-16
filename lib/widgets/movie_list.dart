import 'package:flutter/material.dart';
import 'package:mvvm_movieapp/const/styling.dart';
import 'package:mvvm_movieapp/viewmodels/movie_view_model.dart';

class MovieList extends StatelessWidget {
  final List<MovieViewModel> movies;

  MovieList({required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 48, bottom: 48),
      shrinkWrap: true,
      itemCount: this.movies.length,
      itemBuilder: (context, index) {
        final movie = this.movies[index];
        return Card(
          margin: EdgeInsets.only(bottom: 24),
          elevation: 0,
          color: AppTheme.searchBarColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(movie.multimedia.src)),
                      borderRadius: BorderRadius.circular(14)),
                  width: 140,
                  height: 200,
                ),
                Expanded(
                    child: ListTile(
                  title: Text(
                    movie.title,
                    style: TextStyle(
                        fontSize: 24,
                        color: AppTheme.lightText,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(
                        Icons.date_range_rounded,
                        color: AppTheme.orange,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        movie.year,
                        style: TextStyle(
                            color: AppTheme.orange,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        );
        // return ListTile(
        //   contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        //   horizontalTitleGap: 16,
        //   leading: Container(
        //     decoration: BoxDecoration(
        //         image: DecorationImage(
        //             fit: BoxFit.cover, image: NetworkImage(movie.poster)),
        //         borderRadius: BorderRadius.circular(14)),
        //     width: 80,
        //     height: 300,
        //   ),
        //   title: Text(
        //     movie.title,
        //     style: TextStyle(
        //         color: AppTheme.lightText, fontWeight: FontWeight.w500),
        //   ),
        //   subtitle: Text(
        //     '9.3',
        //     style: TextStyle(
        //         color: AppTheme.lightText, fontWeight: FontWeight.w500),
        //   ),
        // );
      },
    );
  }
}
