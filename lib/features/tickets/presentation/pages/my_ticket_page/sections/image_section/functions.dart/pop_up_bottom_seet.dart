// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:faro_faro/features/contacts/presentation/providers/contact_provider.dart';
import 'package:faro_faro/features/events/presentation/pages/event_show_page/pop_page/event_management_page/sections/members_section/widgets/add_member/components/modal_bottom_sheet_layout.dart';
import 'package:faro_faro/features/tickets/domain/entities/ticket.dart';

Future<dynamic> popUpBottomSheet({
  required BuildContext context,
  required double mediaHeight,
  required WidgetRef ref,
  required Ticket ticket,
}) async {
  return showModalBottomSheet(
    backgroundColor: Theme.of(context).colorScheme.tertiary,
    context: context,
    builder: (BuildContext context) {
      return ModalBottomSheetLayout(
        mediaHeight: mediaHeight,
        contactList: ref.read(contactsListProvider),
        ticket: ticket,
      );
    },
  );
}
