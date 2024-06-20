import 'package:auto_route/auto_route.dart';
import 'package:app/src/routing/app_router.dart';
import 'package:app/src/shared/presentation/styles/styles.dart';
import 'package:app/src/shared/presentation/widgets/icon_button.dart';
import 'package:flutter/material.dart';

class AppBarDefault extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final bool? closeButton;
  final bool? backButton;
  final bool? pageReturn;
  final double? topPadding;
  final VoidCallback? backCallback;

  const AppBarDefault({
    super.key,
    this.title,
    this.pageReturn = false,
    this.topPadding = 0,
    this.closeButton = false,
    this.backButton = true,
    this.subtitle,
    this.backCallback,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: ThemeProvider.of(context).themeColors.background,
        padding: EdgeInsets.only(top: HeightSpacing.small, bottom: HeightSpacing.medium),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: WidthSpacing.large, right: WidthSpacing.large),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? '',
                      style: AppTypography.appBarTitle(context),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: AppTypography.appBarSubtitle(context),
                      ),
                  ],
                )),
            if (backButton == true)
              Positioned(
                left: 0,
                child: CustomIconButton(
                  color: ThemeProvider.of(context).themeColors.onBackground,
                  icon: Icons.arrow_back_ios_rounded,
                  size: 24,
                  onPressed: () {
                    if (backCallback != null) {
                      backCallback!.call();
                    } else {
                      context.router.maybePop();
                    }
                  },
                ),
              ),
            if (closeButton == true)
              Positioned(
                right: 0,
                child: CustomIconButton(
                  color: ThemeProvider.of(context).themeColors.onBackground,
                  icon: Icons.close_rounded,
                  size: 24,
                  onPressed: () {
                    if (pageReturn == true) {
                      context.router.maybePop();
                    } else {
                      appRouter.popUntilRoot();
                    }
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
