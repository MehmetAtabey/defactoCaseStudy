import 'dart:convert';
import 'package:defactoCaseStudy/core/enums/viewstate.dart';
import 'package:defactoCaseStudy/core/model/movie.dart';
import 'package:defactoCaseStudy/core/services/repo/movieService.dart';
import '../../locator.dart';
import 'base_provider.dart';

class MovieProvider extends BaseProvider {
  final MovieService _movieService = serviceLocator<MovieService>();
  List<Search> _items = [];
  List<Search> _favs = [];

  List<Search> get items {
    return [..._items];
  }

  List<Search> get favs {
    return [..._favs];
  }

  Future<void> getMoviesByTitle(String text) async {
    setState(ViewState.Busy);
    final response = await _movieService.getMoviesByTitle(text);
    _items = movieFromJson(response).search;
    setState(ViewState.Idle);
  }

  Future<void> setMoviesForFavorites(Search movie) async{
    if (_favs.contains(movie))
      _favs.remove(movie);
    else
      _favs.add(movie);
   setState(ViewState.Idle);   
  }
}
