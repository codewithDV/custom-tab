import 'package:flutter/material.dart';

class TabCusTom extends StatefulWidget {
  TabCusTom({Key? key}) : super(key: key);

  @override
  _TabCusTomState createState() => _TabCusTomState();
}

class _TabCusTomState extends State<TabCusTom> {
  int _selectedpage = 1;
  PageController _pageController = PageController();

  void _changePage(int pageNum) {
    setState(() {
      _selectedpage = pageNum;
      _pageController!.animateToPage(
        pageNum,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  changePage(int pageNum) {
    setState(() {
      _selectedpage = pageNum;
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customButton(
            PageNum: 0,
            onPressed: () {
              _changePage(0);
            },
            SelectedPage: _selectedpage,
            textc: "tab1",
          ),
          const SizedBox(
            width: 50,
          ),
          customButton(
            onPressed: () {
              _changePage(1);
            },
            PageNum: 1,
            SelectedPage: _selectedpage,
            textc: "tab2",
          ),
        ],
      ),
      Expanded(
        child: PageView(
          onPageChanged: (int page) {
            setState(() {
              _selectedpage = page;
            });
          },
          controller: _pageController,
          children: [
            Container(
              child: const Center(
                child: Text("Page 1"),
              ),
            ),
            Container(
              child: const Center(
                child: Text("Page 2"),
              ),
            )
          ],
        ),
      )
    ])));
  }
}

class customButton extends StatelessWidget {
  const customButton(
      {Key? key,
      required this.textc,
      required this.SelectedPage,
      required this.PageNum,
      required this.onPressed})
      : super(key: key);
  final String textc;
  final int SelectedPage;
  final int PageNum;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: onPressed,
          child: Text(
            textc,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color:
                    SelectedPage == PageNum ? Colors.blue : Colors.redAccent),
          ),
        ),
      ),
    );
  }
}
