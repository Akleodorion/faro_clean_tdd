import 'components/event_tile_general_info_container.dart';
import 'components/event_tile_image_container.dart';
import 'components/event_tile_more_info_container.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/event.dart';

class EventTile extends StatelessWidget {
  const EventTile({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5),
          boxShadow: kElevationToShadow[3],
        ),
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              EventTileImageContainer(event: event),
              EventTileGeneralInfoContainer(event: event),
              EventTileMoreInfoContainer(event: event),
            ],
          ),
        ),
      ),
    );
  }
}
