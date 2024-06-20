import 'package:app/src/shared/presentation/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Color color;
  final VoidCallback? onPressed;
  final String text;

  const CustomTextButton({
    super.key,
    required this.color,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: HeightSpacing.extraSmall),
        child: SizedBox(
          height: HeightSpacing.heightBtn,
          width: MediaQuery.of(context).size.width,
          child: InkWell(
            focusColor: color,
            onTap: onPressed,
            child: Center(
              child: Text(
                text,
                style: AppTypography.bodyBoldMedium(context).copyWith(color: color),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
}
