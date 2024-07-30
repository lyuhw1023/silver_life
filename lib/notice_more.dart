import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:silver_life/notice_detail.dart';

import 'class/Notice.dart';

class NoticeMore extends StatefulWidget {
  const NoticeMore({super.key});

  @override
  State<NoticeMore> createState() => _NoticeMoreState();
}

class _NoticeMoreState extends State<NoticeMore> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Notice>> _fromFirestore() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
        .collection("notice")
        .orderBy('id', descending: true)
        .get();

    List<Notice> result =
        snapshot.docs.map((e) => Notice.fromJson(e.data())).toList();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 66.h),
                Expanded(
                  child: FutureBuilder(
                    future: _fromFirestore(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(itemBuilder: (context, index) {
                          if (index < snapshot.data!.length) {
                            return notice_card(
                              title: snapshot.data![index].title,
                              description: snapshot.data![index].description,
                              time: snapshot.data![index].time,
                            );
                          } else {
                            return Container();
                          }
                        });
                      }
                      return Container();
                    }),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                color: Color(0xfff8f9fa),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 22.w, right: 22.w, top: 20.h, bottom: 10.h),
                  child: Material(
                    color: Colors.transparent,
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
                          "공지사항",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.w),
                        ),
                        Container(
                          height: 35.w,
                          width: 35.w,
                        ),
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

  void onBackIconTapped() {
    Get.back();
  }
}

class notice_card extends StatelessWidget {
  const notice_card({
    super.key,
    this.title,
    this.description,
    this.time,
  });
  final String? title;
  final String? description;
  final String? time;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() =>
            NoticeDetail(title: title, description: description, time: time));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          children: [
            Container(
              width: 350.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(66, 198, 198, 198),
                    offset: Offset(0, 5),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.w),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      time!,
                      style: TextStyle(fontSize: 11.w),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h)
          ],
        ),
      ),
    );
  }
}
