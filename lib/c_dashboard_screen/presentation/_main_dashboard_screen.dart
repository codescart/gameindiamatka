import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/a_home_screen.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/b_chart_screen.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/c_my_matches_screen.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/d_chat_screen.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/e_share_earn.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';


class MainDashboardScreen extends StatefulWidget {

  @override
  _MainDashboardScreenState createState() => _MainDashboardScreenState();
}

class _MainDashboardScreenState extends State<MainDashboardScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController passController = TextEditingController();
  final passNode = FocusNode();
  int _currentIndex = 0;


  final tabs = [
    HomeScreen(),
    ChartScreen(),
    MyMatchesScreen(),
    ChatScreen(),
    ShareEarnScreen(),

  ];


  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Color(0xff10270E),
        body: tabs[_page],
        bottomNavigationBar: SizedBox(
          height: 65.0,
          child: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 0,
            height: 55.0,
            items: <Widget>[
              Icon(Icons.home_outlined, size: 25, color: Colors.white,),
              Icon(Icons.bar_chart_outlined, size: 25, color:  Colors.white),
              Icon(Icons.emoji_events_outlined, size: 25, color:  Colors.white,),
              Icon(Icons.headset_mic_outlined, size: 25, color:  Colors.white),
              Icon(Icons.share_outlined, size: 25, color:  Colors.white),
            ],
            color: Colors.black,
            buttonBackgroundColor: Colors.green,
            backgroundColor: AppConstant.backgroundColor,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
            letIndexChange
                : (index) => true,
          ),
        ),
      ),
    );
  }


}
