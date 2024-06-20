import 'package:app/src/shared/domain/exceptions/app_exception.dart';
import 'package:app/src/shared/presentation/widgets/alert_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueUI on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      final error = this.error;
      String title = 'Oops, algo deu errado';
      String message = 'Por favor, tente novamente mais tarde.';
      if (error is AppException) {
        title = error.title;
        message = error.message;
      }

      showExceptionAlertDialog(
        context: context,
        title: title,
        exception: message,
      );
    }
  }
}
