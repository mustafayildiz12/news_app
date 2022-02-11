import 'package:flutter/material.dart';

import '../models/siyer_dergi_model.dart';
import '../models/siyer_details_model.dart';
import '../service/api_service.dart';

class SiyerDetailsX extends StatefulWidget {
  SiyerDetailsX({required this.id, required this.image, Key? key})
      : super(key: key);
  String? id;
  String image;

  @override
  _SiyerDetailsXState createState() => _SiyerDetailsXState();
}

class _SiyerDetailsXState extends State<SiyerDetailsX> {
  Service client = Service();

  static String stripHtmlIfNeeded(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                )),
            Text(stripHtmlIfNeeded(widget.id!))
          ],
        ),
      )),
    );
  }
}
