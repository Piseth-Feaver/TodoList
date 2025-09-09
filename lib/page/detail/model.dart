class DetailRequest{
  final int id;
  final String name;
  final String description;
  final String startTime;
  final String date;
  final String endTime;
  final String status;
  final int userId;
  DetailRequest({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.userId,
  });
  factory DetailRequest.fromJson(Map<String, dynamic> json) {
    return DetailRequest(
      id: json['id'],
      name: json['name'],
      date: json['date'],
      description: json['description'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      status: json['status'],
      userId: json['userId'],
    );
  }

}