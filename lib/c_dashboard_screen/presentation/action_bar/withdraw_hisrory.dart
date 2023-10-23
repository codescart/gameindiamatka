import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:gameindiamatka/utils/core/widgets/back_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WithdrawHistory extends StatefulWidget {
  const WithdrawHistory({Key? key}) : super(key: key);

  @override
  State<WithdrawHistory> createState() => _WithdrawHistoryState();
}

class _WithdrawHistoryState extends State<WithdrawHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        title: Text("Withdraw History"),
      ),
      body: FutureBuilder<List<Album>>(
          future: bow(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  print(snapshot.data!.length);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: AppConstant.secondaryColor,
                      child: ListTile(
                        title: Text('${snapshot.data![index].name}'),
                         leading: Text('\u{20B9}'+'${snapshot.data![index].amount}',
                          style: TextStyle(
                            fontSize: 30,
                          ),),
                        subtitle: Text('${snapshot.data![index].datetime}'),
                        trailing: Column(
                          children: [
                            Text('${snapshot.data![index].upi}'),
                            Text(
                              snapshot.data![index].status != '0' ?
                              'pending':'success',
                              style: TextStyle(
                                color: snapshot.data![index].status == '0' ? Colors.green: Colors.yellow,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            ):Center(child: Text("Wait For History"));
          }
      )
    );
  }
}
class Album {
  String upi;
  String amount;
  String status;
  String name;
  String datetime;

  Album(this.upi,this.amount,this.status, this.name,this.datetime);

}
Future<List<Album>> bow() async{
  final prefs = await SharedPreferences.getInstance();
  final key = 'user_id';
  final value = prefs.getString(key) ?? "0";

  final response = await http.post(
    Uri.parse(Apiconst.baseurl+'withdrawl'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "user_id":"$value"
    }),

  );
  var jsond = json.decode(response.body)["country"];
  print(jsond);
  List<Album> allround = [];
  for (var o in jsond)  {
    Album al = Album(
      o["upi"],
      o["amount"],
      o["status"],
      o["name"],
      o["datetime"],

    );

    allround.add(al);
  }
  return allround;
}
