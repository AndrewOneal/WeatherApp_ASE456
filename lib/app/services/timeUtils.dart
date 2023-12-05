import 'package:intl/intl.dart';

class TimeUtils {
  String convertTimestampToTime(int timestamp) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }

  String getCurrentTime() {
    var now = DateTime.now();
    var formattedTime = DateFormat('EEEE d · h:mm a').format(now);
    return formattedTime;
  }
}
