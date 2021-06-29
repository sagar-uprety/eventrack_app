import 'package:flutter/material.dart';

class ActionItemModel {
  final String title;
  final IconData icon;
  final void Function() onSelected;

  ActionItemModel(
      {required this.title, required this.icon, required this.onSelected});
}
