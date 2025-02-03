import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String details;

  const DetailPage({super.key, required this.name, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.pop(
              context,
            ),
          ),
          title: Text(name),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Text(details),
        ));
  }
}
