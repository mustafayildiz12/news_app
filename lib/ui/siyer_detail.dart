import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sizer/sizer.dart';
import '../service/api_service.dart';
import 'package:google_fonts/google_fonts.dart';

class SiyerDetailsX extends StatefulWidget {
  SiyerDetailsX({required this.id, required this.image, Key? key})
      : super(key: key);
  String? id;
  String? image;

  @override
  _SiyerDetailsXState createState() => _SiyerDetailsXState();
}

class _SiyerDetailsXState extends State<SiyerDetailsX> {
  Service client = Service();

  static String stripHtmlIfNeeded(String text) {
    return text
        .replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ')
        .replaceAll("(ra)", "")
        .replaceAll("(hz)", "")
        .replaceAll("(sas)", "")
        .replaceAll(RegExp(r"\s+\b|\b\s"), " ")
        .toLowerCase();
  }

  FlutterTts flutterTts = FlutterTts();

  Future _speak() async {
    await flutterTts.setLanguage("tr-TR");

    await flutterTts.setSpeechRate(0.45);

    await flutterTts.setVolume(1.0);

    await flutterTts.setPitch(0.7);
    await flutterTts.speak(stripHtmlIfNeeded(widget.id!));
  }

  Future _stop() async {
    await flutterTts.stop();
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                detailBox(context),
                Positioned(
                    top: 3.h,
                    left: 2.w,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        size: 25.sp,
                      ),
                      color: Colors.white,
                    ))
              ],
            ),
          )),
    );
  }

  Container detailBox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 4,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
              //  height: MediaQuery.of(context).size.height / 3,
              child: Image.network(
            widget.image.toString(),
            fit: BoxFit.cover,
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Text(
                stripHtmlIfNeeded(
                  widget.id!,
                ),
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 15.sp))),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _speak();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).dividerColor),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                      Text(
                        "PLAY",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _stop();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).dividerColor),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      Icon(
                        Icons.stop,
                        color: Colors.white,
                      ),
                      Text(
                        "STOP",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
