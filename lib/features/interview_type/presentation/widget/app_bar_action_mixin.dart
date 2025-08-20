import 'package:flutter/material.dart';

mixin AppBarActionsMixin {
  void onActionPressed({required AppBarActions action}) {
    switch (action) {
      case AppBarActions.technical:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AppBarActions.behavioral:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AppBarActions.stress:
        // TODO: Handle this case.
        throw UnimplementedError();
      case AppBarActions.special:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}

enum AppBarActions {
  technical(
    title: "Technical Interview",
    icon: Icon(Icons.military_tech_outlined),
  ),
  behavioral(title: "Behavioral Interview", icon: Icon(Icons.beach_access)),
  stress(title: "Stress Interview", icon: Icon(Icons.stream)),
  special(title: "Special Interview", icon: Icon(Icons.spellcheck));

  const AppBarActions({required this.title, required this.icon});
  final String title;
  final Icon icon;
}
