import 'package:flutter/material.dart';
import 'package:news_app/ui/siyer_detail.dart';
import '../models/siyer_dergi_model.dart';
import '../service/api_service.dart';

class SiyerAnaSayfa extends StatefulWidget {
  const SiyerAnaSayfa({Key? key}) : super(key: key);

  @override
  _SiyerAnaSayfaState createState() => _SiyerAnaSayfaState();
}

class _SiyerAnaSayfaState extends State<SiyerAnaSayfa> {
  Service client = Service();

  static String stripHtmlIfNeeded(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: FutureBuilder(
          future: client.getSiyerPosts(),
          builder: (BuildContext context,
              AsyncSnapshot<List<SiyerResponse>> snapshot) {
            List<SiyerResponse>? news = snapshot.data;
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: news!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SiyerDetailsX(
                                      id: news[index]
                                          .excerpt!
                                          .rendered
                                          .toString(),
                                      image: news[index]
                                          .betterFeaturedImage!
                                          .sourceUrl
                                          .toString(),
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 4,
                                offset: const Offset(
                                    0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8)),
                                  child: Image.network(
                                    news[index]
                                        .betterFeaturedImage!
                                        .sourceUrl
                                        .toString(),
                                    fit: BoxFit.cover,
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 8),
                                child: Text(
                                  stripHtmlIfNeeded(
                                      news[index].excerpt!.rendered.toString()),
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
