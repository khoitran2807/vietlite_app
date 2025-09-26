import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/common/extension/build_context.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:vietlite/module/progress/presentation/progress_component.dart';
import 'package:vietlite/module/root/application/tab_view_bloc.dart';
import 'package:vietlite/module/root/presentation/widget/mobile_bottom_bar.dart';
import 'package:vietlite/module/root/presentation/widget/tablet_sidebar.dart';

@RoutePage()
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<TabViewBloc>().add(
      TabViewEvent.initialize(
        isTablet: context.isTablet,
        routeName: AppLocator.router.currentPath,
      ),
    );
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double limitWidth = AppDimensions.maxWidth;
        return Center(
          child: SizedBox(
            width: limitWidth,
            child: Scaffold(
              backgroundColor: context.color.foreground,
              body: Row(
                children: [
                  if (context.isTablet) const TabletSidebar(),
                  const Expanded(flex: 3, child: AutoRouter()),
                  if (context.isWebsite)
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.color.foreground,
                          border: Border(
                            left: BorderSide(
                              color: context.color.neutral.shade200,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppDimensions.s16,
                              ),
                              child: const ProgressComponent(),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              bottomNavigationBar:
                  !context.isTablet ? const MobileBottomBar() : null,
            ),
          ),
        );
      },
    );
  }
}
