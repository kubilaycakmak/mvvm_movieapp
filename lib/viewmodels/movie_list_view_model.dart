
import 'package:flutter/foundation.dart';
import 'package:mvvm_movieapp/services/webservice.dart';
import 'package:mvvm_movieapp/viewmodels/movie_view_model.dart';
class MovieListViewModel extends ChangeNotifier {

  // ignore: deprecated_member_use
  List<MovieViewModel> movies = <MovieViewModel>[]; 

  Future<void> fetchMovies(String keyword) async {
    final results =  await Webservice().fetchMovies(keyword);
    this.movies = results!.map((item) => MovieViewModel(movie: item)).toList();
    print(this.movies);
    notifyListeners(); 
  }
}