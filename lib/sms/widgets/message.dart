import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:router_setting/core/color_generators/color_generator.dart';
import 'package:router_setting/core/color_generators/md5_color_generator.dart';
import 'package:router_setting/sms/models/sms.model.dart';
import 'package:share_plus/share_plus.dart';

class Message extends StatelessWidget {
  final MessageModel message;
  final VoidCallback? onDelete;
  final ColorGenerator colorGenerator;

  const Message({
    required this.message,
    this.onDelete,
    this.colorGenerator = const Md5ColorGenerator(),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var text = message.msg ?? message.phone ?? '';
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: DividerTheme.of(context).color ??
                Theme.of(context).dividerColor,
            width: DividerTheme.of(context).thickness ?? 0.0,
          ),
        ),
      ),
      child: Slidable(
        key: UniqueKey(),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: onShare,
              icon: Icons.share,
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            if (onDelete != null)
              SlidableAction(
                onPressed: (_) => onDelete!(),
                icon: Icons.delete,
                foregroundColor: Colors.red,
              ),
          ],
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message.phone ?? ''),
                if (message.date != null) MessageDate(date: message.date!),
              ],
            ),
            subtitle: Text(message.msg ?? ''),
            leading: CircleAvatar(
              backgroundColor: colorGenerator.generate(
                text,
              ),
              child: Text(text.substring(0, 1)),
            ),
          ),
        ),
      ),
    );
  }

  void onShare(BuildContext context) {
    Share.share('${message.phone}\n${message.msg}');
  }
}

class MessageDate extends StatelessWidget {
  final String date;

  const MessageDate({
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: TextStyle(
        fontSize: 10,
        color: Colors.grey,
      ),
    );
  }
}
