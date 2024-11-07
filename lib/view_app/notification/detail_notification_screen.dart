import 'package:flutter/material.dart';

class DetailNotificationScreen extends StatelessWidget {
  final String title;
  final String fromDate;
  final String toDate;

  const DetailNotificationScreen({super.key, required this.title, required this.fromDate, required this.toDate});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail notification'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height/2,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border:  Border.all(
              width: 1
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$title", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              Text("Từ ngày $fromDate - $toDate")
            ],
          ),
        ),
      ),
    );
  }
}
