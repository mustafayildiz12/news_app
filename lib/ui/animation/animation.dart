import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:transformer_page_view_tv/transformer_page_view.dart';

import '../../models/siyer_dergi_model.dart';
import '../../service/api_service.dart';
import '../siyer_detail.dart';
import 'transformers/transformers.dart';

class AnimationsApi extends StatefulWidget {
  const AnimationsApi({Key? key}) : super(key: key);

  @override
  _AnimationsApiState createState() => _AnimationsApiState();
}

class _AnimationsApiState extends State<AnimationsApi> {
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
              return transform(news!);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  TransformerPageView transform(List<SiyerResponse> news) {
    return TransformerPageView(
      scrollDirection: Axis.vertical,
      curve: Curves.easeInBack,
      transformer: transformers[1],
      itemCount: news.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SiyerDetailsX(
                          id: news[index].content!.rendered.toString(),
                          image: news[index]
                              .betterFeaturedImage!
                              .sourceUrl
                              .toString(),
                        )));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
              image: DecorationImage(
                  image: NetworkImage(
                      news[index].betterFeaturedImage!.sourceUrl.toString()),
                  fit: BoxFit.cover,
                  colorFilter:
                      const ColorFilter.mode(Colors.black38, BlendMode.darken)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                      stripHtmlIfNeeded(
                        news[index].title!.rendered.toString(),
                      ),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 28.sp),
                      )),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
