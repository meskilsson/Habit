import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data/classes/activity_class.dart';

//GET ALL

Future<List<Activity>> getActivities() async {
  final uri = Uri.parse(
    'http://10.0.2.2:5089/api/activities',
  );

  final response = await http.get(uri);

  if (response.statusCode != 200) {
    throw Exception('Failed to get activities');
  }

  final json = jsonDecode(response.body) as List<dynamic>;

  return json
      .map((item) => Activity.fromJson(item as Map<String, dynamic>))
      .toList();
}

//POST

Future<Activity> createActivity(String name, bool isCompleted) async {
  final uri = Uri.parse(
    'http://10.0.2.2:5089/api/activities',
  );

  final response = await http.post(
    uri,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'name': name,
      'isCompleted': isCompleted,
    }),
  );

  if (response.statusCode != 201) {
    throw Exception('Failed to create activity');
  }

  final json = jsonDecode(response.body) as Map<String, dynamic>;

  return Activity.fromJson(json);
}

Future<Activity> updateActivity(int id, String name, bool isCompleted) async {
  final uri = Uri.parse(
    'http://10.0.2.2:5089/api/activities/$id',
  );

  final response = await http.put(
    uri,
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      'name': name,
      'isCompleted': isCompleted,
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to update activity');
  }

  final json = jsonDecode(response.body) as Map<String, dynamic>;

  return Activity.fromJson(json);
}

Future<bool> deleteActivity(int id) async {
  final uri = Uri.parse(
    'http://10.0.2.2:5089/api/activities/$id',
  );

  final response = await http.delete(uri);

  if (response.statusCode == 204) {
    return true;
  }

  return false;
}
