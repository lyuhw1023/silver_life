import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:silver_life/MealPage.dart';
import 'package:silver_life/chat_page.dart';
import 'package:silver_life/class/Product.dart';
import 'package:silver_life/notice_detail.dart';
import 'package:silver_life/notice_more.dart';
import 'package:silver_life/photo_list_page.dart';
import 'package:silver_life/photo_page.dart';
import 'package:silver_life/program_list_page.dart';
import 'package:silver_life/program_page.dart';
import 'package:silver_life/settings.dart';
import 'package:silver_life/widgets/discover_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:silver_life/widgets/product_card.dart';

import 'class/Meal.dart';
import 'class/Notice.dart';
import 'class/Program2.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Meal>> _fromFirestore_MEAL() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("meal").orderBy('type').get();

    List<Meal> result =
        snapshot.docs.map((e) => Meal.fromJson(e.data())).toList();
    return result;
  }

  Future<List<Program>> _fromFirestore_PROGRAM() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("program").orderBy('date').get();

    List<Program> result =
        snapshot.docs.map((e) => Program.fromJson(e.data())).toList();
    return result;
  }

  Future<List<Notice>> _fromFirestore() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
        .collection("notice")
        .limit(4)
        .orderBy('id', descending: true)
        .get();

    List<Notice> result =
        snapshot.docs.map((e) => Notice.fromJson(e.data())).toList();
    return result;
  }

  Future<List<Product>> _fromFirestore_PRODUCT() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("product").orderBy('id').get();

    List<Product> result =
        snapshot.docs.map((e) => Product.fromJson(e.data())).toList();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fa),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 28.w,
                right: 18.w,
                top: 36.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/silverlife_logo.png',
                    width: 180.w,
                    height: 50.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SettingPage(),
                          transition: Transition.rightToLeft);
                    },
                    child: SizedBox(
                      height: 35.w,
                      width: 35.w,
                      child: const Center(
                        child: Icon(Icons.settings),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.restaurant,
                        size: 20.w,
                        color: Color(0xff4A80F0),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "식단",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w800,
                          fontSize: 24.w,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => MealPage(),
                      );
                    },
                    child: Text(
                      "전체보기",
                      style: TextStyle(
                          color: Color(0xff4A80F0),
                          fontWeight: FontWeight.w500,
                          fontSize: 14.w),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 250.w,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 28.w),
                  FutureBuilder(
                      future: _fromFirestore_MEAL(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          return Row(children: [
                            DiscoverCard(
                              title: "아침",
                              subtitle:
                                  "${snapshot.data![0].menu1.split(",")[0]}\n${snapshot.data![0].menu2.split(",")[0]}\n${snapshot.data![0].menu3.split(",")[0]}\n${snapshot.data![0].menu4.split(",")[0]}\n${snapshot.data![0].menu5.split(",")[0]}\n${snapshot.data![0].menu6.split(",")[0]}",
                              gradientStartColor: Color(0xffffffff),
                              gradientEndColor: Color(0xffffffff),
                            ),
                            SizedBox(width: 20.w),
                            DiscoverCard(
                              title: "점심",
                              subtitle:
                                  "${snapshot.data![1].menu1.split(",")[0]}\n${snapshot.data![1].menu2.split(",")[0]}\n${snapshot.data![1].menu3.split(",")[0]}\n${snapshot.data![1].menu4.split(",")[0]}\n${snapshot.data![1].menu5.split(",")[0]}\n${snapshot.data![1].menu6.split(",")[0]}",
                              gradientStartColor: Color(0xffffffff),
                              gradientEndColor: Color(0xffffffff),
                            ),
                            SizedBox(width: 20.w),
                            DiscoverCard(
                              title: "저녁",
                              subtitle:
                                  "${snapshot.data![2].menu1.split(",")[0]}\n${snapshot.data![2].menu2.split(",")[0]}\n${snapshot.data![2].menu3.split(",")[0]}\n${snapshot.data![2].menu4.split(",")[0]}\n${snapshot.data![2].menu5.split(",")[0]}\n${snapshot.data![2].menu6.split(",")[0]}",
                              gradientStartColor: Color(0xffffffff),
                              gradientEndColor: Color(0xffffffff),
                            ),
                          ]);
                        } else {
                          return Container();
                        }
                      })),
                  SizedBox(width: 28.w),
                ],
              ),
            ),
            SizedBox(height: 28.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.palette,
                        size: 20.w,
                        color: Color(0xff4A80F0),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "프로그램",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w800,
                          fontSize: 24.w,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ProgramListPage());
                    },
                    child: Text(
                      "전체보기",
                      style: TextStyle(
                          color: Color(0xff4A80F0),
                          fontWeight: FontWeight.w500,
                          fontSize: 14.w),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            FutureBuilder(
                future: _fromFirestore_PROGRAM(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => ProgramPage(
                                date: snapshot.data![2].date,
                                title1: snapshot.data![2].program1,
                                time1: snapshot.data![2].program1_time,
                                subtitle1: snapshot.data![2].program1_desc,
                                title2: snapshot.data![2].program2,
                                time2: snapshot.data![2].program2_time,
                                subtitle2: snapshot.data![2].program2_desc,
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 15.h),
                              Text(
                                "오늘의 프로그램",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.w,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                snapshot.data![2].program1,
                                style: TextStyle(
                                  fontSize: 16.w,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                snapshot.data![2].program2,
                                style: TextStyle(
                                  fontSize: 16.w,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("2024.07.31"),
                                  SizedBox(width: 20.w)
                                ],
                              ),
                              SizedBox(height: 10.h),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                })),
            SizedBox(height: 28.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.photo_library,
                        size: 20.w,
                        color: Color(0xff4A80F0),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "사진첩",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w800,
                          fontSize: 24.w,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: onSeeAllTapped,
                    child: Text(
                      "전체보기",
                      style: TextStyle(
                          color: Color(0xff4A80F0),
                          fontWeight: FontWeight.w500,
                          fontSize: 14.w),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 150.w,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 28.w),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => PhotoPage(
                          image_url: [
                            'http://devdory.com/old/photo/1.jpg',
                            'http://devdory.com/old/photo/2.jpg',
                            'http://devdory.com/old/photo/3.jpg',
                            'http://devdory.com/old/photo/4.jpg',
                          ],
                          title: "7월 22일 (월)",
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        "http://devdory.com/old/photo/1.jpg",
                        width: 150.w,
                        height: 150.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 18.w),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => PhotoPage(
                          image_url: [
                            'http://devdory.com/old/photo/5.jpg',
                            'http://devdory.com/old/photo/6.jpg',
                            'http://devdory.com/old/photo/7.jpg',
                            'http://devdory.com/old/photo/8.jpg',
                          ],
                          title: "7월 23일 (화)",
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        "http://devdory.com/old/photo/5.jpg",
                        width: 150.w,
                        height: 150.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 28.w),
                ],
              ),
            ),
            SizedBox(height: 18.w),
            SizedBox(
              height: 150.w,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 28.w),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => PhotoPage(
                          image_url: [
                            'http://devdory.com/old/photo/9.jpg',
                            'http://devdory.com/old/photo/10.jpg',
                            'http://devdory.com/old/photo/11.jpg',
                            'http://devdory.com/old/photo/12.jpg',
                          ],
                          title: "7월 24일 (수)",
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        "http://devdory.com/old/photo/9.jpg",
                        width: 150.w,
                        height: 150.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 18.w),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => PhotoPage(
                          image_url: [
                            'http://devdory.com/old/photo/13.jpg',
                            'http://devdory.com/old/photo/14.jpg',
                            'http://devdory.com/old/photo/15.jpg',
                            'http://devdory.com/old/photo/16.jpg',
                          ],
                          title: "7월 25일 (목)",
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        "http://devdory.com/old/photo/13.jpg",
                        width: 150.w,
                        height: 150.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 28.w),
                ],
              ),
            ),
            SizedBox(height: 28.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.forum,
                        size: 20.w,
                        color: Color(0xff4A80F0),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "공지사항",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w800,
                          fontSize: 24.w,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => NoticeMore(),
                          transition: Transition.rightToLeft);
                    },
                    child: Text(
                      "전체보기",
                      style: TextStyle(
                          color: Color(0xff4A80F0),
                          fontWeight: FontWeight.w500,
                          fontSize: 14.w),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(66, 198, 198, 198),
                      offset: Offset(0, 5),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),
                      FutureBuilder(
                        future: _fromFirestore(),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => NoticeDetail(
                                        title: snapshot.data![0].title,
                                        description:
                                            snapshot.data![0].description,
                                        time: snapshot.data![0].time));
                                  },
                                  child: Text(
                                    snapshot.data![0].title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.w,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15.h),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => NoticeDetail(
                                        title: snapshot.data![1].title,
                                        description:
                                            snapshot.data![1].description,
                                        time: snapshot.data![1].time));
                                  },
                                  child: Text(
                                    snapshot.data![1].title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.w,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15.h),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => NoticeDetail(
                                        title: snapshot.data![2].title,
                                        description:
                                            snapshot.data![2].description,
                                        time: snapshot.data![2].time));
                                  },
                                  child: Text(
                                    snapshot.data![2].title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.w,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15.h),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => NoticeDetail(
                                        title: snapshot.data![3].title,
                                        description:
                                            snapshot.data![3].description,
                                        time: snapshot.data![3].time));
                                  },
                                  child: Text(
                                    snapshot.data![3].title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.w,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.h),
                              ],
                            );
                          }
                          return Container();
                        }),
                      ),
                      SizedBox(height: 5.h),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.shopping_bag,
                        size: 20.w,
                        color: Color(0xff4A80F0),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "추천 상품",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w800,
                          fontSize: 24.w,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 1.w),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 200.h,
              child: FutureBuilder(
                future: _fromFirestore_PRODUCT(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(width: 28.w),
                        ProductCard(
                          name: snapshot.data![0].name,
                          price: snapshot.data![0].price,
                          url: snapshot.data![0].url,
                          image: snapshot.data![0].image,
                        ),
                        SizedBox(width: 18.w),
                        ProductCard(
                          name: snapshot.data![1].name,
                          price: snapshot.data![1].price,
                          url: snapshot.data![1].url,
                          image: snapshot.data![1].image,
                        ),
                        SizedBox(width: 18.w),
                        ProductCard(
                          name: snapshot.data![2].name,
                          price: snapshot.data![2].price,
                          url: snapshot.data![2].url,
                          image: snapshot.data![2].image,
                        ),
                        SizedBox(width: 18.w),
                        ProductCard(
                          name: snapshot.data![3].name,
                          price: snapshot.data![3].price,
                          url: snapshot.data![3].url,
                          image: snapshot.data![3].image,
                        ),
                        SizedBox(width: 28.w),
                      ],
                    );
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        child: Icon(
          Icons.chat,
        ),
        onPressed: () {
          Get.to(() => ChatPage(), transition: Transition.rightToLeft);
        },
      ),
    );
  }

  void onSeeAllTapped() {
    Get.to(() => PhotoListPage(), transition: Transition.rightToLeft);
  }

  void onDepressionHealingTapped() {}

  void onProgramTapped() {
    Get.to(() => ProgramPage(), transition: Transition.rightToLeft);
  }

  void onProgramListTapped() {
    Get.to(() => ProgramListPage(), transition: Transition.rightToLeft);
  }
}

class FontSizeProvider with ChangeNotifier {
  double _fontSize = 15.w;
  String fontlabel = '';
  double get fontSize => _fontSize;

  void setSmall() {
    _fontSize = 11.w;
    notifyListeners();
  }

  void setMedium() {
    _fontSize = 15.w;
    notifyListeners();
  }

  void setLarge() {
    _fontSize = 19.w;
    notifyListeners();
  }
}
