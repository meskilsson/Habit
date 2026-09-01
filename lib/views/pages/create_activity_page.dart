import 'package:flutter/material.dart';
import 'package:habit/data/constants.dart';
import 'package:habit/services/activities_service.dart';
import 'package:habit/data/classes/activity_class.dart';

class CreateActivityPage extends StatefulWidget {
  const CreateActivityPage({super.key});

  @override
  State<CreateActivityPage> createState() => _CreateActivityPageState();
}

class _CreateActivityPageState extends State<CreateActivityPage> {
  final TextEditingController controllerActivity = TextEditingController();
  Activity? createdActivity;

  @override
  void dispose() {
    controllerActivity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                'Create your activities for the day',
                style: KTextStyle.titleTealText,
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: controllerActivity,
                decoration: InputDecoration(
                  hintText: 'activity',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: () async {
                      final name = controllerActivity.text.trim();
                      if (name.isEmpty) {
                        return;
                      }

                      final activity = await createActivity(
                        name,
                        false,
                      );

                      if (!mounted) return;

                      setState(() {
                        createdActivity = activity;
                      });

                      controllerActivity.clear();
                    },
                    child: const Text('Add Activity'),
                  ),
                ],
              ),
              if (createdActivity != null)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID: ${createdActivity!.id}'),
                        Text('Activity: ${createdActivity!.name}'),
                        Text('Completed: ${createdActivity!.isCompleted}'),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
