import 'package:flutter/material.dart';

class IconsHelpers {
  static IconData? getCategoryIcon(String category) {
    switch (category) {
      case "music":
        return Icons.music_note_outlined;
      case "sports":
        return Icons.sports_soccer_outlined;
      case "holiday":
        return Icons.beach_access_outlined;
      case "nightlife":
        return Icons.nightlife_outlined;
    }
  }
}
