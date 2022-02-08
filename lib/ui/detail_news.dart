import 'package:flutter/material.dart';

import '../constants/string_constant.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(
      {Key? key,
      required this.title,
      required this.content,
      required this.url,
      required this.day,
      required this.month,
      required this.source,
      required this.year})
      : super(key: key);

  String? url;
  String? title;
  String? content;
  String? day;
  String? month;
  String? year;
  String? source;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              centerTitle: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.35,
              pinned: false,
              stretch: false,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [StretchMode.fadeTitle],
                background: Image.network(url!, fit: BoxFit.cover),
              ),
            ),
          ];
        },
        body: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: Column(
                  children: [
                    Text(
                      formatHtmlString(title!),
                      style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 21,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.watch_later,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(day! + " " + month! + " " + year!),
                        const Spacer(),
                        Text(
                          source!,
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(formatHtmlString(content!),
                        style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
