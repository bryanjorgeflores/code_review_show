import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double fontSize;
  final Color color;
  final String text;
  final String fontFamily;
  final TextOverflow textOverflow;
  final int? maxLines;
  const TextWidget(this.text,
      {Key? key,
      this.textAlign = TextAlign.start,
      this.fontSize = 14,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.fontFamily = 'Lato',
      this.textOverflow = TextOverflow.clip,
      this.maxLines = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );
  }
}
