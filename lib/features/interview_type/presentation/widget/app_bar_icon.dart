import 'dart:io';

import 'package:ai_hr/features/interview_type/presentation/controller/app_bar_controller.dart';
import 'package:ai_hr/features/interview_type/presentation/widget/app_bar_action_mixin.dart';
import 'package:ai_hr/features/interview_type/presentation/widget/platform_tooltip_shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget with AppBarActionsMixin {
  AppBarIcon({super.key});
  final AppBarController _controller = AppBarController.instance;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onOpened: () => _controller.toggleOpen(),
      onCanceled: () => _controller.toggleOpen(),
      position: PopupMenuPosition.under,
      elevation: 0,
      itemBuilder:
          (BuildContext context) => <PopupMenuEntry>[
            PopupMenuItem(
              value: AppBarActions.technical,
              onTap: () => {_controller.toggleOpen()},
              child: ListTile(
                leading: AppBarActions.technical.icon,
                title: Text(AppBarActions.technical.title),
              ),
            ),

            PopupMenuItem(
              value: AppBarActions.behavioral,
              onTap: () => {_controller.toggleOpen()},
              child: ListTile(
                leading: AppBarActions.behavioral.icon,
                title: Text(AppBarActions.behavioral.title),
              ),
            ),

            PopupMenuItem(
              value: AppBarActions.stress,
              onTap: () => {_controller.toggleOpen()},
              child: ListTile(
                leading: AppBarActions.stress.icon,
                title: Text(AppBarActions.stress.title),
              ),
            ),

            PopupMenuItem(
              value: AppBarActions.special,
              onTap: () => {_controller.toggleOpen()},
              child: ListTile(
                leading: AppBarActions.special.icon,
                title: Text(AppBarActions.special.title),
              ),
            ),
          ],
      child: const Icon(CupertinoIcons.gear, color: Colors.black87),
    );
  }
}
