import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gameindiamatka/utils/core/app_constant.dart';
import 'package:gameindiamatka/utils/core/widgets/back_button.dart';

class ChartDetails extends StatefulWidget {
  const ChartDetails({Key? key}) : super(key: key);

  @override
  State<ChartDetails> createState() => _ChartDetailsState();
}

class _ChartDetailsState extends State<ChartDetails> {

  var name = [
  "01",
  "02",
  "03",
  "04",
  "05",
  "06",
  "07",
  "08",
  "09",
  "10",
  "11",
  "12",
  "13",
  "14",
  "15",
  "16",
  "17",
  "18",
  "19",
  "20",
  "21",
  "22",
  "23",
  "24",
  "25",
  "26",
  "27",
  "28",
    "29",
    "30",
    "31",
  ];
  var items = [
    'year',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
  ];
  var item = [
    'Months',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',

  ];


  String d4 = 'year';
  String d5 = 'Months';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        title: Text( "Chart Detail"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50, width: 110,
                    decoration: BoxDecoration(
                      color: AppConstant.secondaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButton(

                          // Initial Value
                          value: d4,

                          // Down Arrow Icon
                          icon: const Icon(
                              Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected valueet

                          onChanged: (String? newValue) {
                            setState(() {
                              d4 = newValue!;
                              final value = true;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50, width: 120,
                    decoration: BoxDecoration(
                      color: AppConstant.secondaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButton(

                          // Initial Value
                          value: d5,

                          // Down Arrow Icon
                          icon: const Icon(
                              Icons.keyboard_arrow_down),

                          // Array list of items
                          items: item.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected valueet

                          onChanged: (String? newValue) {
                            setState(() {
                              d5 = newValue!;
                              final value = true;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(

                    child:  ElevatedButton.icon(

                      onPressed: ()  {Navigator.of(context).pop();},

                      icon: Icon(
                        Icons.keyboard_arrow_left_rounded,
                        size: 20.0,
                      ),
                      label: Text('Get Detail'),
                      style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppConstant.secondaryColor),
                    ),    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.82,
              child: Padding(
  padding: const EdgeInsets.all(8.0),
  // implement GridView.builder
  child: GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 4,
  ),
  itemCount: name.length,
   itemBuilder: (BuildContext ctx, index) {
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: Container(
               decoration: BoxDecoration(
                 color: Color.fromRGBO(166, 177, 187, 1),
                    borderRadius: BorderRadius.circular(10)),
                       child: Center(child: Text(name[index])),

                       ),
                     );
                   }),
               ),
            ),
          ],
        ),
      ),
    );
  }
}

