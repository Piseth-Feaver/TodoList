class TodayTask {
  final int id;
  final String name;
  final String date;
  final String description;
  final String startTime;
  final String endTime;
  String status;

  TodayTask({
    required this.id,
    required this.name,
    required this.date,
    required this.description,
    required this.startTime,
    this.status = "pending",
    required this.endTime,
  });

  factory TodayTask.fromJson(Map<String, dynamic> json) {
    return TodayTask(
      id: json['id'],
      name: json['name'],
      date: json['date'],
      description: json['description'],
      startTime: json['startTime'],
      status: json['status'] ?? "pending",
      endTime: json['endTime'],
    );
  }
}


class UpdateStatus{
  final int id;
  final String status;
  UpdateStatus({
    required this.id,
    required this.status,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
    };
  }
  factory UpdateStatus.fromJson(Map<String, dynamic> json) {
    return UpdateStatus(
      id: json['id'],
      status: json['status'],
    );
  }
}