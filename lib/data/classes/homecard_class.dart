import 'package:flutter/material.dart';

class HomeCardItem {
  final String title;
  final String description;
  final WidgetBuilder pageBuilder;

  const HomeCardItem({
    required this.title,
    required this.description,
    required this.pageBuilder,
  });
}
