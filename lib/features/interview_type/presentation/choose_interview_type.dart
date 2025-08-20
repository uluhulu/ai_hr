import 'package:ai_hr/features/interview_type/presentation/controller/app_bar_controller.dart';
import 'package:ai_hr/features/interview_type/presentation/widget/app_bar_icon.dart';
import 'package:flutter/material.dart';

class ChooseInterviewOverlay extends StatelessWidget {
  ChooseInterviewOverlay({super.key, required this.child});
  final Widget child;
  final AppBarController _controller = AppBarController.instance;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        ValueListenableBuilder(
          valueListenable: _controller.isOpen,
          builder:
              (c, value, _) =>
                  value ? const BarrierContainer() : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class BarrierContainer extends StatelessWidget {
  const BarrierContainer({super.key});

  static const duration = Duration(milliseconds: 400);

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    duration: duration,
    curve: Curves.easeInOut,
    decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.4)),
  );
}
