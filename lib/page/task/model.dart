import 'package:intl/intl.dart';

class CreateTaskRequest {
  final String taskName;
  final String description;
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;

  CreateTaskRequest({
    required this.taskName,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  Map<String, dynamic> toJson() {
    return {
      "taskName": taskName,
      "description": description,
      "date": DateFormat('yyyy-MM-dd').format(date),
      "startTime": DateFormat('HH:mm').format(startTime),
      "endTime": DateFormat('HH:mm').format(endTime),
    };
  }
}


class CreateTaskResponse {
  final int id;
  final String? taskName;
  final String description;
  final String date;
  final String startTime;
  final String endTime;
  final int userId;

  CreateTaskResponse({
    required this.id,
    required this.taskName,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.userId,
  });

  factory CreateTaskResponse.fromJson(Map<String, dynamic> json) {
    return CreateTaskResponse(
      id: json['id'],
      taskName: json['taskName'],
      description: json['description'],
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      userId: json['userId'],
    );
  }
}
