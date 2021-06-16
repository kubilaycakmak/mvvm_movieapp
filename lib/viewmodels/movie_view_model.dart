import 'package:mvvm_movieapp/models/movie.dart';
import 'package:mvvm_movieapp/models/multimedia.dart';

class MovieViewModel {
  final Movie movie;

  MovieViewModel({required this.movie});

  String get title {
    return this.movie.display_title;
  }

  String get byLine {
    return this.movie.byline;
  }

  Multimedia get multimedia {
    return this.movie.multimedia;
  }

  String get description {
    return this.movie.summary_short;
  }

  String get year {
    return this.movie.publication_date;
  }
}
