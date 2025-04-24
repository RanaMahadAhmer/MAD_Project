import 'package:flutter/material.dart';

class ShimmerText extends StatefulWidget {
  final String text;

  const ShimmerText(this.text, {super.key});

  @override
  State<ShimmerText> createState() => _ShimmerTextState();
}

class _ShimmerTextState extends State<ShimmerText>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [Colors.blue, Colors.purple, Colors.blue],
          stops: [0.0, 0.5, 1.0],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: Text(
        widget.text,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }
}
