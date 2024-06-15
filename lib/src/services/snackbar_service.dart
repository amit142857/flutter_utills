import 'package:flutter/material.dart';

/// Add [SnackBarService.messengerKey] to [MaterialApp]
/// ```
/// MaterialApp(
///   scaffoldMessengerKey: SnackBarService.messengerKey,
/// )
/// ```
class SnackBarService {
  SnackBarService._();

  /// global scaffoldMessengerKey
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  /// hides current [SnackBar]
  static void hide() {
    messengerKey.currentState!.hideCurrentSnackBar();
  }

  /// Shows [SnackBar] with default Red Background
  static void showError(String message) {
    show(
      message,
      bgColor: Colors.red[400],
      duration: const Duration(seconds: 5),
    );
  }

  /// Shows [SnackBar]
  static void show(
    String message, {
    Color? bgColor,
    Color? textColor,
    bool action = true,
    Duration duration = const Duration(seconds: 3),
    BuildContext? context,
  }) {
    hide();
    final snackBar = SnackBar(
      content: Text(
        message,
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: textColor ?? Colors.white,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      behavior: SnackBarBehavior.floating,
      backgroundColor: bgColor ?? Colors.green[400],
      duration: duration,
      action: action
          ? SnackBarAction(
              label: 'Clear',
              textColor: textColor ?? Colors.white,
              onPressed: hide,
            )
          : null,
    );

    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      messengerKey.currentState?.showSnackBar(snackBar);
    }
  }
}
