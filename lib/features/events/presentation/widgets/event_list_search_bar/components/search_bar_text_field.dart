import 'package:flutter/material.dart';

class SearchBarTextField extends StatelessWidget {
  const SearchBarTextField({
    super.key,
    required this.screenWidth,
    required this.textEditingController,
  });

  final double screenWidth;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.40,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextFormField(
          controller: textEditingController,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
              hintText: "Recherchez un évènement",
              hintStyle: Theme.of(context).textTheme.bodyMedium),
        ),
      ),
    );
  }
}
