import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

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
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 350, left: 20),
                        child: const Text(
                            '우리는 모두 세포들의 주인공이다\n김고은x안보현의 세포자극 로맨스 💖',
                            style: TextStyle(color: Color(0xFFECECEC))),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 13, left: 20),
                        child: DotsIndicator(
                          dotsCount: 4,
                          position: 1,
                          decorator: DotsDecorator(
                            spacing: const EdgeInsets.all(3.0),
                            color: const Color(0xFF6E6E6E),
                            size: const Size.square(5.0),
                            activeSize: const Size.square(5.0),
                            activeColor: const Color(0xFFEFEFEF),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 25, left: 20),
                    child: const Text('티빙에서 꼭 봐야하는 콘텐츠',
                        style: TextStyle(
                            color: Color(0xFFECECEC),
                            fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 25, right: 3),
                        child: const Text('전체보기',
                            style: TextStyle(color: Color(0xFF6D6D6D))),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 25, right: 20),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.arrow_forward_ios),
                          color: const Color(0xFF6D6D6D),
                          iconSize: 15.0,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
