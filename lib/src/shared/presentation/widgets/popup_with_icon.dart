import 'package:app/src/shared/presentation/styles/styles.dart';
import 'package:app/src/shared/presentation/widgets/custom_button.dart';
import 'package:app/src/shared/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

void showCustomBottomDialog({
  required BuildContext context,
  required IconData iconData,
  required String description,
  String? confirmText,
  required VoidCallback onConfirm,
  String? refuseText,
  VoidCallback? onRefuse,
}) {
  showModalBottomSheet(
    context: context,
    isDismissible: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppSizes.borderRadius),
        topRight: Radius.circular(AppSizes.borderRadius),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: WidthSpacing.medium,
          vertical: HeightSpacing.medium,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              iconData,
              size: HeightSpacing.customWithFixed(96),
              color: ThemeProvider.of(context).appColors.primary,
            ),
            SizedBox(height: HeightSpacing.medium),
            Text(
              description,
              style: AppTypography.bodyRegularMedium(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: HeightSpacing.medium),
            CustomButton(text: confirmText ?? 'Confirmar', onPressed: onConfirm, isValid: () => true),
            CustomTextButton(
                color: ThemeProvider.of(context).appColors.primary,
                text: refuseText ?? 'Cancelar',
                onPressed: () {
                  if (onRefuse != null) {
                    onRefuse();
                  } else {
                    Navigator.pop(context);
                  }
                }),
            SizedBox(height: HeightSpacing.medium),
          ],
        ),
      );
    },
  );
}
