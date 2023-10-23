import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:gameindiamatka/b_authentication_screen/widgets/custom_button.dart';
import 'package:gameindiamatka/c_dashboard_screen/application/copy_referal_code.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class ShareEarnScreen extends StatefulWidget {
  const ShareEarnScreen({Key? key}) : super(key: key);

  @override
  State<ShareEarnScreen> createState() => _ShareEarnScreenState();
}

class _ShareEarnScreenState extends State<ShareEarnScreen> {
  String referalCode = 'initialData';
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Referrel Code : '+ map['mobile'].toString(),
        text: 'Join Now & Get Exiting Prizes. here is my Referrel Code : '+map['mobile'].toString(),
        linkUrl: 'https://indiamatka.app/',
        chooserTitle: 'Referrel Code : '+ referalCode.toString());
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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.85;

    return Scaffold(
      appBar: AppBar(

        leading: Icon(Icons.share),
        title: const Text('Invite & Earn'),
      ),

      body:map==null?Center(child: CircularProgressIndicator()):
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: width,
                // height: 120.h,
                decoration: BoxDecoration(
                  color: AppConstant.secondaryColor,
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Bonus',
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    color: AppConstant.subtitlecolor,
                                  ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [

                            Text(
                              map['bonus'] == ''?
                              '\u{20B9}'+'0' : '\u{20B9}'+map['bonus'].toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    fontSize: 48.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Container(
                width: width,
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppConstant.secondaryColor,
                  borderRadius: BorderRadius.circular(12.sp),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                'Your referral code',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DottedBorder(
                    color: AppConstant.primaryColor,
                    strokeWidth: 1,
                    child: SizedBox(
                      width: 250.w,
                      height: 35.h,
                      child: Center(
                        child: Text(
                          map['mobile'] == ''?
                          'your mobile number' : map['mobile'].toString(),
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.sp),
                      color: AppConstant.primaryColor,
                    ),
                    child: IconButton(
                      onPressed: () {
                        copyToClipboard(map['mobile'].toString(), context);
                      },
                      icon: const Icon(
                        Icons.copy_rounded,
                        color: AppConstant.backgroundColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Center(
              child: CustomButton(
                onTap: () async{ share();},
                text: 'SEND FRIENDS',
              ),
            ),
            SizedBox(
              height: 15.h,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '* Refer and earn Rs 50 when your friend add very first amount in their wallet.',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
