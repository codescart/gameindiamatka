import 'dart:async';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/core/app_constant.dart';
import 'package:http/http.dart' as http;
class Slider_wer extends StatefulWidget {
  const Slider_wer({Key? key}) : super(key: key);

  @override
  State<Slider_wer> createState() => _Slider_werState();
}

class _Slider_werState extends State<Slider_wer> {


  get controller => null;
  @override
  void initState() {
    state();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 120.h,
        aspectRatio: 16/9,
        viewportFraction: 0.9,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
      items: state_data.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1,color: Colors.white),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(i["images"]),
                  )
                ),

            );
          },
        );
      }).toList(),
    );
  }
  List state_data = [];

  Future<String> state() async {
    final res = await http.get(
        Uri.parse(Apiconst.baseurl+'slider')
    );
    final resBody = json.decode(res.body)['id'];
    print("hhhhhhhhhhhhh");
    print(resBody);
    setState(() {
      state_data = resBody;
    });



    return "Sucess";
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