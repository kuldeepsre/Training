// custom_auto_size_text.dart

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomAutoSizeText extends StatefulWidget {
  final String text;
  final double containerWidth;
  final double containerHeight;
  final TextStyle textStyle;
  final int maxLines;

  CustomAutoSizeText({
    required this.text,
    required this.containerWidth,
    required this.containerHeight,
    required this.textStyle,
    this.maxLines = 1,
  });

  @override
  _CustomAutoSizeTextState createState() => _CustomAutoSizeTextState();
}

class _CustomAutoSizeTextState extends State<CustomAutoSizeText> {
  double _fontSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.containerWidth,
      height: widget.containerHeight,
      color: Colors.grey,
      child: AutoSizeText(
        widget.text,
        maxLines: widget.maxLines,
        style: widget.textStyle.copyWith(fontSize: _fontSize),
        overflow: TextOverflow.ellipsis,
        textScaleFactor: 1.0,
        maxFontSize: _fontSize,
        minFontSize: 8.0,
        textAlign: TextAlign.center,

      ),
    );
  }
}