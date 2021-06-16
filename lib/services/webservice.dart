import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvvm_movieapp/models/movie.dart';

class Webservice {
  Future<List<Movie>?> fetchMovies(String keyword) async {
    // final url = "http://www.omdbapi.com/?s=$keyword&apikey=79e80d9f";
    final url =
        "https://api.nytimes.com/svc/movies/v2/reviews/search.json?query=$keyword&api-key=LIuAyETCYEVaiXpEsT0q36cysLAESyNJ";
    final response = await http.get(Uri.parse(url));
    print(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      if (body['results'].toString() != "Null") {
        final Iterable json = body["results"];
        return json.map((movie) => Movie.fromJson(movie)).toList();
      }
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
