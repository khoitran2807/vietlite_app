import 'package:flutter/material.dart';
import 'package:vietlite/common/extension/extension.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final List<Widget>? actions;
  final bool autoImplyLeading;
  final bool extendBodyBehindAppBar;

  const AppScaffold({
    super.key,
    required this.child,
    this.title = '',
    this.actions,
    this.autoImplyLeading = true,
    this.extendBodyBehindAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      backgroundColor: context.color.foreground,
      appBar:
          title.isNotEmpty
              ? AppBar(
                scrolledUnderElevation: 0,
                title: Text(title, style: context.defaultStyle.s24.bold),
                actions: actions,
                automaticallyImplyLeading: autoImplyLeading,
                centerTitle: false,
                backgroundColor: Colors.transparent,
                bottom:
                    title.isNotEmpty
                        ? PreferredSize(
                          preferredSize: const Size.fromHeight(
                            1.0,
                          ), // Height of the border
                          child: Container(
                            color:
                                context.color.neutral.shade200, // Border color
                            height: 1.0, // Border thickness
                          ),
                        )
                        : null,
              )
              : null,
      body: child,
    );
  }
}
