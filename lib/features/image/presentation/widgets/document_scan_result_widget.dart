import 'package:flutter/material.dart';

// Widget for showing the result of a Document Scan. Unused
class DocumentScanResultWidget extends StatelessWidget {
  const DocumentScanResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 150,
            width: 110,
            decoration: BoxDecoration(
              color: Color.fromRGBO(234, 79, 108, 0.1),
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(
                color: Color.fromRGBO(234, 79, 108, 1),
                width: 3,
              ),
            ),
            child: Center(
              child: Text(
                "PDF",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(234, 79, 108, 1),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Document Title",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
