import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProgramPage extends StatelessWidget {
  const ProgramPage(
      {super.key,
      this.date,
      this.title1,
      this.time1,
      this.subtitle1,
      this.title2,
      this.time2,
      this.subtitle2});
  final String? date;
  final String? title1;
  final String? time1;
  final String? subtitle1;
  final String? title2;
  final String? time2;
  final String? subtitle2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 80.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "오전",
                        style: TextStyle(
                            color: Color(0xff515979),
                            fontWeight: FontWeight.w400,
                            fontSize: 20.w),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Divider(
                    color: Colors.black,
                    thickness: 1,
                    height: 16.h,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title1!,
                        style: TextStyle(
                            fontSize: 22.w,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        time1!,
                        style: TextStyle(
                            fontSize: 16.w,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6F89F8)),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        subtitle1!,
                        style: TextStyle(
                            fontSize: 15.w,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "오후",
                        style: TextStyle(
                            color: Color(0xff515979),
                            fontWeight: FontWeight.w400,
                            fontSize: 20.w),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Divider(
                    color: Colors.black,
                    thickness: 1,
                    height: 16.h,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title2!,
                        style: TextStyle(
                            fontSize: 22.w,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        time2!,
                        style: TextStyle(
                            fontSize: 16.w,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6F89F8)),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        subtitle2!,
                        style: TextStyle(
                            fontSize: 15.w,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                color: Color(0xFFF5F5F5),
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
                          "프로그램",
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

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(0, size.height, 30, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
