class TodayTask {
  final int id ;
  final String name;
  final String date;
  final String description;
  final String startTime;
  final String endTime;
  final String status;

  TodayTask({
    required this.id,
    required this.name,
    required this.date,
    required this.description,
    required this.startTime,
    required this.status,
    required this.endTime,
  });
  factory TodayTask.fromJson(Map<String, dynamic> json) {
    return TodayTask(
      id: json['id'],
      name: json['name'],
      date: json['date'],
      description: json['description'],
      startTime: json['startTime'],
      status: json['status'],
      endTime:json['endTime'],
    );
  }
}