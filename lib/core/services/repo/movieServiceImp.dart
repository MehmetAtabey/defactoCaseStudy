
import 'package:defactoCaseStudy/core/networking/ApiProvider.dart';
import '../../../locator.dart';
import 'movieService.dart';

class MovieServiceImp implements MovieService {
  static const getMoviesSearchEndPoint = "";

  ApiProvider _webApi = serviceLocator<ApiProvider>();


  @override
  Future getMoviesByTitle(String text) async{
    var params = {
      "s": text,
      "apikey":"c5f39490"
    };
    return await _webApi.postmethod(getMoviesSearchEndPoint, params);
  }
}
