import 'package:flutter/material.dart';

// Widget for showing the result of a Face Scan. Unused
class FaceScanResultWidget extends StatelessWidget {
  const FaceScanResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            height: 200,
            width: 140,
            decoration: BoxDecoration(
              color: Color.fromRGBO(72, 76, 109, 0.2),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              children: [
                Text(
                  "Before",
                  style: TextStyle(fontSize: 16, color: Color(0xFF6b6b75)),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            height: 200,
            width: 140,
            decoration: BoxDecoration(
              color: Color.fromRGBO(72, 76, 109, 0.2),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              children: [
                Text(
                  "After",
                  style: TextStyle(fontSize: 16, color: Color(0xFF6b6b75)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
