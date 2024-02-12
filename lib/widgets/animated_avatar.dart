import 'package:flutter/material.dart';

class AnimatedGrowShrinkWidget extends StatefulWidget {
  final Widget child;

  const AnimatedGrowShrinkWidget({Key? key, required this.child})
      : super(key: key);

  @override
  State<AnimatedGrowShrinkWidget> createState() =>
      _AnimatedGrowShrinkWidgetState();
}

class _AnimatedGrowShrinkWidgetState extends State<AnimatedGrowShrinkWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animation = Tween<double>(
      begin: 0.98,
      end: 1.02,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: widget.child,
        );
      },
    );
  }
}
