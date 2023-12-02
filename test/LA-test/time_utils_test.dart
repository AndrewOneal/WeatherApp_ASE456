import 'package:climate/app/services/timeUtils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TimeUtils', () {
    TimeUtils timeUtils = TimeUtils();

    setUp(() {
      timeUtils = TimeUtils();
    });

    test('convertTimestampToTime should return formatted time', () {
      int timestamp = 1701066407;
      var result = timeUtils.convertTimestampToTime(timestamp);

      expect(result, '1:26am');
      expect(result, isNot('1:26pm'));
    });

    test('getCurrentTime should return formatted current time', () {
      var result = timeUtils.getCurrentTime();

      var regex = RegExp(r'^[A-Za-z]+ \d+ · \d{1,2}:\d{2} [APMapm]{2}$');

      expect(result, matches(regex));
      expect(result, isNot(matches("${regex}.")));
    });
  });
}
