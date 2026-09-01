import 'package:flutter/material.dart';
import 'package:habit/data/classes/activity_class.dart';
import 'package:habit/services/activities_service.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  late Future<List<Activity>> activitiesFuture;

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
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (asyncSnapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${asyncSnapshot.error}',
              ),
            );
          }

          final activities = asyncSnapshot.data ?? [];

          if (activities.isEmpty) {
            return const Center(
              child: Text('No activities found'),
            );
          }

          return ListView.builder(
            itemCount: activities.length,
            itemBuilder: (context, index) {
              final activity = activities[index];

              return Card(
                child: ListTile(
                  title: Text(activity.name),
                  minTileHeight: 100,
                  trailing: Checkbox(
                    value: activity.isCompleted,
                    onChanged: (value) async {
                      if (value == null) return;

                      await updateActivity(
                        activity.id,
                        activity.name,
                        value,
                      );

                      setState(() {
                        activitiesFuture = getActivities();
                      });
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
