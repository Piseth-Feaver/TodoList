class DetailRequest{
  final int id;
  final String name;
  final String description;
  final String startTime;
  final String endTime;
  final String status;
  DetailRequest({
    required this.id,
    required this.name,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.status,
  });
  factory DetailRequest.fromJson(Map<String, dynamic> json) {
    return DetailRequest(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      status: json['status'],
    );
  }

}