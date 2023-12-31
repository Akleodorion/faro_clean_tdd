import 'package:flutter/material.dart';

import '../../../../../events/domain/entities/event.dart';

class TicketTileImageContainer extends StatelessWidget {
  const TicketTileImageContainer({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: (MediaQuery.of(context).size.width - 40) * 0.2,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(event.imageUrl),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
