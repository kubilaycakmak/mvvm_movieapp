
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvvm_movieapp/models/movie.dart'; 


class Webservice {

  Future<List<Movie>?> fetchMovies(String keyword) async {
    final url = "http://www.omdbapi.com/?s=$keyword&apikey=79e80d9f";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
       final body = jsonDecode(response.body); 
       if(body['Response'] == "True"){
        final Iterable json = body["Search"];
        return json.map((movie) => Movie.fromJson(movie)).toList();
       }

    } else {
      throw Exception("Unable to perform request!");
    }
  }
}