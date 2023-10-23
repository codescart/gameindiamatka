import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:gameindiamatka/utils/core/widgets/back_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  @override
  void initState() {
    leader();
    // TODO: implement initState
    super.initState();
  }

  var map;
  Future leader() async{

    // final prefs = await SharedPreferences.getInstance();
    // final key = 'mobile';
    // final value = prefs.getString(key) ?? 0;
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? 0;
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
    return Scaffold(
        appBar: AppBar(
          leading:CustomBackButton(),
          title:  Text('Account'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 60),
                  child:
                      GestureDetector(

                    child: Container(
                        alignment: Alignment.center,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color:AppConstant.primaryColor,
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              image: NetworkImage("https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-High-Quality-Image.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ),
                      ),
              ),
               SizedBox(height: 30,),
              Container(
                height: 380,
                width: 320,
                decoration: BoxDecoration(
                  color:AppConstant.secondaryColor,
                  borderRadius: BorderRadius.circular(12),),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        SizedBox(height: 70,),
                        Container(child: Text("Profile Detail")),

                        Padding(
                          padding: const EdgeInsets.only(left: 190),
                          child: Container(
                            child: Icon(Icons.edit_note_outlined),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 25,),
                    Row(
                      children: [
                        Container(
                          child: CircleAvatar(
                            backgroundColor: AppConstant.primaryColor,
                            radius: 15.r,
                            child: CircleAvatar(
                              backgroundColor: AppConstant.backgroundColor,
                              radius: 10.r,
                              child: Icon(
                                Icons.perm_identity,
                                color: AppConstant.titlecolor,
                                size: 16.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 40,width: 250,
                          child: map==null?Text("Your Name"):
                              Text(map['name'].toString())
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Container(
                          child: CircleAvatar(
                            backgroundColor: AppConstant.primaryColor,
                            radius: 15.r,
                            child: CircleAvatar(
                              backgroundColor: AppConstant.backgroundColor,
                              radius: 10.r,
                              child: Icon(
                                Icons.mail_outline_outlined,
                                color: AppConstant.titlecolor,
                                size: 16.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 40,width: 250,
                          child: map==null?Text("Your Email"):
                          Text(map['email'].toString())
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Container(
                          child: CircleAvatar(
                            backgroundColor: AppConstant.primaryColor,
                            radius: 15.r,
                            child: CircleAvatar(
                              backgroundColor: AppConstant.backgroundColor,
                              radius: 10.r,
                              child: Icon(
                                Icons.location_on_outlined,
                                color: AppConstant.titlecolor,
                                size: 16.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 40,width: 250,
                          child: map==null?Text("Your Mobile"):
                          Text(map['mobile'].toString())
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Container(
                          child: CircleAvatar(
                            backgroundColor: AppConstant.primaryColor,
                            radius: 15.r,
                            child: CircleAvatar(
                              backgroundColor: AppConstant.backgroundColor,
                              radius: 10.r,
                              child: Icon(
                                Icons.cake_outlined,
                                color: AppConstant.titlecolor,
                                size: 16.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 40,width: 250,
                          child: map==null?Text("Your DOB"):
                          Text(map['dob'].toString())
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Center(
                child: ButtonTheme(
                  height: 40,
                  minWidth: 320,
                  child: RaisedButton(
                    color:AppConstant.primaryColor,
                    child: Text("Update"),

                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> AccountScreenUpdate()));},
                      // submit(userName.text,useremail.text,useraddress.text,userdob.text);},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),),
                ),
              )
    ],
          ),
        ));
  }
}


class AccountScreenUpdate extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}
class _MyPageState extends State<AccountScreenUpdate> {
  /// Variables
  File ?imageFile;
  final userName = TextEditingController();
  final useremail = TextEditingController();
  final useraddress = TextEditingController();
  final userdob = TextEditingController();

  get controller => null;

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:CustomBackButton(),
        title:  Text('Account'),
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 60),
                  child: imageFile == null
                      ? GestureDetector(

                    child: Container(
                        alignment: Alignment.center,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color:AppConstant.primaryColor,
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              image: NetworkImage("https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-High-Quality-Image.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                    ),
                  )
                      :  GestureDetector(
                    child: Container(
                        alignment: Alignment.center,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color(0xff03062a),
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              image: FileImage(
                                imageFile!,
                              ),
                              fit: BoxFit.cover,

                            ),
                          ),
                        )
                    ),
                  )

              ),
              SizedBox(height: 30,),
              Container(
                height: 380,
                width: 320,
                decoration: BoxDecoration(
                  color:AppConstant.secondaryColor,
                  borderRadius: BorderRadius.circular(12),),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        SizedBox(height: 70,),
                        Container(child: Text("Profile Detail")),

                        Padding(
                          padding: const EdgeInsets.only(left: 190),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> AccountScreenUpdate()));
                            },
                            child: Container(
                              child: Icon(Icons.edit_note_outlined),
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 25,),
                    Row(
                      children: [
                        Container(
                          child: CircleAvatar(
                            backgroundColor: AppConstant.primaryColor,
                            radius: 15.r,
                            child: CircleAvatar(
                              backgroundColor: AppConstant.backgroundColor,
                              radius: 10.r,
                              child: Icon(
                                Icons.perm_identity,
                                color: AppConstant.titlecolor,
                                size: 16.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 40,width: 250,
                          child: TextFormField(
                            controller: userName,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.yellow,
                                ),
                              ),
                              labelText: 'Name',
                            ),

                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Container(
                          child: CircleAvatar(
                            backgroundColor: AppConstant.primaryColor,
                            radius: 15.r,
                            child: CircleAvatar(
                              backgroundColor: AppConstant.backgroundColor,
                              radius: 10.r,
                              child: Icon(
                                Icons.mail_outline_outlined,
                                color: AppConstant.titlecolor,
                                size: 16.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 40,width: 250,
                          child: TextFormField(
                            controller: useremail,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.yellow,
                                ),
                              ),
                              labelText: 'Email',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Container(
                          child: CircleAvatar(
                            backgroundColor: AppConstant.primaryColor,
                            radius: 15.r,
                            child: CircleAvatar(
                              backgroundColor: AppConstant.backgroundColor,
                              radius: 10.r,
                              child: Icon(
                                Icons.location_on_outlined,
                                color: AppConstant.titlecolor,
                                size: 16.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 40,width: 250,
                          child: TextFormField(
                            controller: useraddress,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.yellow,
                                ),
                              ),
                              labelText: 'Mobile',
                            ),

                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Container(
                          child: CircleAvatar(
                            backgroundColor: AppConstant.primaryColor,
                            radius: 15.r,
                            child: CircleAvatar(
                              backgroundColor: AppConstant.backgroundColor,
                              radius: 10.r,
                              child: Icon(
                                Icons.cake_outlined,
                                color: AppConstant.titlecolor,
                                size: 16.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 40,width: 250,
                          child: TextFormField(
                            controller: userdob,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.yellow,
                                ),
                              ),
                              labelText: 'Date of birth',
                            ),

                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Center(
              child: ButtonTheme(
              height: 40,
                minWidth: 320,
                child: RaisedButton(
                  color:AppConstant.primaryColor,
                  child: Text("Submit"),

                  onPressed: () {submit(userName.text,useremail.text,useraddress.text,userdob.text);
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => AccountScreen ()));
                    },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),),
                      ),
                     )
                     ],
                   ),
        ));
  }
}
submit(
    String userName, String useremail, String useraddress,
    String userdob,)
async {
  final prefs = await SharedPreferences.getInstance();
  final key1 = 'user_id';
  final value = prefs.getString(key1) ?? 0;
  final response = await http.post(
    Uri.parse(
        Apiconst.baseurl+"edit_profile"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
         "id":"$value",
         'name': userName,
           'email':useremail,
            "mobile":useraddress,
            "dob":userdob,


    }),
  );
  final data = jsonDecode(response.body);
  print(data);
  if (data['error'] == 200) {
    final prefs1 = await SharedPreferences
        .getInstance();
    final key1 = 'user_id';
    final mobile = data['id'] ;
    prefs1.setString(key1, mobile);
    Fluttertoast.showToast(
        msg: "Register SucessFully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    print("Register SucessFully");

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

