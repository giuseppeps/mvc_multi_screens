import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppTexts {
  // Global
  static const String unAuthClient = 'UnauthenticatedClient';
  static const String authClient = 'AuthenticatedClient';
  static const String baseUrl = 'api.football-data.org';
  static String apiKey = dotenv.env['API_KEY'] ?? '';

  // endpoints
  static const String matches = 'matches/';
  String leagueTable(int leagueId) => 'competitions/$leagueId/standings';
}
