import 'package:flutter/material.dart';
import 'package:vietlite/common/extension/build_context.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, required this.size});

  final double size;

  factory Loading.small({Key? key}) => Loading(key: key, size: 24);

  factory Loading.medium({Key? key}) => Loading(key: key, size: 36);

  factory Loading.large({Key? key}) => Loading(key: key, size: 50);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(context.color.primary),
        value: null,
        strokeWidth: 2.0,
      ),
    );
  }
}

class StackLoading extends StatelessWidget {
  const StackLoading({
    super.key,
    required this.loading,
    required this.child,
    required this.processing,
  });

  final Loading loading;
  final Widget child;
  final bool processing;

  factory StackLoading.small({
    required Widget child,
    required bool processing,
  }) => StackLoading(
    loading: Loading.small(),
    processing: processing,
    child: child,
  );

  factory StackLoading.medium({
    required Widget child,
    required bool processing,
    required Loading loading,
  }) => StackLoading(
    loading: Loading.medium(),
    processing: processing,
    child: child,
  );

  factory StackLoading.large({
    required Widget child,
    required bool processing,
  }) => StackLoading(
    loading: Loading.large(),
    processing: processing,
    child: child,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [child, processing ? Center(child: loading) : const SizedBox()],
    );
  }
}
