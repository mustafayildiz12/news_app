import 'package:flutter/material.dart';

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
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: Column(
                  children: [
                    SizedBox(
                        //  height: MediaQuery.of(context).size.height / 3,
                        child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          stripHtmlIfNeeded(
                            widget.id!,
                          ),
                          style: TextStyle(
                              color: Theme.of(context).primaryColorDark,
                              fontSize: 15)),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
