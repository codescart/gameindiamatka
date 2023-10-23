import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:gameindiamatka/utils/core/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:http/http.dart' as http;





class HomeTest extends StatefulWidget {
  const HomeTest({Key? key}) : super(key: key);

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  late double _distanceToField;
  late TextfieldTagsController _controller;
  final amoount = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
  }

  static const List<String> _pickLanguage = <String>[
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

  var a ;
  var b ;
  var c ;
  var d ;
  var e ;
  var f ;
  var  g;
  var h ;
  var i ;

  var ab ;
  var  aa;
  var bb ;
  var ba ;

  var bc;
  var ac;
  var cc;
  var cb;
  var ca;

  var ad;
  var bd;
  var cd;
  var dd;
  var da;
  var db;
  var dc;

  var ea;
  var eb;
  var ec;
  var ed;
  var ee;
  var ae;
  var be;
  var ce;
  var de;

  var fa;
  var fb;
  var fc;
  var fd;
  var fe;
  var ff;
  var af;
  var bf;
  var cf;
  var df;
  var ef;

  var ga;
  var gb;
  var gc;
  var gd;
  var ge;
  var gf;
  var gg;
  var ag;
  var bg;
  var cg;
  var dg;
  var eg;
  var fg;

  var ha;
  var hb;
  var hc;
  var hd;
  var he;
  var hf;
  var hg;
  var hh;
  var ah;
  var bh;
  var ch;
  var dh;
  var eh;
  var fh;
  var gh;

  var ia;
  var ib;
  var ic;
  var id;
  var ie;
  var ifa;
  var ig;
  var ih;
  var ii;
  var ai;
  var bi;
  var ci;
  var di;
  var ei;
  var fi;
  var gi;
  var hi;


  harsh(){
    print('ffffff');
    if(_controller.getTags![0].isNotEmpty && _controller.getTags![1].isNotEmpty) {
      setState(() {
        ab = a + b;
        aa = a + a;
        ba = b + a;
        bb = b + b;
      });



      if(_controller.getTags![2].isNotEmpty) {
        setState(() {
          ac = a + c;
          bc = b + c;
          cc = c + c;
          cb = c + b;
          ca = c + a;
        });

        if(_controller.getTags![3].isNotEmpty) {
          setState(() {
            ad = a + d;
            bd = b + d;
            cd = c + d;
            dd = d + d;
            da = d + a;
            db = d + b;
            dc = d + c;
          });

          if (_controller.getTags![4].isNotEmpty) {
            setState(() {
              ea = e + a;
              eb = e + b;
              ec = e + c;
              ed = e + d;
              ee = e + e;
              ae = a + e;
              be = b + e;
              ce = c + e;
              de = d + e;
            });
          }

          if (_controller.getTags![5].isNotEmpty) {
            setState(() {
              fa = f + a;
              fb = f + b;
              fc = f + c;
              fd = f + d;
              fe = f + e;
              ff = f + f;
              af = a + f;
              bf = b + f;
              cf = c + f;
              df = d + f;
              ef = e + f;
            });
          }

          if (_controller.getTags![6].isNotEmpty) {
            setState(() {
              ga = g + a;
              gb = g + b;
              gc = g + c;
              gd = g + d;
              ge = g + e;
              gf = g + f;
              gg = g + g;
              ag =  a+ g;
              bg = b + g;
              cg =  c+ g;
              dg = d + g;
              eg = e + g;
              fg = f + g;
            });
          }

          if (_controller.getTags![7].isNotEmpty) {
            setState(() {
              ha = h + a;
              hb = h + b;
              hc = h + c;
              hd = h + d;
              he = h + e;
              hf = h + f;
              hg = h + g;
              hh = h + h;
              ah =  a+ h;
              bh = b + h;
              ch =  c+ h;
              dh = d + h;
              eh = e + h;
              fh = f + h;
              gh = g + h;

            });
          }

          if (_controller.getTags![8].isNotEmpty) {
            setState(() {
              ia = i + a;
              ib = i + b;
              ic = i + c;
              id = i + d;
              ie = i + e;
              ifa = i + f;
              ig = i + g;
              ih = i + h;
              ii = i + i;
              ai =  a+ i;
              bi = b + i;
              ci =  c+ i;
              di = d + i;
              ei = e + i;
              fi = f + i;
              gi = g + i;
              hi = h + i;

            });
          }

        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              Autocomplete<String>(
                optionsViewBuilder: (context, onSelected, options) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 4.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Material(
                        elevation: 4.0,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 200),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: options.length,
                            itemBuilder: (BuildContext context, int index) {
                              final dynamic option = options.elementAt(index);
                              return TextButton(
                                onPressed: () {
                                  onSelected(option);
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: Text(
                                      '$option',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        color: AppConstant.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return _pickLanguage.where((String option) {
                    return option.contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selectedTag) {
                  _controller.addTag = selectedTag;
                },
                fieldViewBuilder: (context, ttec, tfn, onFieldSubmitted) {
                  return TextFieldTags(
                    textEditingController: ttec,
                    focusNode: tfn,
                    textfieldTagsController: _controller,
                    // initialTags: const [
                    //   '',
                    //   '',
                    //   '',
                    //   '',
                    //   '',
                    // ],
                    textSeparators: const [' ', ','],
                    letterCase: LetterCase.normal,
                    validator: (String tag) {
                      if (tag == 'php') {
                        return 'No, please just no';
                      } else if (_controller.getTags!.contains(tag)) {
                        return 'you already entered that';
                      }
                      return null;
                    },
                    inputfieldBuilder:
                        (context, tec, fn, error, onChanged, onSubmitted) {
                      return ((context, sc, tags, onTagDelete) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: tec,
                            focusNode: fn,
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppConstant.secondaryColor,
                                    width: 3.0),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppConstant.primaryColor,
                                    width: 3.0),
                              ),
                              helperText: 'Enter Number...',
                              helperStyle: const TextStyle(
                                color: AppConstant.titlecolor,
                              ),
                              hintText: _controller.hasTags ? '' : "Enter number ...",
                              errorText: error,
                              prefixIconConstraints: BoxConstraints(
                                  maxWidth: _distanceToField * 0.74),
                              prefixIcon: tags.isNotEmpty
                                  ? SingleChildScrollView(
                                controller: sc,
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    children: tags.map((String tag) {
                                      return Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                          color:
                                          AppConstant.primaryColor,
                                        ),
                                        margin:
                                        const EdgeInsets.only(right: 10.0),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              child: Text(
                                                '$tag',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              // onTap: () {
                                              //   //print("$tag selected");
                                              // },
                                            ),
                                            const SizedBox(width: 4.0),
                                            InkWell(
                                              child: const Icon(
                                                Icons.cancel,
                                                size: 14.0,
                                                color: Color.fromARGB(
                                                    255, 233, 233, 233),
                                              ),
                                              onTap: () {
                                                onTagDelete(tag);
                                              },
                                            )
                                          ],
                                        ),
                                      );
                                    }).toList()),
                              )
                                  : null,
                            ),
                            onChanged: onChanged,
                            onSubmitted: onSubmitted,
                          ),
                        );
                      });
                    },
                  );
                },
              ),
              SizedBox(height: 30,),
              Container(
                child: Center(
                  child: ButtonTheme(
                    height: 40,
                    minWidth: 300,
                    child: RaisedButton(
                      color: AppConstant.primaryColor,
                      child: Text("Calculate"),
                      onPressed: () {
                        harsh();
                        setState(() {

                          a=_controller.getTags![0];
                          b=_controller.getTags![1];
                          c=_controller.getTags![2];
                          d=_controller.getTags![3];
                          e=_controller.getTags![4];
                          f=_controller.getTags![5];
                          g=_controller.getTags![6];
                          h=_controller.getTags![7];
                          i=_controller.getTags![8];
                        });

                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),),
                  ),
                ),
              ),
              SizedBox(height: 20,),
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
                        (amoount.text);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),),
                  ),
                ),
              ),
              Text(a.toString() ?? ''),
              Text(b.toString() ?? ''),
              Text(c ?? ''),
              Text(d ?? ''),
              // _controller.getTags!.isNotEmpty?
              // Text(_controller.getTags![0]):Text("hhh")
              // ListView.builder(
              //     itemCount: _controller.getTags!.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Column(
              //         children: [
              //          Text("vgvvgv")
              //         ],
              //       );
              //     }),

            ],

          ),
        ),
      ),
    );
  }

}


crossbet(String amoount, String d1, String d2, String d3, String d4,
    String d5, String d6, String d7, String d8, String d9) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'user_id';
  final value = prefs.getString(key) ?? "0";
  if (d1 != 'select' && d2 != 'select') {
    var widget;
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
