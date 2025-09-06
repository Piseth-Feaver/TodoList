class EditRequest{
  final int id;
  final String name;
  final String date;
  final String description;
  final String startTime;
  final String endTime;
  final String status;
  EditRequest({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.status,
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