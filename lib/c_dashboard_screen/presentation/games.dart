import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gameindiamatka/b_authentication_screen/widgets/custom_button.dart';
import 'package:gameindiamatka/c_dashboard_screen/presentation/crossing_game.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:http/http.dart' as http;



class Games extends StatefulWidget {
  final String id;
  final String name;
  Games({Key? key, required this.id,required this.name}) : super(key: key);


  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}



class _MyTabbedPageState extends State<Games> with SingleTickerProviderStateMixin {
  final amoount = TextEditingController();
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Jodi Game',),
    Tab(text: 'Andar Bahar'),
    Tab(text: 'Crossing',),

  ];

  late TabController _tabController;
  late FocusNode text1, text2, text3, text4, text5, text6, text7, text8, text9;

  final d1 = TextEditingController();
  final d2 = TextEditingController();
  final d3 = TextEditingController();
  final d4 = TextEditingController();
  final d5 = TextEditingController();
  final d6 = TextEditingController();
  final d7 = TextEditingController();
  final d8 = TextEditingController();
  final d9 = TextEditingController();


  @override
  void initState() {
    // bet(newValue!);
    super.initState();
    text1 = FocusNode();
    text2 = FocusNode();
    text3 = FocusNode();
    text4 = FocusNode();
    text5 = FocusNode();
    text6 = FocusNode();
    text7 = FocusNode();
    text8 = FocusNode();
    text9 = FocusNode();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    text1.dispose();
    text2.dispose();
    text3.dispose();
    text4.dispose();
    text5.dispose();
    text6.dispose();
    text7.dispose();
    text8.dispose();
    text9.dispose();
    super.dispose();
  }

  var name = [
    "00",
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
    "60",
    "61",
    "62",
    "63",
    "64",
    "65",
    "66",
    "67",
    "68",
    "69",
    "70",
    "71",
    "72",
    "73",
    "74",
    "75",
    "76",
    "77",
    "78",
    "79",
    "80",
    "81",
    "82",
    "83",
    "84",
    "85",
    "86",
    "87",
    "88",
    "89",
    "90",
    "91",
    "92",
    "93",
    "94",
    "95",
    "96",
    "97",
    "98",
    "99"
  ];
  var items = [
    'select',
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];
  String dropdownvalue = 'select';
  String dl1 = 'select';
  String dl2 = 'select';
  String dl3 = 'select';
  String dl4 = 'select';
  String dl5 = 'select';
  String dl6 = 'select';
  String dl7 = 'select';
  String dl8 = 'select';
  String dl9 = 'select';

// late String newValue;
  bool ?newval;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1e1e1e),
        appBar: AppBar(
          backgroundColor: Color(0xFF1e1e1e),
          title: Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Text("Games"),
          ),
          bottom: TabBar(

            labelColor: AppConstant.primaryColor,
            unselectedLabelColor: Colors.white,
            controller: _tabController,
            tabs: myTabs,
          ),
        ),
        body: TabBarView(
            controller: _tabController,
            children: [
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.only(top: 9, bottom: 8),
                                child: Text(
                                  "Chose any number to place a betting price",
                                  style: TextStyle(color: Colors.white),)),
                            Container(child: Text(
                              "*Bet below 5000 on each number ",
                              style: TextStyle(
                                  color: Colors.white),))
                          ],
                        ),
                      ),

                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.76,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          // implement GridView.builder
                          child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                              ),
                              itemCount: name.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(166, 177, 187, 1),
                                        borderRadius: BorderRadius.circular(
                                            15)),
                                    child: RaisedButton(

                                      color: AppConstant.secondaryColor,
                                      hoverColor: AppConstant.primaryColor,
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                scrollable: true,
                                                content: Padding(
                                                  padding: const EdgeInsets.all(
                                                      8.0),
                                                  child: Form(
                                                    child: Column(
                                                      children: <Widget>[
                                                        SizedBox(height: 50,),
                                                        Container(
                                                          padding: EdgeInsets
                                                              .only(left: 60),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                height: 70,
                                                                width: 70,
                                                                color: AppConstant
                                                                    .backgroundColor,
                                                                child: Center(
                                                                    child: Text(
                                                                      name[index],
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize: 26),)),
                                                              ),
                                                              SizedBox(
                                                                width: 38,),
                                                              Container(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                      bottom: 40),
                                                                  child: IconButton(
                                                                    onPressed: () {
                                                                      Navigator
                                                                          .of(
                                                                          context)
                                                                          .pop();
                                                                    },
                                                                    icon: Icon(
                                                                        Icons
                                                                            .close),
                                                                  )
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 50,),
                                                        Container(
                                                          child: Text(
                                                            "Betting price on selected number",
                                                            style: TextStyle(
                                                                fontSize: 12),),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        TextFormField(

                                                          validator: (value) {
                                                            if (value!.isEmpty)
                                                              return;

                                                            return null;
                                                          },
                                                          decoration: InputDecoration(
                                                            border: OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .circular(
                                                                    10),
                                                                borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xff03062a),
                                                                )),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .circular(
                                                                    10),
                                                                borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xff03062a),
                                                                  width: 2,
                                                                )),

                                                            prefixIcon: Icon(
                                                              Icons
                                                                  .currency_rupee_outlined,
                                                              size: 16,
                                                              color: Color(
                                                                  0xff03062a),
                                                            ),
                                                          ),
                                                          controller: amoount,
                                                        ),
                                                        SizedBox(height: 15,),
                                                        Container(
                                                          child: Text(
                                                            "*Jodi price bellow ₹ 5000",
                                                            style: TextStyle(
                                                                fontSize: 12),),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                actions: [
                                                  Center(
                                                    child: ButtonTheme(
                                                      height: 40,
                                                      minWidth: 250,
                                                      child: RaisedButton(
                                                        color: AppConstant
                                                            .primaryColor,
                                                        child: Text("Bet Now"),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          final num = name[index];
                                                          jodi(num,
                                                              amoount.text);
                                                        },
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(
                                                                10.0)),),
                                                    ),
                                                  )
                                                ],
                                              );
                                            });
                                      },
                                      child: Text(name[index]),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 205, top: 18,),
                        child: Text("crossing number"),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 50, width: 320,
                        decoration: BoxDecoration(
                          color: AppConstant.secondaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DropdownButton(

                              // Initial Value
                              value: dropdownvalue,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected valueet

                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                  final value = true;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.only(right: 205,),
                        child: Text("crossing into price"),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: SlidingSwitch(
                          value: false,
                          width: 320,
                          onChanged: (bool value) {
                            newval = value as bool;
                          },
                          height: 55,
                          animationDuration: const Duration(milliseconds: 400),
                          onTap: () {
                            setState(() {
                              if(newval == true){
                                final a=dropdownvalue + "0";
                                final b=dropdownvalue + "1";
                                final c=dropdownvalue + "2";
                                final d=dropdownvalue + "3";
                                final e=dropdownvalue + "4";
                                final f=dropdownvalue + "5";
                                final g=dropdownvalue + "6";
                                final h=dropdownvalue + "7";
                                final i=dropdownvalue + "8";
                                final j=dropdownvalue + "9";

                              }else{
                                final k="1"+ dropdownvalue;
                                final l="2"+ dropdownvalue;
                                final m="3"+ dropdownvalue;
                                final n="4"+ dropdownvalue;
                                final o="5"+ dropdownvalue;
                                final p="6"+ dropdownvalue;
                                final q="7"+ dropdownvalue;
                                final r="8"+ dropdownvalue;
                                final s="9"+ dropdownvalue;


                              }

                            });
                             raaa(newval);
                          },
                          onDoubleTap: () {},
                          onSwipe: () {},
                          textOff: "Andar",
                          textOn: "Bahar",
                          colorOn: AppConstant.primaryColor,
                          colorOff: AppConstant.titlecolor,
                          background: AppConstant.secondaryColor,
                          buttonColor: AppConstant.subtitlecolor,
                          inactiveColor: const Color(0xff636f7b),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 140,),
                        child: Text("*Crossing price below ₹ 5000"),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 50, width: 320,
                        decoration: BoxDecoration(
                          color: AppConstant.secondaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          onChanged: pank(amoount.text),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) return;

                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                )),
                            prefixIcon: Icon(
                              Icons.currency_rupee_outlined, size: 16,
                              color: Colors.white,
                            ),
                            hintText: "00",
                          ),


                          controller: amoount,

                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        child: Text("All Bet",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height*0.36,
                        width: 320,
                        decoration: BoxDecoration(
                          color: Color(0xff272727),
                          borderRadius: BorderRadius.circular(12),),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Cross Data'),
                                Text('    or    '),
                                Text('Amount'),
                              ],
                            ),
                            Divider(thickness: 0.5, color: Colors.white,),

                            newval!=false?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('0'+dropdownvalue),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ):Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(dropdownvalue+'0'),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ),
                            newval!=false?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('1'+dropdownvalue),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ):Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(dropdownvalue+'1'),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ),
                            newval!=false?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('2'+dropdownvalue),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ):Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(dropdownvalue+'2'),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ),
                            newval!=false?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('3'+dropdownvalue),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ):Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(dropdownvalue+'3'),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ),
                            newval!=false?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('4'+dropdownvalue),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ):Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(dropdownvalue+'4'),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ),
                            newval!=false?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('5'+dropdownvalue),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ):Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(dropdownvalue+'5'),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ),
                            newval!=false?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('6'+dropdownvalue),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ):Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(dropdownvalue+'6'),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ),
                            newval!=false?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('7'+dropdownvalue),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ):Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(dropdownvalue+'7'),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ),
                            newval!=false?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('8'+dropdownvalue),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ):Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(dropdownvalue+'8'),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ),
                            newval!=false?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('9'+dropdownvalue),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ):Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(dropdownvalue+'9'),
                                Text('    =    '),
                                Text(amd.toString()),
                              ],
                            ),
                            Divider(thickness: 0.5, color: Colors.white,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Total Amount ='),
                                Text(amd.toString()+"0"),

                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: Center(
                          child: ButtonTheme(
                            height: 40,
                            minWidth: 320,
                            child: RaisedButton(
                              color: AppConstant.primaryColor,
                              child: Text("BET NOW"),
                              onPressed: () {
                                bet(amoount.text);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                  child: Container(
                      child: Column(
                        children: [
                          Container(
                            height:MediaQuery.of(context).size.height,
                            child:Home(name: widget.name,),
                          ),




                        ],
                      )
                  )
              )
            ]
        )






























    );
  }
   raaa(bool? newval) {
    if(newval == true){
      final m=dropdownvalue + "1";
      print(newval);
      print(m);
    }else{
      final g="1"+ dropdownvalue;
      print(g);
    }
  }
  bet(String amoount) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";

    if (newval != true) {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": dropdownvalue + "1"
        }),
      );
      final data = jsonDecode(response.body);
      print(dropdownvalue + "1");
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      }
      else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    else {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": "1" + dropdownvalue
        }),
      );
      final data = jsonDecode(response.body);
      print("1" + dropdownvalue);
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    if (newval != true) {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": dropdownvalue + "2"
        }),
      );
      final data = jsonDecode(response.body);
      print(dropdownvalue + "2");
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": "2" + dropdownvalue
        }),
      );
      final data = jsonDecode(response.body);
      print("2" + dropdownvalue);
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    if (newval != true) {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": dropdownvalue + "3"
        }),
      );
      final data = jsonDecode(response.body);
      print(dropdownvalue + "3");
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": "3" + dropdownvalue
        }),
      );
      final data = jsonDecode(response.body);
      print("3" + dropdownvalue);
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    if (newval != true) {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": dropdownvalue + "4"
        }),
      );
      final data = jsonDecode(response.body);
      print(dropdownvalue + "4");
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": "4" + dropdownvalue
        }),
      );
      final data = jsonDecode(response.body);
      print("4" + dropdownvalue);
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    if (newval != true) {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": dropdownvalue + "5"
        }),
      );
      final data = jsonDecode(response.body);
      print(dropdownvalue + "5");
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": "5" + dropdownvalue
        }),
      );
      final data = jsonDecode(response.body);
      print("5" + dropdownvalue);
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    if (newval != true) {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": dropdownvalue + "6"
        }),
      );
      final data = jsonDecode(response.body);
      print(dropdownvalue + "6");
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": "6" + dropdownvalue
        }),
      );
      final data = jsonDecode(response.body);
      print("6" + dropdownvalue);
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    if (newval != true) {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": dropdownvalue + "7"
        }),
      );
      final data = jsonDecode(response.body);
      print(dropdownvalue + "7");
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": "7" + dropdownvalue
        }),
      );
      final data = jsonDecode(response.body);
      print("7" + dropdownvalue);
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    if (newval != true) {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": dropdownvalue + "8"
        }),
      );
      final data = jsonDecode(response.body);
      print(dropdownvalue + "8");
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": "8" + dropdownvalue
        }),
      );
      final data = jsonDecode(response.body);
      print("8" + dropdownvalue);
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    if (newval != true) {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": dropdownvalue + "9"
        }),
      );
      final data = jsonDecode(response.body);
      print(dropdownvalue + "9");
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": "9" + dropdownvalue
        }),
      );
      final data = jsonDecode(response.body);
      print("9" + dropdownvalue);
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    if (newval != true) {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": dropdownvalue + "0"
        }),
      );
      final data = jsonDecode(response.body);
      print(dropdownvalue + "1");
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      final response = await http.post(
        Uri.parse(
            Apiconst.baseurl + "beto"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": "0" + dropdownvalue
        }),
      );
      final data = jsonDecode(response.body);
      print("1" + dropdownvalue);
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");

      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  jodi(String num, String amoount) async {
    print(num);
    print(amoount);
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    final response = await http.post(
      Uri.parse(
          Apiconst.baseurl + "beto"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "user_id": "$value",
        "amount": amoount,
        "gameid": widget.name,
        "n": num
      }),
    );
    final data = jsonDecode(response.body);
    print(data);
    if (data['error'] == 200) {
      Fluttertoast.showToast(
          msg: "Bet Placed SucessFully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      print("Bet Placed SucessFully");
    } else {
      Fluttertoast.showToast(
          msg: data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  crossbet(String amoount, String d1, String d2, String d3, String d4,
      String d5, String d6, String d7, String d8, String d9) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    if (d1 != 'select' && d2 != 'select') {
      final r = await http.post(
        Uri.parse(Apiconst.baseurl + 'beto'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": d1 + d2
        }),
      );
      final re = await http.post(
        Uri.parse(Apiconst.baseurl + 'beto'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": d2 + d1
        }),
      );
      final res = await http.post(
        Uri.parse(Apiconst.baseurl + 'beto'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": d1 + d1
        }),
      );
      final resp = await http.post(
        Uri.parse(Apiconst.baseurl + 'beto'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": d2 + d2
        }),
      );
      final data = jsonDecode(resp.body);
      if (data['error'] == 200) {
        Fluttertoast.showToast(
            msg: "Bet Placed SucessFully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print("Bet Placed SucessFully");
      } else {
        Fluttertoast.showToast(
            msg: data['msg'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      if (d1 != 'select' && d2 != 'select' && d3 != 'select') {
        final r = await http.post(
          Uri.parse(Apiconst.baseurl + 'beto'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "user_id": "$value",
            "amount": amoount,
            "gameid": widget.name,
            "n": d1 + d3
          }),
        );
        final re = await http.post(
          Uri.parse(Apiconst.baseurl + 'beto'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "user_id": "$value",
            "amount": amoount,
            "gameid": widget.name,
            "n": d2 + d3
          }),
        );
        final res = await http.post(
          Uri.parse(Apiconst.baseurl + 'beto'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "user_id": "$value",
            "amount": amoount,
            "gameid": widget.name,
            "n": d3 + d1
          }),
        );
        final resp = await http.post(
          Uri.parse(Apiconst.baseurl + 'beto'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "user_id": "$value",
            "amount": amoount,
            "gameid": widget.name,
            "n": d3 + d2
          }),
        );
        final respo = await http.post(
          Uri.parse(Apiconst.baseurl + 'beto'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "user_id": "$value",
            "amount": amoount,
            "gameid": widget.name,
            "n": d3 + d2
          }),
        );
        final data = jsonDecode(respo.body);
        if (data['error'] == 200) {
          Fluttertoast.showToast(
              msg: "Bet Placed SucessFully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          print("Bet Placed SucessFully");
        } else {
          Fluttertoast.showToast(
              msg: data['msg'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        if (d1 != 'select' && d2 != 'select' && d3 != 'select' &&
            d4 != 'select') {
          final r = await http.post(
            Uri.parse(Apiconst.baseurl + 'beto'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              "user_id": "$value",
              "amount": amoount,
              "gameid": widget.name,
              "n": d1 + d4
            }),
          );
          final re = await http.post(
            Uri.parse(Apiconst.baseurl + 'beto'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              "user_id": "$value",
              "amount": amoount,
              "gameid": widget.name,
              "n": d2 + d4
            }),
          );
          final res = await http.post(
            Uri.parse(Apiconst.baseurl + 'beto'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              "user_id": "$value",
              "amount": amoount,
              "gameid": widget.name,
              "n": d3 + d4
            }),
          );
          final respo = await http.post(
            Uri.parse(Apiconst.baseurl + 'beto'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              "user_id": "$value",
              "amount": amoount,
              "gameid": widget.name,
              "n": d4 + d4
            }),
          );
          final resp = await http.post(
            Uri.parse(Apiconst.baseurl + 'beto'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              "user_id": "$value",
              "amount": amoount,
              "gameid": widget.name,
              "n": d4 + d1
            }),
          );
          final respon = await http.post(
            Uri.parse(Apiconst.baseurl + 'beto'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              "user_id": "$value",
              "amount": amoount,
              "gameid": widget.name,
              "n": d4 + d2
            }),
          );
          final data = jsonDecode(respo.body);
          final respons = await http.post(
            Uri.parse(Apiconst.baseurl + 'beto'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              "user_id": "$value",
              "amount": amoount,
              "gameid": widget.name,
              "n": d4 + d3
            }),
          );
          if (d1 != 'select' && d2 != 'select' && d3 != 'select' &&
              d4 != 'select' && d5 != 'select') {
            final r = await http.post(
              Uri.parse(Apiconst.baseurl + 'beto'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                "user_id": "$value",
                "amount": amoount,
                "gameid": widget.name,
                "n": d1 + d5
              }),
            );
            final re = await http.post(
              Uri.parse(Apiconst.baseurl + 'beto'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                "user_id": "$value",
                "amount": amoount,
                "gameid": widget.name,
                "n": d2 + d5
              }),
            );
            final res = await http.post(
              Uri.parse(Apiconst.baseurl + 'beto'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                "user_id": "$value",
                "amount": amoount,
                "gameid": widget.name,
                "n": d3 + d5
              }),
            );
            final respo = await http.post(
              Uri.parse(Apiconst.baseurl + 'beto'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                "user_id": "$value",
                "amount": amoount,
                "gameid": widget.name,
                "n": d4 + d5
              }),
            );
            final response = await http.post(
              Uri.parse(Apiconst.baseurl + 'beto'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                "user_id": "$value",
                "amount": amoount,
                "gameid": widget.name,
                "n": d5 + d5
              }),
            );
            final resp = await http.post(
              Uri.parse(Apiconst.baseurl + 'beto'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                "user_id": "$value",
                "amount": amoount,
                "gameid": widget.name,
                "n": d5 + d1
              }),
            );
            final respon = await http.post(
              Uri.parse(Apiconst.baseurl + 'beto'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                "user_id": "$value",
                "amount": amoount,
                "gameid": widget.name,
                "n": d5 + d2
              }),
            );
            final data = jsonDecode(respo.body);
            final respons = await http.post(
              Uri.parse(Apiconst.baseurl + 'beto'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                "user_id": "$value",
                "amount": amoount,
                "gameid": widget.name,
                "n": d5 + d3
              }),
            );
            final responsed = await http.post(
              Uri.parse(Apiconst.baseurl + 'beto'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                "user_id": "$value",
                "amount": amoount,
                "gameid": widget.name,
                "n": d5 + d4
              }),
            );
            if (d1 != 'select' && d2 != 'select' && d3 != 'select' &&
                d4 != 'select' && d5 != 'select' && d6 != 'select') {
              final r = await http.post(
                Uri.parse(Apiconst.baseurl + 'beto'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<String, String>{
                  "user_id": "$value",
                  "amount": amoount,
                  "gameid": widget.name,
                  "n": d1 + d6
                }),
              );
              final re = await http.post(
                Uri.parse(Apiconst.baseurl + 'beto'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<String, String>{
                  "user_id": "$value",
                  "amount": amoount,
                  "gameid": widget.name,
                  "n": d2 + d6
                }),
              );
              final res = await http.post(
                Uri.parse(Apiconst.baseurl + 'beto'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<String, String>{
                  "user_id": "$value",
                  "amount": amoount,
                  "gameid": widget.name,
                  "n": d3 + d6
                }),
              );
              final respo = await http.post(
                Uri.parse(Apiconst.baseurl + 'beto'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<String, String>{
                  "user_id": "$value",
                  "amount": amoount,
                  "gameid": widget.name,
                  "n": d4 + d6
                }),
              );
              final response = await http.post(
                Uri.parse(Apiconst.baseurl + 'beto'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<String, String>{
                  "user_id": "$value",
                  "amount": amoount,
                  "gameid": widget.name,
                  "n": d5 + d6
                }),
              );
              final responsed = await http.post(
                Uri.parse(Apiconst.baseurl + 'beto'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<String, String>{
                  "user_id": "$value",
                  "amount": amoount,
                  "gameid": widget.name,
                  "n": d6 + d6
                }),
              );
              final resp = await http.post(
                Uri.parse(Apiconst.baseurl + 'beto'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<String, String>{
                  "user_id": "$value",
                  "amount": amoount,
                  "gameid": widget.name,
                  "n": d6 + d1
                }),
              );
              final respon = await http.post(
                Uri.parse(Apiconst.baseurl + 'beto'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<String, String>{
                  "user_id": "$value",
                  "amount": amoount,
                  "gameid": widget.name,
                  "n": d6 + d2
                }),
              );
              final data = jsonDecode(respo.body);
              final respons = await http.post(
                Uri.parse(Apiconst.baseurl + 'beto'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<String, String>{
                  "user_id": "$value",
                  "amount": amoount,
                  "gameid": widget.name,
                  "n": d6 + d3
                }),
              );
              final responseed = await http.post(
                Uri.parse(Apiconst.baseurl + 'beto'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<String, String>{
                  "user_id": "$value",
                  "amount": amoount,
                  "gameid": widget.name,
                  "n": d6 + d4
                }),
              );
              final respnseed = await http.post(
                Uri.parse(Apiconst.baseurl + 'beto'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<String, String>{
                  "user_id": "$value",
                  "amount": amoount,
                  "gameid": widget.name,
                  "n": d6 + d5
                }),
              );
              final respnseeed = await http.post(
                Uri.parse(Apiconst.baseurl + 'beto'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<String, String>{
                  "user_id": "$value",
                  "amount": amoount,
                  "gameid": widget.name,
                  "n": d6 + d6
                }),
              );
              if (d1 != 'select' && d2 != 'select' && d3 != 'select' &&
                  d4 != 'select' && d5 != 'select' && d6 != 'select' &&
                  d7 != 'select') {
                final r = await http.post(
                  Uri.parse(Apiconst.baseurl + 'beto'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    "user_id": "$value",
                    "amount": amoount,
                    "gameid": widget.name,
                    "n": d1 + d7
                  }),
                );
                final re = await http.post(
                  Uri.parse(Apiconst.baseurl + 'beto'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    "user_id": "$value",
                    "amount": amoount,
                    "gameid": widget.name,
                    "n": d2 + d7
                  }),
                );
                final res = await http.post(
                  Uri.parse(Apiconst.baseurl + 'beto'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    "user_id": "$value",
                    "amount": amoount,
                    "gameid": widget.name,
                    "n": d3 + d7
                  }),
                );
                final respo = await http.post(
                  Uri.parse(Apiconst.baseurl + 'beto'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    "user_id": "$value",
                    "amount": amoount,
                    "gameid": widget.name,
                    "n": d4 + d7
                  }),
                );
                final response = await http.post(
                  Uri.parse(Apiconst.baseurl + 'beto'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    "user_id": "$value",
                    "amount": amoount,
                    "gameid": widget.name,
                    "n": d5 + d7
                  }),
                );
                final responsed = await http.post(
                  Uri.parse(Apiconst.baseurl + 'beto'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    "user_id": "$value",
                    "amount": amoount,
                    "gameid": widget.name,
                    "n": d6 + d7
                  }),
                );
                final responsod = await http.post(
                  Uri.parse(Apiconst.baseurl + 'beto'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    "user_id": "$value",
                    "amount": amoount,
                    "gameid": widget.name,
                    "n": d7 + d7
                  }),
                );
                final resp = await http.post(
                  Uri.parse(Apiconst.baseurl + 'beto'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    "user_id": "$value",
                    "amount": amoount,
                    "gameid": widget.name,
                    "n": d7 + d1
                  }),
                );
                final respon = await http.post(
                  Uri.parse(Apiconst.baseurl + 'beto'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    "user_id": "$value",
                    "amount": amoount,
                    "gameid": widget.name,
                    "n": d7 + d2
                  }),
                );
                final data = jsonDecode(respo.body);
                final respons = await http.post(
                  Uri.parse(Apiconst.baseurl + 'beto'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    "user_id": "$value",
                    "amount": amoount,
                    "gameid": widget.name,
                    "n": d7 + d3
                  }),
                );
                final responseed = await http.post(
                  Uri.parse(Apiconst.baseurl + 'beto'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    "user_id": "$value",
                    "amount": amoount,
                    "gameid": widget.name,
                    "n": d7 + d4
                  }),
                );
                final respnseed = await http.post(
                  Uri.parse(Apiconst.baseurl + 'beto'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    "user_id": "$value",
                    "amount": amoount,
                    "gameid": widget.name,
                    "n": d7 + d5
                  }),
                );
                final respnseeed = await http.post(
                  Uri.parse(Apiconst.baseurl + 'beto'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    "user_id": "$value",
                    "amount": amoount,
                    "gameid": widget.name,
                    "n": d7 + d6
                  }),
                );
                final respnsod = await http.post(
                  Uri.parse(Apiconst.baseurl + 'beto'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    "user_id": "$value",
                    "amount": amoount,
                    "gameid": widget.name,
                    "n": d7 + d7
                  }),
                );

                if (d1 != 'select' && d2 != 'select' && d3 != 'select' &&
                    d4 != 'select' && d5 != 'select' && d6 != 'select' &&
                    d7 != 'select' && d8 != 'select') {
                  final r = await http.post(
                    Uri.parse(Apiconst.baseurl + 'beto'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      "user_id": "$value",
                      "amount": amoount,
                      "gameid": widget.name,
                      "n": d1 + d8
                    }),
                  );
                  final re = await http.post(
                    Uri.parse(Apiconst.baseurl + 'beto'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      "user_id": "$value",
                      "amount": amoount,
                      "gameid": widget.name,
                      "n": d2 + d8
                    }),
                  );
                  final res = await http.post(
                    Uri.parse(Apiconst.baseurl + 'beto'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      "user_id": "$value",
                      "amount": amoount,
                      "gameid": widget.name,
                      "n": d3 + d8
                    }),
                  );
                  final respo = await http.post(
                    Uri.parse(Apiconst.baseurl + 'beto'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      "user_id": "$value",
                      "amount": amoount,
                      "gameid": widget.name,
                      "n": d4 + d8
                    }),
                  );
                  final response = await http.post(
                    Uri.parse(Apiconst.baseurl + 'beto'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      "user_id": "$value",
                      "amount": amoount,
                      "gameid": widget.name,
                      "n": d5 + d8
                    }),
                  );
                  final responsed = await http.post(
                    Uri.parse(Apiconst.baseurl + 'beto'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      "user_id": "$value",
                      "amount": amoount,
                      "gameid": widget.name,
                      "n": d6 + d8
                    }),
                  );
                  final responsod = await http.post(
                    Uri.parse(Apiconst.baseurl + 'beto'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      "user_id": "$value",
                      "amount": amoount,
                      "gameid": widget.name,
                      "n": d7 + d8
                    }),
                  );
                  final responsood = await http.post(
                    Uri.parse(Apiconst.baseurl + 'beto'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      "user_id": "$value",
                      "amount": amoount,
                      "gameid": widget.name,
                      "n": d8 + d8
                    }),
                  );
                  final resp = await http.post(
                    Uri.parse(Apiconst.baseurl + 'beto'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      "user_id": "$value",
                      "amount": amoount,
                      "gameid": widget.name,
                      "n": d8 + d1
                    }),
                  );
                  final respon = await http.post(
                    Uri.parse(Apiconst.baseurl + 'beto'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      "user_id": "$value",
                      "amount": amoount,
                      "gameid": widget.name,
                      "n": d8 + d2
                    }),
                  );
                  final data = jsonDecode(respo.body);
                  final respons = await http.post(
                    Uri.parse(Apiconst.baseurl + 'beto'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      "user_id": "$value",
                      "amount": amoount,
                      "gameid": widget.name,
                      "n": d8 + d3
                    }),
                  );
                  final responseed = await http.post(
                    Uri.parse(Apiconst.baseurl + 'beto'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      "user_id": "$value",
                      "amount": amoount,
                      "gameid": widget.name,
                      "n": d8 + d4
                    }),
                  );
                  final respnseed = await http.post(
                    Uri.parse(Apiconst.baseurl + 'beto'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      "user_id": "$value",
                      "amount": amoount,
                      "gameid": widget.name,
                      "n": d8 + d5
                    }),
                  );
                  final respnseeed = await http.post(
                    Uri.parse(Apiconst.baseurl + 'beto'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      "user_id": "$value",
                      "amount": amoount,
                      "gameid": widget.name,
                      "n": d8 + d6
                    }),
                  );
                  final respnsod = await http.post(
                    Uri.parse(Apiconst.baseurl + 'beto'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      "user_id": "$value",
                      "amount": amoount,
                      "gameid": widget.name,
                      "n": d8 + d7
                    }),
                  );
                  final respnsood = await http.post(
                    Uri.parse(Apiconst.baseurl + 'beto'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      "user_id": "$value",
                      "amount": amoount,
                      "gameid": widget.name,
                      "n": d8 + d8
                    }),
                  );

                  if (d1 != 'select' && d2 != 'select' && d3 != 'select' &&
                      d4 != 'select' && d5 != 'select' && d6 != 'select' &&
                      d7 != 'select' && d8 != 'select' && d9 != 'select') {
                    final r = await http.post(
                      Uri.parse(Apiconst.baseurl + 'beto'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "user_id": "$value",
                        "amount": amoount,
                        "gameid": widget.name,
                        "n": d1 + d9
                      }),
                    );
                    final re = await http.post(
                      Uri.parse(Apiconst.baseurl + 'beto'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "user_id": "$value",
                        "amount": amoount,
                        "gameid": widget.name,
                        "n": d2 + d9
                      }),
                    );
                    final res = await http.post(
                      Uri.parse(Apiconst.baseurl + 'beto'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "user_id": "$value",
                        "amount": amoount,
                        "gameid": widget.name,
                        "n": d3 + d9
                      }),
                    );
                    final respo = await http.post(
                      Uri.parse(Apiconst.baseurl + 'beto'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "user_id": "$value",
                        "amount": amoount,
                        "gameid": widget.name,
                        "n": d4 + d9
                      }),
                    );
                    final response = await http.post(
                      Uri.parse(Apiconst.baseurl + 'beto'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "user_id": "$value",
                        "amount": amoount,
                        "gameid": widget.name,
                        "n": d5 + d9
                      }),
                    );
                    final responsed = await http.post(
                      Uri.parse(Apiconst.baseurl + 'beto'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "user_id": "$value",
                        "amount": amoount,
                        "gameid": widget.name,
                        "n": d6 + d9
                      }),
                    );
                    final responsod = await http.post(
                      Uri.parse(Apiconst.baseurl + 'beto'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "user_id": "$value",
                        "amount": amoount,
                        "gameid": widget.name,
                        "n": d7 + d9
                      }),
                    );
                    final responsood = await http.post(
                      Uri.parse(Apiconst.baseurl + 'beto'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "user_id": "$value",
                        "amount": amoount,
                        "gameid": widget.name,
                        "n": d8 + d9
                      }),
                    );
                    final responsoed = await http.post(
                      Uri.parse(Apiconst.baseurl + 'beto'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "user_id": "$value",
                        "amount": amoount,
                        "gameid": widget.name,
                        "n": d9 + d9
                      }),
                    );
                    final resp = await http.post(
                      Uri.parse(Apiconst.baseurl + 'beto'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "user_id": "$value",
                        "amount": amoount,
                        "gameid": widget.name,
                        "n": d9 + d1
                      }),
                    );
                    final respon = await http.post(
                      Uri.parse(Apiconst.baseurl + 'beto'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "user_id": "$value",
                        "amount": amoount,
                        "gameid": widget.name,
                        "n": d9 + d2
                      }),
                    );
                    final data = jsonDecode(respo.body);
                    final respons = await http.post(
                      Uri.parse(Apiconst.baseurl + 'beto'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "user_id": "$value",
                        "amount": amoount,
                        "gameid": widget.name,
                        "n": d9 + d3
                      }),
                    );
                    final responseed = await http.post(
                      Uri.parse(Apiconst.baseurl + 'beto'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "user_id": "$value",
                        "amount": amoount,
                        "gameid": widget.name,
                        "n": d9 + d4
                      }),
                    );
                    final respnseed = await http.post(
                      Uri.parse(Apiconst.baseurl + 'beto'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "user_id": "$value",
                        "amount": amoount,
                        "gameid": widget.name,
                        "n": d9 + d5
                      }),
                    );
                    final respnseeed = await http.post(
                      Uri.parse(Apiconst.baseurl + 'beto'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "user_id": "$value",
                        "amount": amoount,
                        "gameid": widget.name,
                        "n": d9 + d6
                      }),
                    );
                    final respnsod = await http.post(
                      Uri.parse(Apiconst.baseurl + 'beto'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "user_id": "$value",
                        "amount": amoount,
                        "gameid": widget.name,
                        "n": d9 + d7
                      }),
                    );
                    final respnsood = await http.post(
                      Uri.parse(Apiconst.baseurl + 'beto'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "user_id": "$value",
                        "amount": amoount,
                        "gameid": widget.name,
                        "n": d9 + d8
                      }),
                    );
                    final respnsord = await http.post(
                      Uri.parse(Apiconst.baseurl + 'beto'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "user_id": "$value",
                        "amount": amoount,
                        "gameid": widget.name,
                        "n": d9 + d9
                      }),
                    );
                    if (data['error'] == 200) {
                      Fluttertoast.showToast(
                          msg: "Bet Placed SucessFully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      print("Bet Placed SucessFully");
                    } else {
                      Fluttertoast.showToast(
                          msg: data['msg'],
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                    print(d1 + d3);
                    print(d2 + d3);
                    print(d3 + d1);
                    print(d3 + d2);
                    print(d3 + d3);
                  }
                  else {
                    Fluttertoast.showToast(
                        msg: "4 No. Bet Success",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  if (data['error'] == 200) {
                    Fluttertoast.showToast(
                        msg: "Bet Placed SucessFully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    print("Bet Placed SucessFully");
                  } else {
                    Fluttertoast.showToast(
                        msg: data['msg'],
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  print(d1 + d3);
                  print(d2 + d3);
                  print(d3 + d1);
                  print(d3 + d2);
                  print(d3 + d3);
                }
                else {
                  Fluttertoast.showToast(
                      msg: "4 No. Bet Success",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
                if (data['error'] == 200) {
                  Fluttertoast.showToast(
                      msg: "Bet Placed SucessFully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  print("Bet Placed SucessFully");
                } else {
                  Fluttertoast.showToast(
                      msg: data['msg'],
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
                print(d1 + d3);
                print(d2 + d3);
                print(d3 + d1);
                print(d3 + d2);
                print(d3 + d3);
              }
              else {
                Fluttertoast.showToast(
                    msg: "4 No. Bet Success",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
              if (data['error'] == 200) {
                Fluttertoast.showToast(
                    msg: "Bet Placed SucessFully",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
                print("Bet Placed SucessFully");
              } else {
                Fluttertoast.showToast(
                    msg: data['msg'],
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
              print(d1 + d3);
              print(d2 + d3);
              print(d3 + d1);
              print(d3 + d2);
              print(d3 + d3);
            }
            else {
              Fluttertoast.showToast(
                  msg: "4 No. Bet Success",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
            if (data['error'] == 200) {
              Fluttertoast.showToast(
                  msg: "Bet Placed SucessFully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
              print("Bet Placed SucessFully");
            } else {
              Fluttertoast.showToast(
                  msg: data['msg'],
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
            print(d1 + d3);
            print(d2 + d3);
            print(d3 + d1);
            print(d3 + d2);
            print(d3 + d3);
          }
          else {
            Fluttertoast.showToast(
                msg: "4 No. Bet Success",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          }


          if (data['error'] == 200) {
            Fluttertoast.showToast(
                msg: "Bet Placed SucessFully",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            print("Bet Placed SucessFully");
          } else {
            Fluttertoast.showToast(
                msg: data['msg'],
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          print(d1 + d3);
          print(d2 + d3);
          print(d3 + d1);
          print(d3 + d2);
          print(d3 + d3);
        }
        else {
          Fluttertoast.showToast(
              msg: "4 No. Bet Success",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        print(d1 + d3);
        print(d2 + d3);
        print(d3 + d1);
        print(d3 + d2);
        print(d3 + d3);
      }
      else {
        Fluttertoast.showToast(
            msg: "4 No. Bet Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    else {
      Fluttertoast.showToast(
          msg: "Please Select 2 Number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  calculate(String amoount, String d1, String d2, String d3, String d4,
      String d5, String d6, String d7, String d8, String d9) async {
    if (d1 != 'select' && d2 != 'select') {
      final n1 = d1 + d1;
      final n2 = d1 + d2;
      final n3 = d2 + d1;
      final n4 = d2 + d2;

      if (d1 != 'select' && d2 != 'select' && d3 != 'select') {
        final n5 = d1 + d3;
        final n6 = d2 + d3;
        final n7 = d3 + d3;
        if (d1 != 'select' && d2 != 'select' && d3 != 'select' &&
            d4 != 'select') {
          final n8 = d1 + d4;
          final n9 = d2 + d4;
          final n10 = d3 + d4;
          final n11 = d4 + d4;
          final n12 = d4 + d1;
          final n13 = d4 + d2;
          final n14 = d4 + d3;
          if (d1 != 'select' && d2 != 'select' && d3 != 'select' &&
              d4 != 'select' && d5 != 'select') {
            final n15 = d1 + d5;
            final n16 = d2 + d5;
            final n17 = d3 + d5;
            final n18 = d4 + d5;
            final n19 = d5 + d5;
            final n20 = d5 + d1;
            final n21 = d5 + d2;
            final n22 = d5 + d3;
            final n23 = d5 + d4;

            if (d1 != 'select' && d2 != 'select' && d3 != 'select' &&
                d4 != 'select' && d5 != 'select' && d6 != 'select') {
              final n24 = d1 + d6;
              final n25 = d2 + d6;
              final n26 = d3 + d6;
              final n27 = d4 + d6;
              final n28 = d5 + d6;
              final n29 = d6 + d6;
              final n30 = d6 + d1;
              final n31 = d6 + d2;
              final n32 = d6 + d3;
              final n33 = d6 + d4;
              final n34 = d6 + d5;

              if (d1 != 'select' && d2 != 'select' && d3 != 'select' &&
                  d4 != 'select' && d5 != 'select' && d6 != 'select' &&
                  d7 != 'select') {
                final n35 = d1 + d7;
                final n36 = d2 + d7;
                final n37 = d3 + d7;
                final n38 = d4 + d7;
                final n39 = d5 + d7;
                final n40 = d6 + d7;
                final n41 = d7 + d7;
                final n42 = d7 + d1;
                final n43 = d7 + d2;
                final n44 = d7 + d3;
                final n45 = d7 + d4;
                final n46 = d7 + d5;
                final n47 = d7 + d6;

                if (d1 != 'select' && d2 != 'select' && d3 != 'select' &&
                    d4 != 'select' && d5 != 'select' && d6 != 'select' &&
                    d7 != 'select' && d8 != 'select') {
                  final n48 = d1 + d8;
                  final n49 = d2 + d8;
                  final n50 = d3 + d8;
                  final n51 = d4 + d8;
                  final n52 = d5 + d8;
                  final n53 = d6 + d8;
                  final n54 = d7 + d8;
                  final n55 = d8 + d8;
                  final n56 = d8 + d1;
                  final n57 = d8 + d2;
                  final n58 = d8 + d3;
                  final n59 = d8 + d4;
                  final n64 = d8 + d5;
                  final n65 = d8 + d6;
                  final n66 = d8 + d7;


                  if (d1 != 'select' && d2 != 'select' && d3 != 'select' &&
                      d4 != 'select' && d5 != 'select' && d6 != 'select' &&
                      d7 != 'select' && d8 != 'select' && d9 != 'select') {
                    final n67 = d1 + d9;
                    final n68 = d2 + d9;
                    final n69 = d3 + d9;
                    final n70 = d4 + d9;
                    final n71 = d5 + d9;
                    final n72 = d6 + d9;
                    final n73 = d7 + d9;
                    final n74 = d8 + d9;
                    final n75 = d9 + d9;
                    final n76 = d9 + d1;
                    final n77 = d9 + d2;
                    final n78 = d9 + d3;
                    final n79 = d9 + d4;
                    final n80 = d9 + d5;
                    final n81 = d9 + d6;
                    final n82 = d9 + d7;
                    final n83 = d9 + d8;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  var amd;
  var multi;
  pank(amoount) {
    setState(() {
       amd = amoount;
       multi=amoount*10;
    });

  }

}



