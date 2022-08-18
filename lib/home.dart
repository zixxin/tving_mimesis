import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'image/tving_logo.png',
              fit: BoxFit.contain,
              height: 30,
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: [
                  Image.asset(
                    'image/main_poster.png',
                    fit: BoxFit.fitWidth,
                    width: width,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 345, left: 25),
                    child: const Text('우리는 모두 세포들의 주인공이다\n김고은x안보현의 세포자극 로맨스💖',
                        style: TextStyle(color: Color(0xFFECECEC))),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: const Text('티빙에서 꼭 봐야하는 콘텐츠',
                    style: TextStyle(
                        color: Color(0xFFECECEC), fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
