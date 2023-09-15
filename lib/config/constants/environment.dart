import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static final String theMovieDbApiKey=dotenv.env['THE_MOVIEDB_KEY'] ?? 'No API Key'; 
}