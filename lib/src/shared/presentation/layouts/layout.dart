import 'package:app/src/shared/presentation/provider/theme_provider.dart';
import 'package:app/src/shared/presentation/styles/spacings.dart';
import 'package:app/src/shared/presentation/styles/system_ui_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final Widget? appBar;
  final double? horizontalPadding;
  final bool showFooter;
  final bool isLoading;
  final bool isLoadingPage;
  final String? loadingText;
  final bool bottomSafeArea;
  final bool? topSafeArea;

  const DefaultLayout({
    super.key,
    required this.child,
    this.horizontalPadding,
    this.appBar,
    this.showFooter = true,
    this.isLoading = false,
    this.isLoadingPage = false,
    this.loadingText,
    this.bottomSafeArea = true,
    this.topSafeArea,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: buildSystemUiOverlayStyle(context),
      child: PopScope(
        canPop: !isLoadingPage,
        child: Scaffold(
          backgroundColor: ThemeProvider.of(context).themeColors.background,
          resizeToAvoidBottomInset: true,
          body: isLoadingPage
              ? Center(
                  child: CircularProgressIndicator(
                    color: ThemeProvider.of(context).appColors.primary,
                  ),
                )
              : SafeArea(
                  top: topSafeArea ?? appBar == null,
                  bottom: bottomSafeArea,
                  child: Column(
                    children: [
                      if (appBar != null) appBar!,
                      Expanded(
                        child: CustomScrollView(
                          physics: const ClampingScrollPhysics(),
                          slivers: <Widget>[
                            SliverFillRemaining(
                                hasScrollBody: false,
                                child: Container(
                                    color: ThemeProvider.of(context).themeColors.background,
                                    padding: EdgeInsets.only(
                                      left: horizontalPadding ?? WidthSpacing.medium,
                                      right: horizontalPadding ?? WidthSpacing.medium,
                                      bottom: HeightSpacing.medium,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: isLoading
                                              ? Center(
                                                  child: CircularProgressIndicator(
                                                    color: ThemeProvider.of(context).appColors.primary,
                                                  ),
                                                )
                                              : child,
                                        ),
                                      ],
                                    ))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
