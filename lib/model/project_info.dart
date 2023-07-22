import 'package:flutter/material.dart';
import 'package:myportfolio/configs/configs.dart';

class ProjectInfo {
  final IconData icon;
  final String label;
  bool? isTag;
  bool? isLink;
  final List<String> contents;
  ProjectInfo({
    required this.icon,
    required this.label,
    required this.contents,
    this.isTag = false,
    this.isLink = false,
  });

  factory ProjectInfo.empty() {
    return ProjectInfo(icon: kiLink, label: '', contents: ['']);
  }
}
