import 'package:app/src/shared/presentation/styles/styles.dart';
import 'package:flutter/material.dart';

class GreetingsHomeWidget extends StatelessWidget {
  final String? firstName;

  const GreetingsHomeWidget({super.key, this.firstName});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Olá, ',
              style: AppTypography.loginGreetings(context),
            ),
            if (firstName != null)
              TextSpan(
                text: firstName,
                style: AppTypography.loginName(context),
              ),
          ],
        ),
      ),
    );
  }
}
