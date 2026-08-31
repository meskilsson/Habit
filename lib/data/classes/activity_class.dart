class Activity {
  final int id;
  final String name;
  final bool isCompleted;

  Activity({
    required this.id,
    required this.name,
    required this.isCompleted,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'] as int,
      name: json['name'] as String,
      isCompleted: json['isCompleted'] as bool,
    );
  }
}
