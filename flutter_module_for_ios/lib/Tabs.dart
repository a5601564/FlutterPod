import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'OpenAccount_Index.dart';
import 'Mine_Index.dart';


class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    this._pageController = new PageController(initialPage: this._currentIndex);
  }

  List<Widget> _pageList = [OpenAccountPage(), OpenAccountPage(), OpenAccountPage(), OpenAccountPage(),MinePage()];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
//    ScreenAdapter.init(context);

    return Scaffold(
      body: PageView(
        controller: this._pageController,
        children: this._pageList,
        onPageChanged: (index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        physics: NeverScrollableScrollPhysics(), //禁止pageView滑动
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (index) {
          setState(() {
            this._currentIndex = index;
            this._pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title:Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), title:Text("开户")),
          BottomNavigationBarItem(icon: Icon(Icons.find_in_page), title:Text("资讯")),
          BottomNavigationBarItem(icon: Icon(Icons.people), title:Text("圈子")),
          BottomNavigationBarItem(icon: Icon(Icons.people), title:Text("我的"))
        ],
      ),
    );
  }
}
