import 'package:flutter/material.dart';

class MaxHeightSingleChildScrollView extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Widget child;

  const MaxHeightSingleChildScrollView({
    this.padding,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) =>
          SingleChildScrollView(
        padding: padding,
        child: ConstrainedBox(
          constraints: constraints.copyWith(
            minHeight: constraints.maxHeight,
            maxHeight: double.infinity,
          ),
          child: child,
        ),
      ),
    );
  }
}
