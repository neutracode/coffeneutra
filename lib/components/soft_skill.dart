import 'package:flutter/material.dart';

List<Widget> getSoftSkillIcons() {
  return [
    const Column(
      children: [
        Icon(Icons.access_time, size: 50),
        Text('Time Management'),
      ],
    ),
    const Column(
      children: [
        Icon(Icons.flash_on, size: 50),
        Text('Fast Adaption'),
      ],
    ),
    const Column(
      children: [
        Icon(Icons.lightbulb_outline, size: 50),
        Text('Problem Solving'),
      ],
    ),
    const Column(
      children: [
        Icon(Icons.group, size: 50),
        Text('Team Work'),
      ],
    ),
    const Column(
      children: [
        Icon(Icons.search, size: 50),
        Text('Attention to Detail'),
      ],
    ),
    const Column(
      children: [
        Icon(Icons.school, size: 50),
        Text('Fast Learner'),
      ],
    ),
  ];
}
