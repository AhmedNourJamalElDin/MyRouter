import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:retrofit/retrofit.dart';
import 'package:router_setting/auth/services/auth.service.dart';
import 'package:router_setting/core/dio_clients.dart';
import 'package:router_setting/core/misc.dart';
import 'package:router_setting/core/services/dialog.service.dart';
import 'package:router_setting/sms/clients/sms.client.dart';
import 'package:router_setting/sms/models/sms.model.dart';
import 'package:router_setting/sms/widgets/message.dart';
import 'package:router_setting/sms/widgets/message_shimmer.dart';
import 'package:separated_column/separated_column.dart';
import 'package:separated_row/separated_row.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  final pagingController = PagingController<int, MessageModel>(firstPageKey: 0);
  final int pageSize = 10;

  get hasMessages => (pagingController.itemList ?? []).isNotEmpty;

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
    return SeparatedColumn(
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SeparatedRow(
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: onRefresh,
                  child: const Text("Refresh"),
                ),
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: hasMessages ? onDeleteAllMessages : null,
                  child: const Text("Delete All Messages"),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: PagedListView<int, MessageModel>(
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<MessageModel>(
              newPageProgressIndicatorBuilder: (_) => const MessagesShimmer(),
              firstPageProgressIndicatorBuilder: (_) => const MessagesShimmer(),
              itemBuilder: (context, item, index) => Message(
                message: item,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void onRefresh() {
    pagingController.refresh();
  }

  Future<void> onDeleteAllMessages() async {
    showLoader();

    final client = SmsClient(authenticatedDioClient);
    var authId = AuthService.instance.authId;

    if (authId == null) {
      await AuthService.instance.fetchAuthId();
      authId = AuthService.instance.authId;
    }

    final messages = pagingController.itemList ?? <MessageModel>[];

    try {
      var deleteMessagesFuture = messages.map((message) => client.deleteMessage("$authId", message.tag!));
      await Future.wait<HttpResponse>(deleteMessagesFuture);

      DialogService().success("Messages are deleted successfully");
    } catch (e) {
      DialogService().error(
        "Something went wrong",
        subtitle: e.toString(),
      );
    } finally {
      hideLoader();
      pagingController.refresh();
    }
  }
}
