import 'package:flowx/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class SerchLocationPage extends StatelessWidget {
  const SerchLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Weather",
          style: AppTextStyles.subTopicStyle,
        ),
      ),
    );
  }
}
