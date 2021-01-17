import 'package:get_it/get_it.dart';

import 'core/networking/ApiProvider.dart';
import 'core/networking/ApiProviderImp.dart';
import 'core/provider/movie_provider.dart';
import 'core/services/repo/movieService.dart';
import 'core/services/repo/movieServiceImp.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {

  serviceLocator.registerLazySingleton<ApiProvider>(() => ApiProviderImp());
  serviceLocator.registerLazySingleton<MovieService>(() => MovieServiceImp());
  

  serviceLocator.registerFactory(() => MovieProvider());
}

