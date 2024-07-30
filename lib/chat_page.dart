import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

const snackBar = SnackBar(
  content: Text('등록되었습니다 !!'),
);

class _ChatPageState extends State<ChatPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final contactController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    contactController.dispose();
    super.dispose();
  }

  write() async {
    DateTime now = DateTime.now();
    DateTime date =
        DateTime(now.year, now.month, now.day, now.hour, now.minute);
    if (titleController.text != "" &&
        contentController.text != "" &&
        contactController.text != "") {
      try {
        final response = await http.post(
          //서버로 전송함
          Uri.parse(
              "http://noname.dothome.co.kr/silver/insert.php"), //php 주소 입력
          body: ({
            "title": titleController.text,
            "content": contentController.text,
            "contact": contactController.text,
            "time": date.toString().replaceAll(":00.000", ""),
          }),
        );
        response.body;
        titleController.text = "";
        contentController.text = "";
        contactController.text = "";
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } catch (e) {
        print("인터넷 오류 발생");
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('모든 정보를 입력해주세요.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(height: 66.h),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '제목',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: contentController,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '문의 내용',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: contactController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '연락처',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      write();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff4A80F0),
                      surfaceTintColor: Color(0xff4A80F0),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      '등록',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.w),
                    ),
                  )
                ],
              ),
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
                          "문의하기",
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
