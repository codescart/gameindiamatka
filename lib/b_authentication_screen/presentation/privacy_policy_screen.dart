import 'package:flutter/material.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:gameindiamatka/utils/core/widgets/back_button.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('TERMS & CONDITIONS'),
        leading: const CustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppConstant.secondaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: 12,),
                    Text("Terms & Conditions",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(height: 20,),
                    Text ("By registering on 100xbet. you are agreeing to our terms of service and are abide by it"),
                    Text("100xbet Gaming may be illegal in your country. You yourself are responsible for any legal issues that may arise."),
                    Text("confirm that you do not work in any 100xbet officer or is affiliated by one."),
                    Text("Don't create multiple accounts, enter correct account details.money once transferred cannot be refunded."),
                    Text("Do not cheat. Do not manipulate the system. we reserve the right to suspend any account without any prior notification."),
                    Text("Purchase of lottery using this application is strictly prohibited in the states where lottery is banned. By registering on 100xbet. You confirm that you have read about responsible gambling on our application."),
                    Text ("You must be above 18 years to play online 100xbet game.Play at your own risk."),
                    Text ("In 100xbet, you are playing on your own free will, if you lose, then after that you can not accuse the company of any kind, you are responsible for it")
                  ],
                ),
              ),

      ),
          ],
        ),
    ));
  }
}
