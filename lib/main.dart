import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/prefs/theme_provider.dart';
import 'package:news_app/ui/deco_news.dart';
import 'package:news_app/ui/siyer_ana.dart';
import 'package:news_app/ui/siyer_news.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/on_boarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: const SiyerAnaSayfa(),
          );
        });
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DecoNewsScreen(),
        ), //MaterialPageRoute
      );
    } else {
      await prefs.setBool('seen', true);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingPage(),
        ), //MaterialPageRoute
      );
    }
  }

  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  void initState() {
    checkFirstSeen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.black,
          size: 80.0,
        ),
      ),
    );
  }
}
