import 'package:flutter/material.dart';
import 'package:habit/data/constants.dart';
import 'package:habit/views/pages/course_page.dart';
import 'package:habit/views/widgets/container_widget.dart';
import 'package:habit/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      KValue.keyConcepts,
      KValue.cleanUi,
      KValue.fixBugs,
      KValue.basicLayout,
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            HeroWidget(
              title: 'Habit',
              nextPage: CoursePage(),
            ),
            ...List.generate(
              list.length,

              (index) {
                return ContainerWidget(
                  title: list.elementAt(index),
                  description: 'The description of this',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
