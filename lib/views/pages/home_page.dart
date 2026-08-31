import 'package:flutter/material.dart';
import 'package:habit/data/constants.dart';
import 'package:habit/views/pages/activities_page.dart';
import 'package:habit/views/pages/course_page.dart';
import 'package:habit/views/pages/create_activity_page.dart';
import 'package:habit/views/widgets/container_widget.dart';
import 'package:habit/views/widgets/hero_widget.dart';
import 'package:habit/data/classes/homecard_class.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HomeCardItem> items = [
      HomeCardItem(
        title: KValue.activities,
        pageBuilder: (context) => const ActivitiesPage(),
        description: 'Your daily activities',
      ),
      HomeCardItem(
        title: KValue.createActivities,
        description: 'Create your daily activities',
        pageBuilder: (context) => const CreateActivityPage(),
      ),
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 10.0),
            HeroWidget(
              title: 'Habit',
              nextPage: CoursePage(),
            ),
            SizedBox(height: 5.0),
            ...List.generate(
              items.length,

              (index) {
                final item = items[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: item.pageBuilder,
                      ),
                    );
                  },
                  child: ContainerWidget(
                    title: item.title,
                    description: item.description,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
