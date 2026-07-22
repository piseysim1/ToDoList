import 'package:flutter/material.dart';
import 'package:todolist_app/app/core/theme/theme.dart';

class GroupStyle {
  final Color bg;
  final Color iconBg;
  final Color iconColor;
  final Color progressColor;
  final IconData icon;

  const GroupStyle({
    required this.bg,
    required this.iconBg,
    required this.iconColor,
    required this.progressColor,
    required this.icon,
  });

  static final Map<String, GroupStyle> _groupStyles = {
    'Work': GroupStyle(
      bg: pinklight,
      iconBg: pink60,
      iconColor: pink80,
      progressColor: pink80,
      icon: Icons.business_center,
    ),
    'Personal': GroupStyle(
      bg: purple20,
      iconBg: purple20,
      iconColor: purple50,
      progressColor: purple50,
      icon: Icons.account_box,
    ),
    'Study': GroupStyle(
      bg: orangelight,
      iconBg: orangelight,
      iconColor: orange50,
      progressColor: orange50,
      icon: Icons.auto_stories,
    ),
  };

  static final List<GroupStyle> _fallbackPalette = [
    GroupStyle(
      bg: yellowlight,
      iconBg: yellowlight,
      iconColor: yellow50,
      progressColor: yellow50,
      icon: Icons.folder,
    ),
  ];

  static GroupStyle styleFor(String groupName, int fallbackIndex) {
    return _groupStyles[groupName] ??
        _fallbackPalette[fallbackIndex % _fallbackPalette.length];
  }
}
