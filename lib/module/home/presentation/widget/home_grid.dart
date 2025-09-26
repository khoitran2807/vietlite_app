import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/di/locator.shorten.dart';

import 'package:vietlite/module/home/domain/enum/home_grid_item.dart';
import 'package:vietlite/module/root/application/tab_view_bloc.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double maxWidth = constraints.maxWidth;
        double widthImage = (maxWidth - (3 * AppDimensions.s16)) / 2;
        double heightImage = widthImage * 0.74;
        double heightContent = 84;
        return GridView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.s16,
            vertical: AppDimensions.s16,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: AppDimensions.s16, // Space between columns
            mainAxisSpacing: AppDimensions.s16, // Space between rows
            mainAxisExtent: (heightImage + heightContent),
          ),
          itemCount: HomeGridItem.values.length,
          // Number of items (4 cards)
          itemBuilder: (context, index) {
            final item = HomeGridItem.values[index];
            return InkWell(
              borderRadius: BorderRadius.circular(AppDimensions.s8),
              onTap: () async {
                final TabViewBloc tabViewBloc = context.read<TabViewBloc>();
                final bool isTablet = context.isTablet;
                await AppLocator.router.navigate(item.route);
                tabViewBloc.add(
                  TabViewEvent.initialize(
                    isTablet: isTablet,
                    routeName: AppLocator.router.currentPath,
                  ),
                );
              },
              child: Card(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.s8),
                  side: BorderSide(
                    color: context.color.neutral.shade200,
                    width: 1.0,
                  ),
                ),
                color: context.color.foreground,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(AppDimensions.s8),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: heightImage,
                        child: Image.asset(item.image, fit: BoxFit.cover),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: AppDimensions.s4,
                          left: AppDimensions.s12,
                          right: AppDimensions.s12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item.title(context),
                              style: context.defaultStyle.s16.bold,
                            ),
                            Text(
                              item.description(context),
                              style: context.defaultStyle.s12,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
