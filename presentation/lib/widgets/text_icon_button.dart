import 'package:flutter/material.dart';
import 'package:presentation/styles/theme.dart';
import 'package:presentation/widgets/text.dart';

class CustomTextIconButton extends StatelessWidget {
  final String text;
  final bool hasBorder;
  final Function()? onPressed;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;
  final double height;
  final double fontSize;
  final double borderRadius;
  final FontWeight fontWeight;
  final IconData icon;
  const CustomTextIconButton({
    Key? key,
    required this.text,
    required this.icon,
    this.onPressed,
    this.buttonColor = primary,
    this.textColor = white,
    this.height = 50,
    this.fontSize = 14,
    this.hasBorder = false,
    this.fontWeight = FontWeight.normal,
    this.borderColor = white,
    this.borderRadius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextButton.icon(
        icon: Icon(icon, color: textColor),
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: onPressed != null
              ? MaterialStateProperty.all<Color>(buttonColor)
              : MaterialStateProperty.all<Color>(grey),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: hasBorder
                  ? BorderSide(
                      color: borderColor,
                    )
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        label: TextWidget(
          text,
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
