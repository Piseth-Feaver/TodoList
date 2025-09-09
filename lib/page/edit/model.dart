class EditRequest{
  final int id;
  final String name;
  final String date;
  final String description;
  final String startTime;
  final String endTime;
  final String status;
  final int userId;
  EditRequest({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.userId,
  });
  factory EditRequest.fromJson(Map<String, dynamic> json) {
    return EditRequest(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      status: json['status'],
      userId: json['userId'],
    );
  }

}
class EditResponse{
  final String name;
  final String description;
  final String date;
  final String startTime;
  final String endTime;
  EditResponse({
    required this.name,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'date': date.toString(),
      'startTime': startTime.toString(),
      'endTime': endTime.toString(),
    };
  }
  factory EditResponse.fromJson(Map<String, dynamic> json) {
    return EditResponse(
      name: json['name'],
      description: json['description'],
      date: json['date'],
      startTime:json['startTime'],
      endTime: json['endTime'],
    );
  }

}