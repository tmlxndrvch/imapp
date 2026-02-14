import 'package:flutter/material.dart';

class ProcessedImageInfoWidget extends StatelessWidget {
  const ProcessedImageInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromARGB(100, 72, 76, 109),
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
                color: Color.fromRGBO(234, 79, 108, 1),
                borderRadius: BorderRadius.all(Radius.circular(4))
            ),
          ),
          SizedBox(width: 12,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Unprocessed", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),),
              SizedBox(height: 4,),
              Text("Feb 14, 2026", style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.blueGrey,
              ),)
            ],
          ),
          Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever, color: Colors.red,size: 32,))
        ],
      ),
    );
  }
}
