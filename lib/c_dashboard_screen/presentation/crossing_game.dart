import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:gameindiamatka/utils/core/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:http/http.dart' as http;





class Home extends StatefulWidget {
  final String name;
  Home({Key? key, required this.name}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late double _distanceToField;



  late TextfieldTagsController _controller;
  final amoount = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  var amd;
  var multi;
  pank(amoount) {
    setState(() {
      amd = amoount;
      multi=amoount*10;
    });

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
  var am;

  harsh(){
    if(_controller.getTags![0].isNotEmpty ) {
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
        body: SingleChildScrollView(
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
                  onChanged:  pank(amoount.text),
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
              Padding(
                padding: const EdgeInsets.only(right: 140,),
                child: Container(
                  child: Text("dubble tap to calculate the number"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color: AppConstant.backgroundColor,
                    child: Center(
                      child: ButtonTheme(
                        height: 40,
                        minWidth: 300,
                        child: InkWell(
                          child: Container(
                            height: 40,
                              decoration: BoxDecoration(
                                color: AppConstant.primaryColor,
                                borderRadius: BorderRadius.circular(10),),
                            padding: EdgeInsets.only(
                              left: 30,
                              right: 30,
                              top: 10,bottom: 10
                            ),


                              child: Text("Calculate")),
                          onDoubleTap: (){
                            var amoii= double.parse(amd.toString());
                            // var lrhjk= double.parse(_);
                            int intVar = _controller.getTags!.length;
                            double doubleVar = intVar.toDouble();

                            double calcu= amoii.toDouble()*doubleVar.toDouble()*doubleVar.toDouble();
                             var str = calcu;
                            String calci = str.toString();
                            rala(calci);
                            // var calc = double.parse(str);
                            // print(calc);
                            harsh();

                          },
                          onTap: () {

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
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(10.0)),
                               ),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: ButtonTheme(
                        height: 40,
                        minWidth: 100,
                        child: RaisedButton(
                          color: AppConstant.primaryColor,
                          child: Text("Clear Numbers"),
                          onPressed: () {
                            _controller.clearTags();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),),
                      ),
                    ),
                  ),
                ],
              ),


              SizedBox(height: 10,),
              Container(
                child: Text("ALL BET",style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold),),
              ),
        SizedBox(height: 15,),
        Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height*0.30,
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
              Container(
                height: MediaQuery.of(context).size.height*0.18,
                child: ListView(
                  children: [
//                    aa != null? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text( aa   ?? ''), Text( '₹'+ amd.toString()),],):Text(""),

                    aa	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	aa	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    bb	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	bb	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ab	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ab	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ba	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ba	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    bc	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	bc	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ac	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ac	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    cc	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	cc	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    cb	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	cb	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ca	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ca	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ad	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ad	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    bd	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	bd	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    cd	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	cd	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    dd	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	dd	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    da	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	da	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    db	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	db	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    dc	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	dc	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ea	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ea	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    eb	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	eb	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ec	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ec	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ed	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ed	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ee	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ee	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ae	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ae	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    be	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	be	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ce	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ce	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    de	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	de	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    fa	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	fa	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    fb	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	fb	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    fc	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	fc	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    fd	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	fd	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    fe	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	fe	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ff	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ff	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    af	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	af	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    bf	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	bf	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    cf	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	cf	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    df	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	df	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ef	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ef	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ga	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ga	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    gb	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	gb	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    gc	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	gc	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    gd	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	gd	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ge	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ge	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    gf	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	gf	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    gg	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	gg	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ag	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ag	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    bg	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	bg	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    cg	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	cg	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    dg	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	dg	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    eg	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	eg	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    fg	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	fg	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ha	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ha	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    hb	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	hb	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    hc	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	hc	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    hd	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	hd	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    he	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	he	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    hf	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	hf	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    hg	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	hg	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    hh	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	hh	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ah	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ah	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    bh	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	bh	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ch	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ch	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    dh	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	dh	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    eh	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	eh	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    fh	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	fh	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    gh	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	gh	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ia	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ia	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ib	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ib	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ic	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ic	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    id	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	id	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ie	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ie	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ifa	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ifa	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ig	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ig	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ih	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ih	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ii	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ii	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ai	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ai	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    bi	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	bi	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ci	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ci	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    di	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	di	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    ei	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	ei	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    fi	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	fi	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    gi	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	gi	?? ''), Text( '₹'+ amd.toString()),],):Text(""),
                    hi	!= null ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [Text(	hi	?? ''), Text( '₹'+ amd.toString()),],):Text(""),


                  ],),
              ),

              Divider(thickness: 0.5, color: Colors.white,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Total Amount ='),
                  calc != null?
                  Text(calc.toString()):Text(" 00"),

                ],
              ),

            ],
          ),

        ),
              SizedBox(height: 35,),
              Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                  color: AppConstant.primaryColor,
                  borderRadius: BorderRadius.circular(10),),

                child: InkWell(
                  child:
                  calc != null?
                  Center(child: Text("BET NOW  " + "₹"+calc.toString())):Center(child: Text("BET NOW  ")),
                  onTap: () {
                    print("dfgffg");
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
                  onDoubleTap: (){ crossbet(amoount.text);print("tugyhhuh");}
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(10.0)),),
              ),
              )]
    )
        ),
      ),
    );
  }
var calc;
  rala(String calci) {
    setState(() {
      calc=calci;

    });
  }

  crossbet(String amoount) async {
    print(amoount);
    print(a+b);
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    final prefs2 = await SharedPreferences.getInstance();
    final key2 = 'gameid';
    final value2 = prefs2.getString(key2) ?? "0";
    print("$value");
    if (a != null && b != null) {

      final r = await http.post(
        Uri.parse(Apiconst.baseurl + 'beto'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{

          "user_id": "$value",
          "amount": amoount,
          "gameid": widget.name,
          "n": a + b,
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
          "n": b + a
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
          "n": a + a
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
          "n": b + b
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
      if (a != null && b != null && c != null) {
        final r = await http.post(
          Uri.parse(Apiconst.baseurl + 'beto'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "user_id": "$value",
            "amount": amoount,
            "gameid": widget.name,
            "n": a + c
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
            "n": b + c
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
            "n": c + a
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
            "n": c + b
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
            "n": c + c
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
        if (a != null && b != null && c != null &&
            d != null) {
          final r = await http.post(
            Uri.parse(Apiconst.baseurl + 'beto'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              "user_id": "$value",
              "amount": amoount,
              "gameid": widget.name,
              "n": a + d
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
              "n": b + d
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
              "n": c + d
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
              "n": d + d
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
              "n": d + a
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
              "n": d + b
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
              "n": d + c
            }),
          );
          if (a != null && b != null && c != null &&
              d != null && e != null) {
            final r = await http.post(
              Uri.parse(Apiconst.baseurl + 'beto'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                "user_id": "$value",
                "amount": amoount,
                "gameid": widget.name,
                "n": a + e
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
                "n": b + e
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
                "n": c + e
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
                "n": d + e
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
                "n": e + e
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
                "n": e + a
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
                "n": e + b
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
                "n": e + c
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
                "n": e + d
              }),
            );
            if (a != null && b != null && c != null &&
                d != null && e != null && f != null) {
              final r = await http.post(
                Uri.parse(Apiconst.baseurl + 'beto'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<String, String>{
                  "user_id": "$value",
                  "amount": amoount,
                  "gameid": widget.name,
                  "n": a + f
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
                  "n": b + f
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
                  "n": c + f
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
                  "n": d + f
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
                  "n": e + f
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
                  "n": f + f
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
                  "n": f + a
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
                  "n": f + b
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
                  "n": f + c
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
                  "n": f + d
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
                  "n": f + e
                }),
              );
              // final respnseeed = await http.post(
              //   Uri.parse(Apiconst.baseurl + 'beto'),
              //   headers: <String, String>{
              //     'Content-Type': 'application/json; charset=UTF-8',
              //   },
              //   body: jsonEncode(<String, String>{
              //     "user_id": "$value",
              //     "amount": amoount,
              //     "gameid": widget.name,
              //     "n": f + f
              //   }),
              // );
              if (a != null && b != null && c != null &&
                  d != null && e != null && f != null &&
                  g != null) {
                final r = await http.post(
                  Uri.parse(Apiconst.baseurl + 'beto'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    "user_id": "$value",
                    "amount": amoount,
                    "gameid": widget.name,
                    "n": a + g
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
                    "n": b + g
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
                    "n": c + g
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
                    "n": d + g
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
                    "n": e + g
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
                    "n": f + g
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
                    "n": g + g
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
                    "n": g + a
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
                    "n": g + b
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
                    "n": g + c
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
                    "n": g + d
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
                    "n": g + e
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
                    "n": g + f
                  }),
                );
                // final respnsod = await http.post(
                //   Uri.parse(Apiconst.baseurl + 'beto'),
                //   headers: <String, String>{
                //     'Content-Type': 'application/json; charset=UTF-8',
                //   },
                //   body: jsonEncode(<String, String>{
                //     "user_id": "$value",
                //     "amount": amoount,
                //     "gameid": widget.name,
                //     "n": g + g
                //   }),
                // );

                if (a != null && b != null && c != null &&
                    d != null && e != null && f != null &&
                    g != null && h != null) {
                  final r = await http.post(
                    Uri.parse(Apiconst.baseurl + 'beto'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      "user_id": "$value",
                      "amount": amoount,
                      "gameid": widget.name,
                      "n": a + h
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
                      "n": b + h
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
                      "n": c + h
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
                      "n": d + h
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
                      "n": e + h
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
                      "n": f + h
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
                      "n": g + h
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
                      "n": h + h
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
                      "n": h + a
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
                      "n": h + b
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
                      "n": h + c
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
                      "n": h + d
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
                      "n": h + e
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
                      "n": h + f
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
                      "n": h + g
                    }),
                  );
                  // final respnsood = await http.post(
                  //   Uri.parse(Apiconst.baseurl + 'beto'),
                  //   headers: <String, String>{
                  //     'Content-Type': 'application/json; charset=UTF-8',
                  //   },
                  //   body: jsonEncode(<String, String>{
                  //     "user_id": "$value",
                  //     "amount": amoount,
                  //     "gameid": widget.name,
                  //     "n": h + h
                  //   }),
                  // );

                  if (a != null && b != null && c != null &&
                      d != null && e != null && f != null &&
                      g != null && h != null && i != null) {
                    final r = await http.post(
                      Uri.parse(Apiconst.baseurl + 'beto'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        "user_id": "$value",
                        "amount": amoount,
                        "gameid": widget.name,
                        "n": a + i
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
                        "n": b + i
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
                        "n": c + i
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
                        "n": d + i
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
                        "n": e + i
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
                        "n": f + i
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
                        "n": g + i
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
                        "n": h + i
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
                        "n": i + i
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
                        "n": i + a
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
                        "n": i + b
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
                        "n": i + c
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
                        "n": i + d
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
                        "n": i + e
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
                        "n": i + f
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
                        "n": i + g
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
                        "n": i + h
                      }),
                    );
                    // final respnsord = await http.post(
                    //   Uri.parse(Apiconst.baseurl + 'beto'),
                    //   headers: <String, String>{
                    //     'Content-Type': 'application/json; charset=UTF-8',
                    //   },
                    //   body: jsonEncode(<String, String>{
                    //     "user_id": "$value",
                    //     "amount": amoount,
                    //     "gameid": widget.name,
                    //     "n": i + i
                    //   }),
                    // );
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
                    print(a + c);
                    print(b + c);
                    print(c + a);
                    print(c + b);
                    print(c + c);
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
                  print(a + c);
                  print(b + c);
                  print(c + a);
                  print(c + b);
                  print(c + c);
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
                print(a + c);
                print(b + c);
                print(c + a);
                print(c + b);
                print(c + c);
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
              print(a + c);
              print(b + c);
              print(c + a);
              print(c + b);
              print(c + c);
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
            print(a + c);
            print(b + c);
            print(c + a);
            print(c + b);
            print(c + c);
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
          print(a + c);
          print(b + c);
          print(c + a);
          print(c + b);
          print(c + c);
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
        print(a + c);
        print(b + c);
        print(c + a);
        print(c + b);
        print(c + c);
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

}



