import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vietlite/app/res/icons.dart';
import 'package:vietlite/common/extension/build_context.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/common/extension/text_style.dart';
import 'package:vietlite/widget/app_scaffold.dart';

class OnboardingLayout extends StatelessWidget {
  final Widget child;

  const OnboardingLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      extendBodyBehindAppBar: true,
      child:
          context.isTablet
              ? _buildTabletLayout(context)
              : _buildMobileLayout(context),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double screenWidth = constraints.maxWidth;
        double limitWidth = AppDimensions.maxWidth;
        double formWidth =
            (screenWidth >= AppDimensions.tabletWidth &&
                    screenWidth <= limitWidth)
                ? screenWidth * 0.44
                : limitWidth * 0.44;

        return Center(
          child: Container(
            width: limitWidth,
            decoration: _buildGradient(context),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildImageBackground(),
                      Text(
                        'Việt Lite',
                        style: context.primaryStyle.s44.heavy.copyWith(
                          color: context.color.nameColor,
                          fontFamily: 'SF Compact Rounded',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: formWidth,
                  height: constraints.maxHeight,
                  decoration: _containerDecoration(context),
                  child: child,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Container(
      decoration: _buildGradient(context),
      child: Column(
        children: [
          Expanded(child: SafeArea(child: _buildImageBackground())),
          Container(
            height: MediaQuery.of(context).size.height * 0.57,
            decoration: _containerDecoration(context),
            child: SingleChildScrollView(child: child),
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildGradient(BuildContext context) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          context.color.yellow.shade100,
          context.color.foreground,
          context.color.yellow.shade100,
        ],
        stops: const [0.0, 0.4, 1.0],
      ),
    );
  }

  Widget _buildImageBackground() {
    return SvgPicture.asset(AppIcons.onboardBackground, fit: BoxFit.contain);
  }

  BoxDecoration _containerDecoration(BuildContext context) {
    return BoxDecoration(
      color: context.color.foreground,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppDimensions.s24),
        topRight:
            context.isTablet ? Radius.zero : Radius.circular(AppDimensions.s24),
        bottomLeft:
            context.isTablet ? Radius.circular(AppDimensions.s24) : Radius.zero,
      ),
      boxShadow: [
        BoxShadow(
          color: context.color.neutral.withValues(alpha: 0.08),
          blurRadius: 32,
          spreadRadius: 0,
          offset: const Offset(-8, 0),
        ),
      ],
    );
  }
}
