class Activity {
  final String activity;
  final double availability;
  final String type;
  final int participants;
  final String accessibility;
  final String duration;
  final bool kidFriendly;
  final String link;
  final String key;
  final Uri? repository;

  Activity({
    required this.activity,
    required this.availability,
    required this.type,
    required this.participants,
    required this.accessibility,
    required this.duration,
    required this.kidFriendly,
    required this.link,
    required this.key,
    this.repository,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    final repository = json['repository'] as String?;

    return Activity(
      activity: json['activity'] as String,
      availability: (json['availability'] as num).toDouble(),
      type: json['type'] as String,
      participants: json['participants'] as int,
      accessibility: json['accessibility'] as String,
      duration: json['duration'] as String,
      kidFriendly: json['kidFriendly'] as bool,
      link: json['link'] as String,
      key: json['key'] as String,
      repository: repository != null ? Uri.tryParse(repository) : null,
    );
  }
}
