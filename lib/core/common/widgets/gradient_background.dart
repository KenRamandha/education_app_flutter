import 'package:flutter/material.dart';

class GradientBackgound extends StatelessWidget {
  const GradientBackgound({
    required this.child,
    required this.image,
    super.key,
  });

  final Widget child;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}
