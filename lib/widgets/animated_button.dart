import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Color color1;
  final Color color2;
  final String buttonText;
  final Color textColor;
  final Color borderColor;

  const GradientButton({
    super.key,
    required this.onPressed,
    required this.color1,
    required this.color2,
    required this.buttonText,
    required this.textColor,
    required this.borderColor,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 1.05).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: InkWell(
            borderRadius: BorderRadius.circular(32),
            onTap: widget.onPressed,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [widget.color1, widget.color2],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: widget.borderColor, width: 2)),
              child: Text(
                widget.buttonText,
                style: TextStyle(
                  color: widget.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
