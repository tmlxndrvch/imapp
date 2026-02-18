import 'package:flutter/material.dart';

// Widget to display when the history is empty. Unused
class EmptyHistoryWidget extends StatelessWidget {
  const EmptyHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "It's empty here... \n Lets tart by adding new Photos or Documents",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}
