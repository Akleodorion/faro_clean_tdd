import '../../../../domain/entities/event.dart';
import 'package:flutter/material.dart';

class EventTileImageContainer extends StatelessWidget {
  const EventTileImageContainer({
    super.key,
    required this.event,
    required this.squareSize,
  });

  final Event event;
  final double squareSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 40) * 0.265,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(event.imageUrl),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
