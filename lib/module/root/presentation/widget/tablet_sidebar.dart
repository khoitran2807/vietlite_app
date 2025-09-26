import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:vietlite/module/root/application/tab_view_bloc.dart';
import 'package:vietlite/module/root/domain/enum/nav_item.dart';
import 'package:vietlite/module/root/presentation/widget/header_info.dart';

class TabletSidebar extends StatelessWidget {
  const TabletSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.sidebarWidth,
      decoration: BoxDecoration(
        color: context.color.foreground,
        border: Border(
          right: BorderSide(color: context.color.neutral.shade200),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.s16),
      child: BlocBuilder<TabViewBloc, TabViewState>(
        buildWhen:
            (previous, current) =>
                previous.selectedTab != current.selectedTab ||
                previous.selectedChildTab != current.selectedChildTab ||
                previous.tabs != current.tabs,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: AppDimensions.s16),
                child: const HeaderInfo(),
              ),
              const SizedBox(height: 10),
              Container(height: 1, color: context.color.neutral.shade200),
              SizedBox(height: AppDimensions.s8),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...state.tabs.map(
                        (item) => SidebarItem(
                          navItem: item,
                          isSelected: state.selectedTab == item,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SidebarItem extends StatefulWidget {
  final NavItem navItem;
  final bool isSelected;

  const SidebarItem({
    super.key,
    required this.navItem,
    required this.isSelected,
  });

  @override
  State<SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<SidebarItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppLocator.router.navigate(widget.navItem.route);
        context.read<TabViewBloc>().add(
          TabViewEvent.changeTab(item: widget.navItem),
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color:
                  (widget.isSelected)
                      ? context.color.primary.shade100
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(AppDimensions.s16),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.s16,
              vertical: AppDimensions.s8,
            ),
            margin: EdgeInsets.only(bottom: AppDimensions.s8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  (widget.isSelected)
                      ? widget.navItem.activeIcon
                      : widget.navItem.icon,
                  height: AppDimensions.s44,
                  width: AppDimensions.s44,
                ),
                SizedBox(width: AppDimensions.s24),
                Expanded(
                  child: Text(
                    widget.navItem.label(context),
                    style:
                        (widget.isSelected)
                            ? context.primaryStyle.semiBold
                            : context.neutralStyle.semiBold,
                  ),
                ),
              ],
            ),
          ),
          ...widget.navItem.children.map((childItem) {
            return (widget.isSelected)
                ? SidebarChildItem(
                  item: childItem,
                  isSelected:
                      context.read<TabViewBloc>().state.selectedChildTab ==
                      childItem,
                )
                : const SizedBox();
          }),
        ],
      ),
    );
  }
}

class SidebarChildItem extends StatefulWidget {
  final NavChildItem item;
  final bool isSelected;

  const SidebarChildItem({
    super.key,
    required this.item,
    required this.isSelected,
  });

  @override
  State<SidebarChildItem> createState() => _SidebarChildItemState();
}

class _SidebarChildItemState extends State<SidebarChildItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppLocator.router.navigate(widget.item.route);
        context.read<TabViewBloc>().add(
          TabViewEvent.changeChildTab(childItem: widget.item),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color:
              (widget.isSelected)
                  ? context.color.secondary.shade100
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(AppDimensions.s16),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.s16,
          vertical: AppDimensions.s12,
        ),
        margin: EdgeInsets.only(bottom: AppDimensions.s8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: AppDimensions.s44),
            SizedBox(width: AppDimensions.s24),
            Expanded(
              child: Text(
                widget.item.label(context),
                style:
                    (widget.isSelected)
                        ? context.secondaryStyle.semiBold
                        : context.neutralStyle.semiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
