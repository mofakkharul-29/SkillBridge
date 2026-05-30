import 'package:flutter/material.dart';

class GlobalCard extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;

  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;

  final Color? color;
  final DecorationImage? image;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;

  final BoxShape shape;
  final Clip clipBehavior;

  const GlobalCard({
    super.key,
    this.height,
    this.width,
    this.alignment,
    this.padding,
    this.constraints,
    this.margin,
    this.color,
    this.image,
    this.border,
    this.borderRadius,
    this.gradient,
    this.boxShadow,
    this.shape = BoxShape.rectangle,
    this.clipBehavior = Clip.none,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isCircle = shape == BoxShape.circle;

    return Container(
      height: height,
      width: width,
      alignment: alignment,
      padding: padding,
      margin: margin,
      constraints: constraints,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        color: color,
        border: border,
        borderRadius: isCircle ? null : borderRadius,
        gradient: gradient,
        boxShadow: boxShadow,
        shape: shape,
        image: image,
      ),
      child: child,
    );
  }
}
