import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_tawk/flutter_tawk.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
class ChatScreen extends StatefulWidget {
   ChatScreen({Key? key}) : super(key: key);
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppConstant.secondaryColor,
      appBar: AppBar(
        title: const Text('India Matka'),
        backgroundColor:AppConstant.backgroundColor,
        elevation: 0,
      ),
      body: Tawk(
        directChatLink: 'https://tawk.to/chat/64e306a6cc26a871b03069c4/1h8bd3usd',
        visitor: TawkVisitor(
          name: map == null?
          'Your Name' : map['name'].toString(),
          email: map == null?
          'Your Email' : map['email'].toString(),
        ),
        onLoad: () {
          print('Hello India Matka user!');
        },
        onLinkTap: (String url) {
          print(url);
        },
        placeholder: const Center(
          child: Text('Loading....'),
        ),
      ),
    );
  }
  void initState() {
    leader();
    // TODO: implement initState
    super.initState();
  }
  var map;
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
}


