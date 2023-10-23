import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:gameindiamatka/utils/core/widgets/back_button.dart';

class HowToPlayScreen extends StatelessWidget {
  const HowToPlayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.85;
    return Scaffold(
      appBar: AppBar(
        title: const Text('How To Play'),
        leading: const CustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 450.h,
          decoration: BoxDecoration(
            color: AppConstant.secondaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'In India Matka game when you play the game then you have 100 numbers. 00 to 99. You play with the jodi single and crossing. Then where you play the game you can connect with that and get your money. Before playing the matka game you confirm that his good well is the market. Firstly play with small amount after that if you sure it\'s trustable then you play with big amount. In tha matka the game play with many ways. The most famous two way is this.',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Jodi game',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'You can pic satta number from 00 to 99 Like 23,34,45,52,22,00',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Crossing game',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Like 3x3 || 4x4 || 5x5 you can play like this',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Center(
                  child: Container(

                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: AppConstant.titlecolor,
                        width: 1.sp,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Crossing',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color: AppConstant.primaryColor,
                                    ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                '3x3 = 9\nnumbers',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color: AppConstant.titlecolor,
                                    ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                '4x4 = 16\nNnumbers',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color: AppConstant.titlecolor,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Crossing no.',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color: AppConstant.primaryColor,
                                    ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                '234',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color: AppConstant.titlecolor,
                                    ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                '2345',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color: AppConstant.titlecolor,
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Number',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color: AppConstant.primaryColor,
                                    ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                '22,23,24,32,33,34\n42,43,44.',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color: AppConstant.titlecolor,
                                    ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                '22,23,24,25,32,33,\n34,35,42,43,44,45,\n52,53,54,55.',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color: AppConstant.titlecolor,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Center(
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: AppConstant.backgroundColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '1Rs x 100Rs = 100Rs',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Text(
                            '10Rs x 100Rs =1000Rs',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
