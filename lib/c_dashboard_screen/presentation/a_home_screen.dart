import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameindiamatka/b_authentication_screen/presentation/welcome_screen.dart';
import 'package:gameindiamatka/b_authentication_screen/widgets/custom_button.dart';
import 'package:gameindiamatka/c_dashboard_screen/all_gameview.dart';
import 'package:gameindiamatka/c_dashboard_screen/application/crasual_slider.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/action_bar/wallet_screen.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/drawer/a_how_to_play_screen.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/drawer/account_page.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/drawer/b_change_password_screen.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/drawer/c_company_trust_profile_screen.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/drawer/d_transacation_history_screen.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/live%20_result.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/live%20game.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/upcoming_result_page.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/upcomming_game.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


class Album {
  String id;
  String market_name;
  String market_result;
  String batting_openingtime;
  String batting_close_time;
  String result;
  String format;
  String date;
  String month;
  String year;




  Album(this.id,this.market_name,this.market_result,
      this.batting_openingtime,this.batting_close_time,this.result,this.format,this.date,this.month,this.year
      );

}
Future<List<Album>> bow() async{
  final response = await http.get(
    Uri.parse(Apiconst.baseurl+'allgame'),

  );
  var jsond = json.decode(response.body)["country"];
  print(jsond);
  List<Album> allround = [];
  for (var o in jsond)  {
    Album al = Album(
      o["id"],
      o["market_name"],
      o["market_result"],
      o["batting_openingtime"],
      o["batting_close_time"],
      o["result"],
      o["format"],
      o["date"],
      o["month"],
      o["year"],

    );

    allround.add(al);
  }
  return allround;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late Future<Alb> futureAlbum;

  void initState() {
    leader();
    versioncheck();
    // futureAlbum = fetchAlbum();
    // TODO: implement initState
    super.initState();
  }
  var mapl;
  var map;
  bool raja=false;
  Future versioncheck() async{
    final response = await http.post(
      Uri.parse(Apiconst.baseurl+'version'),
    );
    var data = jsonDecode(response.body)['country'];

    if (data[0]['version']!= Apiconst.versioncode) {
      print("jsi ho");
      setState(() {
        raja=true;


      });
    }else{
      print("Bhag yha se");
    }
  }




  Future leader() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    final response = await http.post(
      Uri.parse(Apiconst.baseurl+'userpro'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "user_id":"$value"
      }),
    );
    var data = jsonDecode(response.body);
    print(data);
    if (data['error'] == '200') {
      setState(() {
        map=json.decode(response.body)['country'];


      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),() => showAlert(context));
    return SafeArea(
      child: map==null?Center(child: CircularProgressIndicator()):
      Scaffold(
        appBar:
        AppBar(
          toolbarHeight: 70,
          actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppConstant.secondaryColor,
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> WalletScreen()));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                            map['wallet'] == ''?
                            '\u{20B9}'+'0' : '\u{20B9}'+map['wallet'].toString(),
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                    Icon(
                                      Icons.account_balance_wallet_outlined,
                                      size: 18.sp,
                                    )
                                  ],
                                ),
                                Text(
                                  'Wallet',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            ),
        drawer: Drawer(
          backgroundColor: AppConstant.backgroundColor,
          child: Column(
            children: [
              Container(
                width: 260.w,
                color: AppConstant.secondaryColor,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>  AccountScreen(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 40.r,
                        backgroundColor: AppConstant.backgroundColor,
                        child: Icon(
                          Icons.person_rounded,
                          size: 48.sp,
                          color: AppConstant.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        map['name'] == ''?
                        'Your Name' : map['name'].toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      map['email'] == ''?
                      'Your Email' : map['email'].toString(),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 1.5.h,
                      color: AppConstant.subtitlecolor.withOpacity(0.3),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  'How to play',
                  style: Theme.of(context).textTheme.headline4,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HowToPlayScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Change password',
                  style: Theme.of(context).textTheme.headline4,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChangePasswordScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Company trust profile',
                  style: Theme.of(context).textTheme.headline4,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CompanyTrustProfileScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Transaction History',
                  style: Theme.of(context).textTheme.headline4,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TransactionHistoryScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Website',
                  style: Theme.of(context).textTheme.headline4,
                ),
                onTap: _launchURL1    ,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Version : ',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(Apiconst.versioncode,style: Theme.of(context).textTheme.headline5,),
                ],
              ),

              SizedBox(
                height: 5.h,
              ),
              Container(
                color: AppConstant.secondaryColor,
                child: ListTile(
                  title: Text(
                    'Sign out',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  onTap: () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user_id');
    Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (BuildContext ctx) => WelcomeScreen()));
    },
                ),
              ),
            ],
          ),
        ),
        body: map==null?Center(child: CircularProgressIndicator()):
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.15,
                child: FutureBuilder<List<Album>>(
                    future: bow(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);

                      return snapshot.hasData
                          ? ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=> list(Time: snapshot.data![index].batting_close_time, Name: snapshot.data![index].market_name,
                                  Time2: snapshot.data![index].batting_openingtime, Formate: snapshot.data![index].format, Result:snapshot.data![index].result,)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppConstant.primaryColor,
                                  radius: 30.r,
                                  child: CircleAvatar(
                                    backgroundColor: AppConstant.backgroundColor,
                                    radius: 27.r,
                                    child: Icon(
                                      Icons.apartment_rounded,
                                      color: AppConstant.titlecolor,
                                      size: 24.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  '${snapshot.data![index].market_name}',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ):Center(child: Text("Wait For All Game"));
                  }
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Slider_wer(),


              SizedBox(
                height: 10.h,
              ),
              Text(
                'Live Results',
                style: Theme.of(context).textTheme.headline3,
              ),

              LiveResult(),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Live Games',
                  style: Theme.of(context).textTheme.headline3,
                ),
              Livegame(),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Upcoming Games',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> UpcommingResult()));
                      },
                      child: Text(
                        'View All',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: AppConstant.subtitlecolor,
                    ),
                  ],
                ),
              SizedBox(
                height: 20.h,
              ),
              UpcommingGame(),
     ],
          ),
        ),
      ),
    );
  }
  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) =>
            raja==false?
            AlertDialog(
          content:

          Container(
            height: 300,
            child: Column(
              children: [
                Text(map['name'] == ''?
                'Your Name' : map['name'].toString(),
                  style: Theme.of(context).textTheme.headline4,),
                Text("जरुरी सुचना"),
                SizedBox(height: 15,),
                Text("आपके India Matka में खेलने पर आपको 1 के 100 का भुगतन मिलेगा\nIndia Matkaके सभी ग्राहक 24×7 अपने भुगतान की निकासी के लिए अनुरोध डाल सकते हैं सुबह 8 से 12 बीच आपका भुगतान डाल दिया जाएगा"),
                 SizedBox(height: 15,),
                Text("अगर किसी भी ग्राहक को India Matka  मे गेम प्ले करने में परेशानी आती है या पेमेंट निकालने में परेशानी आती \nहै तो नीचे दिये गये नंबर पर संपर्क करें धन्यवाद"),
                TextButton(onPressed:(){
                  _launchCaller();
                }, child: Text("+91 79884 98648")
                ),
              ],
            ),
          ),
          actions: [
             CustomButton(
              text: 'CLOSE',
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ):AlertDialog(
              content: Container(
                child: Row(
                  children: [
                    Container(
                      width: 40,height: 40,
                      child: Image(image:AssetImage("assets/images/dmatka1.png") ),
                    ),
                    SizedBox(width: 20,),
                    Text('new version are avilable'),
                  ],
                ),

              ),
              actions: [
                CustomButton(
                  text: 'UPDATE',
                  onTap: () {
                    _launchURL();
                  },
                ),
              ],
            )

    );
  }
}
_launchCaller() async {
  const url = "tel:7988498648";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


_launchURL() async {
  const url = 'https://indiamatka.app/admin/app-release.apk';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL1() async {
  const url = 'https://indiamatka.app/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
class Alb {
  String images;


  Alb(this.images);

}
Future<List<Alb>> bowe() async{
  final response = await http.post(
    Uri.parse(Apiconst.baseurl+'slider'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      // "hospital_id":"98"
    }),

  );

  var jsond = json.decode(response.body)["id"];
  print(jsond);
  List<Alb> allround = [];
  for (var o in jsond)  {
    Alb al = Alb(
      o["images"],


    );

    allround.add(al);
  }
  return allround;
}
