import 'package:dished_assessment/src/content/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SnackBarService {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbar(
    String text,
  ) {
    final context = scaffoldMessengerKey.currentContext!;
    final textTheme = Theme.of(context).textTheme;

    return scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(
          text,
          style: textTheme.bodyText1?.copyWith(
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.lightOrange,
      ),
    );
  }
}

final snackbarService = Provider<SnackBarService>(
  (ref) => SnackBarService(),
);
