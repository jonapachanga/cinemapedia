import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Inmutable Provider 
final movieRepositoryProvider = Provider<MovieRepositoryImpl>((ref) {
  
  return MovieRepositoryImpl( MovieDbDatasource() );
});