import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MovieDbDatasource extends MovieDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbApiKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 0}) async {
    final respose = await dio.get('/movie/now_playing');

    final movieDBResponse = MovieDbResponse.fromJson(respose.data);

    final List<Movie> movies = movieDBResponse.results
                   .where((element) => element.posterPath != 'no-poster')
        .map((e) => MovieMapper.movieDBToEntity(e))
        .toList();

    return movies;
  }
}
