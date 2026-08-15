import 'package:flutter/material.dart';
import 'package:habit/data/classes/activity_class.dart';
import 'package:habit/data/exceptions/activity_exception.dart';
import 'package:habit/views/widgets/hero_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Activity? activity;

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  void initState() {
    loadActivity();
    super.initState();
  }

  Future<void> loadActivity() async {
    final result = await getActivity();

    setState(
      () {
        activity = result;
      },
    );
  }

  Future<Activity> getActivity() async {
    final activityUrl = Uri.https('bored-api.appbrewery.com', '/random');
    final activityResponse = await http.get(activityUrl);

    if (activityResponse.statusCode != 200) {
      throw ActivityRetrievalException(
        statusCode: activityResponse.statusCode,
      );
    }

    final activityJson =
        json.decode(activityResponse.body) as Map<String, dynamic>;

    return Activity.fromJson(activityJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            HeroWidget(
              title: 'Habit',
            ),
            Text(activity?.accessibility ?? 'Loading...'),
          ],
        ),
      ),
    );
  }
}
