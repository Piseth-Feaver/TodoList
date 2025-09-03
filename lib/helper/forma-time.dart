import 'package:intl/intl.dart';

final _parseFormatWithMs = DateFormat("HH:mm:ss.SSSSSSS");
final _parseFormatNoMs = DateFormat("HH:mm:ss");
final _displayFormat = DateFormat("h:mm a");

String formatStartTime(String start) {
  DateTime startTime;
  try {
    startTime = _parseFormatWithMs.parse(start);
  } catch (_) {
    startTime = _parseFormatNoMs.parse(start);
  }
  return _displayFormat.format(startTime);
}

String formatEndTime(String end) {
  DateTime endTime;
  try {
    endTime = _parseFormatWithMs.parse(end);
  } catch (_) {
    endTime = _parseFormatNoMs.parse(end);
  }
  return _displayFormat.format(endTime);
}
