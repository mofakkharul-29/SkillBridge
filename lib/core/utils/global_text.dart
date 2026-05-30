import 'package:flutter/material.dart';

class GlobalText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextOverflow? overflow;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final double? height;
  final String fontFamily;

  const GlobalText({
    super.key,
    required this.text,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.textBaseline,
    this.fontFamily = 'Inter',
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      textDirection: textDirection,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        height: height,
        textBaseline: textBaseline,
        fontFamily: fontFamily,
      ),
    );
  }
}
