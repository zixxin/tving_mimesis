import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'image/tving_logo.png',
                fit: BoxFit.contain,
                height: 27,
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.cast),
              onPressed: () => {},
            ),
            Container(
              margin: const EdgeInsets.only(right: 7),
              child: IconButton(
                icon: const Icon(Icons.person),
                onPressed: () => {},
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          bottom: const TabBar(
            indicatorWeight: 2.0,
            indicatorColor: Color(0xFFFFFFFF),
            labelStyle: TextStyle(fontSize: 13),
            tabs: <Widget>[
              Tab(
                text: '홈',
              ),
              Tab(
                text: '실시간',
              ),
              Tab(
                text: 'TV프로그램',
              ),
              Tab(
                text: '영화',
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF000000),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: _selectedIndex, //현재 선택된 Index
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: '홈',
              icon: Icon(Icons.home_filled),
            ),
            BottomNavigationBarItem(
              label: '공개예정',
              icon: Icon(Icons.music_note),
            ),
            BottomNavigationBarItem(
              label: '검색',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: '기록',
              icon: Icon(Icons.schedule),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF141414),
        body: TabBarView(
          children: <Widget>[
            ListView(
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
                              padding:
                                  const EdgeInsets.only(top: 395, left: 15),
                              child: const Text(
                                  '우리는 모두 세포들의 주인공이다\n김고은x안보현의 세포자극 로맨스 💖',
                                  style: TextStyle(color: Color(0xFFECECEC))),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 15, left: 15),
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
                          padding: const EdgeInsets.only(top: 25, left: 15),
                          child: const Text('티빙에서 꼭 봐야하는 콘텐츠',
                              style: TextStyle(
                                  color: Color(0xFFECECEC),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 25, right: 3),
                              child: const Text('전체보기',
                                  style: TextStyle(
                                    color: Color(0xFF6D6D6D),
                                    fontSize: 13,
                                  )),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 23, right: 15),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                icon: const Icon(Icons.arrow_forward_ios),
                                color: const Color(0xFF6D6D6D),
                                iconSize: 13.0,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView(
                        padding: const EdgeInsets.all(0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 15),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        'image/program1.png',
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 15),
                                    child: const Text('환승연애2',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF6D6D6D))),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 15),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        'image/program2.png',
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 15),
                                    child: const Text('놀라운 토요일',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF6D6D6D))),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        'image/program3.png',
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 10),
                                    child: const Text('아는 형님',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF6D6D6D))),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 10, right: 15),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        'image/program4.png',
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 10),
                                    child: const Text('유 퀴즈 온 더 블럭',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF6D6D6D))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 25, left: 15),
                          child: const Text('실시간 인기 프로그램',
                              style: TextStyle(
                                  color: Color(0xFFECECEC),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 25, right: 3),
                              child: const Text('전체보기',
                                  style: TextStyle(
                                    color: Color(0xFF6D6D6D),
                                    fontSize: 13,
                                  )),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 23, right: 15),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                icon: const Icon(Icons.arrow_forward_ios),
                                color: const Color(0xFF6D6D6D),
                                iconSize: 13.0,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView(
                        padding: const EdgeInsets.all(0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 15),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        'image/program1.png',
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 15),
                                    child: const Text('환승연애2',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF6D6D6D))),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 15),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        'image/program2.png',
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 15),
                                    child: const Text('놀라운 토요일',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF6D6D6D))),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        'image/program3.png',
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 10),
                                    child: const Text('아는 형님',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF6D6D6D))),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 10, right: 15),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset(
                                        'image/program4.png',
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 10),
                                    child: const Text('유 퀴즈 온 더 블럭',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF6D6D6D))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Center(
              child: Text(
                "실시간",
                style: TextStyle(color: Color(0xFFECECEC)),
              ),
            ),
            const Center(
              child: Text("TV프로그램", style: TextStyle(color: Color(0xFFECECEC))),
            ),
            const Center(
              child: Text("영화", style: TextStyle(color: Color(0xFFECECEC))),
            ),
          ],
        ),
      ),
    );
  }
}
