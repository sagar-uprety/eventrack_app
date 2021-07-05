import 'package:flutter/material.dart';

class OverviewItemModel {
  final String title;
  final int count;
  final Color color;
  final void Function()? onClicked;

  OverviewItemModel({
    required this.title,
    this.count = 0,
    required this.color,
    this.onClicked,
  });
}
