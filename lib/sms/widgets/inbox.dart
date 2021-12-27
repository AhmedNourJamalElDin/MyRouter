import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:router_setting/core/dio_clients.dart';
import 'package:router_setting/sms/clients/sms.client.dart';
import 'package:router_setting/sms/models/sms.model.dart';
import 'package:router_setting/sms/widgets/message.dart';
import 'package:router_setting/sms/widgets/message_shimmer.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  final pagingController = PagingController<int, MessageModel>(firstPageKey: 0);
  final int pageSize = 10;

  @override
  void initState() {
    super.initState();

    pagingController.addPageRequestListener((pageKey) async {
      try {
        final response = await SmsClient(authenticatedDioClient)
            .getInbox(pagingController.itemList?.length ?? 0);
        final newItems =
            (response.messages?.values ?? <MessageModel>[]).toList();

        final isLastPage = newItems.length < pageSize;

        if (isLastPage) {
          pagingController.appendLastPage(newItems);
        } else {
          pagingController.appendPage(newItems, pageKey + 1);
        }
      } catch (e) {
        pagingController.error = e;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, MessageModel>(
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate<MessageModel>(
        newPageProgressIndicatorBuilder: (_) => const MessagesShimmer(),
        firstPageProgressIndicatorBuilder: (_) => const MessagesShimmer(),
        itemBuilder: (context, item, index) => Message(
          message: item,
        ),
      ),
    );
  }
}
