import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();
  bool changeColor = false;

  scrollListener() async {
    if (_scrollController.offset ==
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        changeColor = false;
      });
    } else {
      setState(() {
        changeColor = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        changeColor = true;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  SliverAppBar showSliverAppBar() {
    return SliverAppBar(
      elevation: 0.0,
      floating: true,
      pinned: true,
      snap: true,
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
          margin: const EdgeInsets.only(right: 15),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Image.asset(
              width: 30,
              'image/profile.png',
            ),
            iconSize: 30,
            onPressed: () {},
          ),
        ),
      ],
      backgroundColor:
          changeColor ? const Color(0xFF141414) : const Color(0xFF24B2BF),
      bottom: const TabBar(
        indicatorWeight: 2.0,
        indicatorColor: Color(0xFFFFFFFF),
        labelStyle: TextStyle(fontSize: 13),
        tabs: <Widget>[
          Tab(
            text: '???',
          ),
          Tab(
            text: '?????????',
          ),
          Tab(
            text: 'TV????????????',
          ),
          Tab(
            text: '??????',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xFF141414),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF000000),
          selectedItemColor: const Color(0xFFFFFFFF),
          unselectedItemColor: const Color(0xFF666666),
          selectedFontSize: 10,
          unselectedFontSize: 10,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            const BottomNavigationBarItem(
              label: '???',
              icon: Icon(Icons.home_filled),
            ),
            BottomNavigationBarItem(
              label: '????????????',
              icon: Stack(
                children: <Widget>[
                  const Icon(Icons.smart_display_rounded),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFE0302),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: const Text(
                        '6',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const BottomNavigationBarItem(
              label: '??????',
              icon: Icon(Icons.search),
            ),
            const BottomNavigationBarItem(
              label: '??????',
              icon: Icon(Icons.schedule),
            ),
          ],
        ),
        body: DefaultTabController(
          length: 4,
          child: TabBarView(
            children: <Widget>[
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  showSliverAppBar(),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      mainScreen(context),
                    ]),
                  ),
                ],
              ),
              CustomScrollView(
                slivers: [
                  showSliverAppBar(),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      const Center(
                        child: Text(
                          "?????????",
                          style: TextStyle(color: Color(0xFFECECEC)),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
              CustomScrollView(
                slivers: [
                  showSliverAppBar(),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      const Center(
                        child: Text("TV????????????",
                            style: TextStyle(color: Color(0xFFECECEC))),
                      ),
                    ]),
                  ),
                ],
              ),
              CustomScrollView(
                slivers: [
                  showSliverAppBar(),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      const Center(
                        child: Text("??????",
                            style: TextStyle(color: Color(0xFFECECEC))),
                      ),
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

Widget mainScreen(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  return Column(
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
                padding: const EdgeInsets.only(top: 260, left: 15),
                child: const Text('????????? ?????? ???????????? ???????????????\n?????????x???????????? ???????????? ????????? ????',
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
            child: const Text('???????????? ??? ???????????? ?????????',
                style: TextStyle(
                    color: Color(0xFFECECEC),
                    fontSize: 13,
                    fontWeight: FontWeight.bold)),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 25, right: 3),
                child: const Text('????????????',
                    style: TextStyle(
                      color: Color(0xFF6D6D6D),
                      fontSize: 13,
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(top: 23, right: 15),
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
                      margin: const EdgeInsets.only(top: 10, left: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset(
                          'image/program1.png',
                          width: 100,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5, left: 15),
                      child: const Text('????????????2',
                          style: TextStyle(
                              fontSize: 11, color: Color(0xFF6D6D6D))),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, left: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset(
                          'image/program2.png',
                          width: 100,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5, left: 15),
                      child: const Text('????????? ?????????',
                          style: TextStyle(
                              fontSize: 11, color: Color(0xFF6D6D6D))),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, left: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset(
                          'image/program3.png',
                          width: 100,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: const Text('?????? ??????',
                          style: TextStyle(
                              fontSize: 11, color: Color(0xFF6D6D6D))),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 10, right: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset(
                          'image/program4.png',
                          width: 100,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: const Text('??? ?????? ??? ??? ??????',
                          style: TextStyle(
                              fontSize: 11, color: Color(0xFF6D6D6D))),
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
            child: const Text('????????? ?????? ????????????',
                style: TextStyle(
                    color: Color(0xFFECECEC),
                    fontSize: 13,
                    fontWeight: FontWeight.bold)),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 25, right: 3),
                child: const Text('????????????',
                    style: TextStyle(
                      color: Color(0xFF6D6D6D),
                      fontSize: 13,
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(top: 23, right: 15),
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
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, left: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset(
                          'image/program6.png',
                          width: 100,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 135, left: 15),
                          child: const Text('1',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Color(0xFFFFFFFF))),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 155, left: 5),
                          child: const Text('????????? ?????????2',
                              style: TextStyle(
                                  fontSize: 11, color: Color(0xFF6D6D6D))),
                        ),
                      ],
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, left: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset(
                          'image/program1.png',
                          width: 100,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 135, left: 15),
                          child: const Text('2',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Color(0xFFFFFFFF))),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 155, left: 5),
                          child: const Text('????????????2',
                              style: TextStyle(
                                  fontSize: 11, color: Color(0xFF6D6D6D))),
                        ),
                      ],
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, left: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset(
                          'image/program5.png',
                          width: 100,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 135, left: 15),
                          child: const Text('3',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Color(0xFFFFFFFF))),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 155, left: 5),
                          child: const Text('????????????7',
                              style: TextStyle(
                                  fontSize: 11, color: Color(0xFF6D6D6D))),
                        ),
                      ],
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 10, right: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset(
                          'image/program2.png',
                          width: 100,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 135, left: 15),
                          child: const Text('4',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Color(0xFFFFFFFF))),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 155, left: 5),
                          child: const Text('????????? ?????????',
                              style: TextStyle(
                                  fontSize: 11, color: Color(0xFF6D6D6D))),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}
