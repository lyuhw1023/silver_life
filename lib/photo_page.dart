import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({super.key, this.image_url, this.title});
  final List<String>? image_url;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 70.h, left: 28.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          title!,
                          style: TextStyle(
                            fontSize: 25.w,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 4.h),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: image_url!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.width,
                            child: Image.network(
                              image_url![index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
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
                            "사진첩",
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
                )),
          ],
        ),
      ),
    );
  }

  void onBackIconTapped() {
    Get.back();
  }
}
