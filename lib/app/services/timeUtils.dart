import 'package:intl/intl.dart';

class TimeUtils {
  String convertTimestampToTime(int timestamp) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var formattedTime =
        '${dateTime.hour}:${dateTime.minute}${dateTime.hour >= 12 ? 'pm' : 'am'}';
    return formattedTime;
  }

  String getCurrentTime() {
    var now = DateTime.now();
    var formattedTime = DateFormat('EEEE d · h:mm a').format(now);
    return formattedTime;
  }
}
