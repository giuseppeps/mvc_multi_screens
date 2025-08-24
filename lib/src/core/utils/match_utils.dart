import 'package:intl/intl.dart';
import 'package:mvc_multi_screens/src/features/home/model/match_model.dart';

enum MatchStatus { live, upcoming, finished }

class MatchUtils {
  static const Duration _matchWindow = Duration(hours: 2, minutes: 30);

  static MatchStatus getStatus(MatchModel match) {
    final now = DateTime.now();
    final start = match.date.isUtc ? match.date.toLocal() : match.date;
    final end = start.add(_matchWindow);

    if (now.isAfter(start) && now.isBefore(end)) {
      return MatchStatus.live;
    } else if (now.isAfter(end)) {
      return MatchStatus.finished;
    } else {
      return MatchStatus.upcoming;
    }
  }

  static String formatHour(DateTime date) {
    final localDate = date.isUtc ? date.toLocal() : date;
    return DateFormat.jm().format(localDate);
  }
}
