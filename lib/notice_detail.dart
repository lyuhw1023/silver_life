import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NoticeDetail extends StatelessWidget {
  const NoticeDetail({
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
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: 66.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title!.replaceAll('• ', ''),
                        style: TextStyle(
                            fontSize: 20.w, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        time!,
                        style: TextStyle(fontSize: 12.w),
                      ),
                    ],
                  ),
                ),
                Divider(color: Color(0xffcccccc)),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Text(
                    description!.replaceAll('\\n', '\n'),
                    style: TextStyle(fontSize: 15.w),
                  ),
                ),
                SizedBox(height: 10.h),
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
                          title!.replaceAll('• ', ''),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.w),
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
