import 'package:flutter/material.dart';
import 'package:presentation/styles/theme.dart';
import 'package:presentation/widgets/text.dart';

void showToast(BuildContext context, String message,
    {Color color = grey, Color textColor = white, SnackBarAction? action}) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      backgroundColor: color.withOpacity(0.5),
      content: TextWidget(
        message,
        color: textColor,
      ),
      action: action,
      showCloseIcon: true,
      closeIconColor: textColor,
      behavior: SnackBarBehavior.floating,
    ),
  );
}
