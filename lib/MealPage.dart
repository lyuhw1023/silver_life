import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dotted_line/dotted_line.dart';

import 'class/Meal.dart';

class MealPage extends StatefulWidget {
  final Color? gradientStartColor;
  final Color? gradientEndColor;
  const MealPage({
    super.key,
    this.gradientStartColor,
    this.gradientEndColor,
  });
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  _MealPageState({
    Key? key,
    this.gradientStartColor,
    this.gradientEndColor,
  }) : super();

  bool? isHeartIconTapped = false;
  final Color? gradientStartColor;
  final Color? gradientEndColor;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Meal>> _fromFirestore_MEAL() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("meal").orderBy('type').get();

    List<Meal> result =
        snapshot.docs.map((e) => Meal.fromJson(e.data())).toList();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                FutureBuilder(
                  future: _fromFirestore_MEAL(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('오류 발생: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data == null) {
                      return const Center(child: Text('데이터가 없습니다.'));
                    } else {
                      var totalBf = (int.parse(
                              snapshot.data![0].menu1.split(",")[1])) +
                          (int.parse(snapshot.data![0].menu2.split(",")[1])) +
                          (int.parse(snapshot.data![0].menu3.split(",")[1])) +
                          (int.parse(snapshot.data![0].menu4.split(",")[1])) +
                          (int.parse(snapshot.data![0].menu5.split(",")[1])) +
                          (int.parse(snapshot.data![0].menu6.split(",")[1]));
                      var totalLc = (int.parse(
                              snapshot.data![1].menu1.split(",")[1])) +
                          (int.parse(snapshot.data![1].menu2.split(",")[1])) +
                          (int.parse(snapshot.data![1].menu3.split(",")[1])) +
                          (int.parse(snapshot.data![1].menu4.split(",")[1])) +
                          (int.parse(snapshot.data![1].menu5.split(",")[1])) +
                          (int.parse(snapshot.data![1].menu6.split(",")[1]));
                      var totalDn = (int.parse(
                              snapshot.data![2].menu1.split(",")[1])) +
                          (int.parse(snapshot.data![2].menu2.split(",")[1])) +
                          (int.parse(snapshot.data![2].menu3.split(",")[1])) +
                          (int.parse(snapshot.data![2].menu4.split(",")[1])) +
                          (int.parse(snapshot.data![2].menu5.split(",")[1])) +
                          (int.parse(snapshot.data![2].menu6.split(",")[1]));
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 40.h,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Menu(
                                totalBf,
                                {
                                  snapshot.data![0].menu1.split(",")[0]:
                                      int.parse(snapshot.data![0].menu1
                                          .split(",")[1]),
                                  snapshot.data![0].menu2.split(",")[0]:
                                      int.parse(snapshot.data![0].menu2
                                          .split(",")[1]),
                                  snapshot.data![0].menu3.split(",")[0]:
                                      int.parse(snapshot.data![0].menu3
                                          .split(",")[1]),
                                  snapshot.data![0].menu4.split(",")[0]:
                                      int.parse(snapshot.data![0].menu4
                                          .split(",")[1]),
                                  snapshot.data![0].menu5.split(",")[0]:
                                      int.parse(snapshot.data![0].menu5
                                          .split(",")[1]),
                                  snapshot.data![0].menu6.split(",")[0]:
                                      int.parse(snapshot.data![0].menu6
                                          .split(",")[1]),
                                },
                                '아침'),
                            SizedBox(
                              height: 30.h,
                            ),
                            Menu(
                                totalLc,
                                {
                                  snapshot.data![1].menu1.split(",")[0]:
                                      int.parse(snapshot.data![0].menu1
                                          .split(",")[1]),
                                  snapshot.data![1].menu2.split(",")[0]:
                                      int.parse(snapshot.data![0].menu2
                                          .split(",")[1]),
                                  snapshot.data![1].menu3.split(",")[0]:
                                      int.parse(snapshot.data![0].menu3
                                          .split(",")[1]),
                                  snapshot.data![1].menu4.split(",")[0]:
                                      int.parse(snapshot.data![0].menu4
                                          .split(",")[1]),
                                  snapshot.data![1].menu5.split(",")[0]:
                                      int.parse(snapshot.data![0].menu5
                                          .split(",")[1]),
                                  snapshot.data![1].menu6.split(",")[0]:
                                      int.parse(snapshot.data![0].menu6
                                          .split(",")[1]),
                                },
                                '점심'),
                            SizedBox(
                              height: 30.h,
                            ),
                            Menu(
                                totalDn,
                                {
                                  snapshot.data![2].menu1.split(",")[0]:
                                      int.parse(snapshot.data![0].menu1
                                          .split(",")[1]),
                                  snapshot.data![2].menu2.split(",")[0]:
                                      int.parse(snapshot.data![0].menu2
                                          .split(",")[1]),
                                  snapshot.data![2].menu3.split(",")[0]:
                                      int.parse(snapshot.data![0].menu3
                                          .split(",")[1]),
                                  snapshot.data![2].menu4.split(",")[0]:
                                      int.parse(snapshot.data![0].menu4
                                          .split(",")[1]),
                                  snapshot.data![2].menu5.split(",")[0]:
                                      int.parse(snapshot.data![0].menu5
                                          .split(",")[1]),
                                  snapshot.data![2].menu6.split(",")[0]:
                                      int.parse(snapshot.data![0].menu6
                                          .split(",")[1]),
                                },
                                '저녁'),
                            SizedBox(height: 30.h),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    }
                  }),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                color: const Color(0xfff8f9fa),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 22.w,
                    right: 22.w,
                  ),
                  child: Material(
                    color: const Color(0xfff8f9fa),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(360),
                          onTap: onBackIconTapped,
                          child: Container(
                            height: 35.w,
                            width: 35.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360),
                            ),
                            child: const Center(
                              child: Icon(Icons.arrow_back_ios),
                            ),
                          ),
                        ),
                        Text(
                          '식단',
                          style: TextStyle(
                            fontSize: 25.w,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(width: 40.w),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card Menu(int total, Map<String, int> list, String time) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Colors.black,
      margin: EdgeInsets.only(left: 28.w, right: 28.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
        // height: 280.w,
        decoration: BoxDecoration(boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color.fromARGB(66, 198, 198, 198),
            blurRadius: 10.0,
            offset: Offset(0, 5),
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      fontSize: 25.w,
                    ),
                  ),
                  Text(
                    '총 $total kcal',
                    style: TextStyle(
                      fontSize: 17.w,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 17.h),
            ...list.entries.expand(
              (entry) => {
                dottedline_expand(entry.key, entry.value),
                SizedBox(
                  height: 10.h,
                )
              },
            ),
          ],
        ),
      ),
    );
  }

  Row dottedline_expand(final menu, final kcal) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          menu,
          style: TextStyle(
            fontSize: 17.w,
            color: const Color(0xff000000),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        const Expanded(
          child: DottedLine(
            dashColor: Color.fromARGB(255, 123, 123, 123),
            dashLength: 2,
            dashGapLength: 8,
            lineThickness: 2,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          '$kcal kcal',
          style: TextStyle(
            fontSize: 16.w,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  void onStartButtonPressed() {}

  void onBackIconTapped() {
    Get.back();
  }
}
