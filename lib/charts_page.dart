import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartsPage extends StatefulWidget {
  const ChartsPage({Key? key}) : super(key: key);

  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
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
                children: [
                  Text(
                    "알림",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 34.w,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    check = !check;
                  });
                },
                child: Text(
                  "전체삭제",
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            SizedBox(height: 14.h),
            check
                ? Column(
                    children: [
                      NewNotification(
                        title: "사진 등록",
                        description: "프로그램 활동 사진이 등록되었습니다.",
                        time: "3분 전",
                      ),
                      NewNotification(
                        title: "식단 알림",
                        description: "8월 1주차 식단이 등록되었습니다.",
                        time: "10분 전",
                      ),
                      OldNotification(
                        title: "프로그램 알림",
                        description: "8월 1주차 프로그램이 등록되었습니다.",
                        time: "11분 전",
                      ),
                      NewNotification(
                        title: "식단 알림",
                        description: "7월 5주차 식단이 등록되었습니다.",
                        time: "2024년 7월 29일",
                      ),
                      OldNotification(
                        title: "공지사항",
                        description: "새로운 공지사항이 등록되었습니다.",
                        time: "2024년 7월 29일",
                      ),
                      OldNotification(
                        title: "사진 등록",
                        description: "프로그램 활동 사진이 등록되었습니다.",
                        time: "2024년 7월 28일",
                      ),
                      OldNotification(
                        title: "프로그램 알림",
                        description: "7월 5주차 프로그램이 등록되었습니다.",
                        time: "2024년 7월 28일",
                      ),
                      OldNotification(
                        title: "공지사항",
                        description: "새로운 공지사항이 등록되었습니다.",
                        time: "2024년 7월 28일",
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class NewNotification extends StatelessWidget {
  final String? title;
  final String? description;
  final String? time;
  const NewNotification({
    Key? key,
    this.title,
    this.description,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        color: Color(0xFFECF3FF),
        border: BorderDirectional(
          bottom: BorderSide(
            width: 1,
            color: Color(0xFFE8EBED),
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60.w,
            child: Icon(
              Icons.circle,
              size: 10,
              color: Color(0xFF4E60FF),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: TextStyle(fontSize: 16.w),
              ),
              SizedBox(height: 2.h),
              Text(
                description!,
                style: TextStyle(fontSize: 14.w, color: Color(0xFF454C53)),
              ),
              SizedBox(height: 2.h),
              Text(
                time!,
                style: TextStyle(fontSize: 11.w, color: Color(0xFF72787F)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class OldNotification extends StatelessWidget {
  final String? title;
  final String? description;
  final String? time;
  const OldNotification({
    Key? key,
    this.title,
    this.description,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        border: BorderDirectional(
          bottom: BorderSide(
            width: 1,
            color: Color(0xFFE8EBED),
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: TextStyle(fontSize: 16.w),
              ),
              SizedBox(height: 2.h),
              Text(
                description!,
                style: TextStyle(fontSize: 14.w, color: Color(0xFF454C53)),
              ),
              SizedBox(height: 2.h),
              Text(
                time!,
                style: TextStyle(fontSize: 11.w, color: Color(0xFF72787F)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
