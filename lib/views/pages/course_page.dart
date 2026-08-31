import 'package:flutter/material.dart';
import 'package:habit/data/classes/activity_class.dart';
import 'package:habit/services/activities_service.dart';
import 'package:habit/views/widgets/hero_widget.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late final Future<List<Activity>> activitiesFuture;

  @override
  void initState() {
    super.initState();

    activitiesFuture = getActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Activity>>(
        future: activitiesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          final activities = snapshot.data ?? [];

          if (activities.isEmpty) {
            return const Center(
              child: Text('No activities found'),
            );
          }

          final activity = activities.first;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                HeroWidget(
                  title: activity.name,
                ),
                Text(activity.name),
                Checkbox(
                  value: activity.isCompleted,
                  onChanged: null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
