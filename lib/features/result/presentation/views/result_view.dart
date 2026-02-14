import 'package:flutter/material.dart';
import 'package:imapp/features/result/presentation/widgets/document_scan_result_widget.dart';
import 'package:imapp/features/result/presentation/widgets/face_scan_result_widget.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1a1a24),
        body: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child:  Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
              ),
              FaceScanResultWidget(),
              Expanded(child: Align(
                alignment: Alignment.bottomCenter,
                child:  MaterialButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    color: Color(0xFFed6f72),
                    minWidth: double.infinity,
                    child: Text("Open PDF", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),),
                    onPressed: () => print("pressed")),
              ))
            ],
          )
        ),
      ),
    );
  }
}
