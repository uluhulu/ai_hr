import 'package:ai_hr/features/interview_type/presentation/choose_interview_type.dart';
import 'package:ai_hr/features/interview_type/presentation/main_page.dart';
import 'package:ai_hr/features/profile/profile_page.dart';
import 'package:flutter/material.dart';

class NavifationWidget extends StatefulWidget {
  const NavifationWidget({super.key});

  @override
  State<NavifationWidget> createState() => _NavifationWidgetState();
}

class _NavifationWidgetState extends State<NavifationWidget> {
  @override
  Widget build(BuildContext context) {
    final BottomNavigationController controller = BottomNavigationController();
    return ChooseInterviewOverlay(
      child: ValueListenableBuilder<int>(
        valueListenable: controller.currentIndexNotifier,
        builder: (BuildContext context, int index, Widget? child) {
          return Scaffold(
            bottomNavigationBar: NavigationBar(
              indicatorColor: Colors.purple.shade50,
              selectedIndex: index,
              destinations: <Widget>[
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              onDestinationSelected: (int index) => controller.setIndex(index),
            ),
            body: IndexedStack(
              index: index,
              children: <Widget>[MainPage(), ProfilePage()],
            ),
          );
        },
      ),
    );
  }
}

final class BottomNavigationController {
  static final BottomNavigationController _instance =
      BottomNavigationController._internal();

  factory BottomNavigationController() {
    return _instance;
  }

  BottomNavigationController._internal();

  ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);

  int currentIndex = 0;

  void setIndex(int index) {
    currentIndexNotifier.value = index;
  }
}
