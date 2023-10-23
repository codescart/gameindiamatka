import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:gameindiamatka/utils/core/widgets/back_button.dart';

class CompanyTrustProfileScreen extends StatelessWidget {
  const CompanyTrustProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company trust profile'),
        leading: const CustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 160.h,
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
                  'COMPANY PROFILE',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  '> The company will keep all your information safe.',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 8.sp,
                      ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '> You can join the company without thinking, the company will not do any fraudulent work with you.',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 8.sp,
                      ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '> The company will respect your work and stay connected with you as a true friend.',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 8.sp,
                      ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '> The work of the company has been going on for Many years and many customers like you are associated with the India Matka. ',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 8.sp,
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
