import 'package:ai_hr/features/interview_type/presentation/widget/app_bar_icon.dart';
import 'package:ai_hr/core/utils/flavor.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Environment ${appFlavor}'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: AppBarIcon(),
          ),
        ],
      ),
    );
  }
}
