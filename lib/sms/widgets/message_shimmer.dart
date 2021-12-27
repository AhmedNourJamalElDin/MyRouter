import 'package:flutter/material.dart';
import 'package:separated_column/separated_column.dart';
import 'package:shimmer/shimmer.dart';

class MessageShimmer extends StatelessWidget {
  const MessageShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey,
      direction: ShimmerDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: DividerTheme.of(context).color ??
                  Theme.of(context).dividerColor,
              width: DividerTheme.of(context).thickness ?? 0.0,
            ),
          ),
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListTile(
            title: Container(
              width: double.infinity,
              height: 11,
              color: Colors.white,
            ),
            subtitle: SeparatedColumn(
              includeOuterSeparators: true,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              children: List.filled(
                3,
                Container(
                  width: double.infinity,
                  height: 8,
                  color: Colors.white,
                ),
              ),
            ),
            leading: CircleAvatar(
              child: Container(
                width: 8,
                height: 8,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MessagesShimmer extends StatelessWidget {
  final int count;

  const MessagesShimmer({
    this.count = 3,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.filled(
          count,
          const MessageShimmer(),
      ),
    );
  }
}
