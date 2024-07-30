import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:silver_life/photo_page.dart';

class PhotoListPage extends StatefulWidget {
  @override
  _PhotoListPageState createState() => _PhotoListPageState();
}

class _PhotoListPageState extends State<PhotoListPage> {
  bool? isHeartIconTapped = false;

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
                SizedBox(
                  height: 80.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28.w),
                  child: Hero(
                    tag: "PhotoList",
                    child: Material(
                      color: Colors.transparent,
                      child: Text("7월 5주차 사진",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.w,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(height: 28.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 19.w,
                        mainAxisExtent: 180.w,
                        mainAxisSpacing: 19.w),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      PhotoListCard(
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
                        title: "7월 22일 (월)",
                        imageUrl: "http://devdory.com/old/photo/1.jpg",
                      ),
                      PhotoListCard(
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
                        title: "7월 23일 (화)",
                        imageUrl: "http://devdory.com/old/photo/5.jpg",
                      ),
                      PhotoListCard(
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
                        title: "7월 24일 (수)",
                        imageUrl: "http://devdory.com/old/photo/9.jpg",
                      ),
                      PhotoListCard(
                        onTap: () {
                          Get.to(
                            () => PhotoPage(
                              image_url: [
                                'http://devdory.com/old/photo/13.jpg',
                                'http://devdory.com/old/photo/14.jpg',
                                'http://devdory.com/old/photo/15.jpg',
                                'http://devdory.com/old/photo/16.jpg',
                              ],
                              title: "7월 225일 (목)",
                            ),
                          );
                        },
                        title: "7월 25일 (목)",
                        imageUrl: "http://devdory.com/old/photo/13.jpg",
                      ),
                      PhotoListCard(
                        onTap: () {
                          Get.to(
                            () => PhotoPage(
                              image_url: [
                                'http://devdory.com/old/photo/17.jpg',
                                'http://devdory.com/old/photo/18.jpg',
                                'http://devdory.com/old/photo/19.jpg',
                                'http://devdory.com/old/photo/20.jpg',
                              ],
                              title: "7월 26일 (금)",
                            ),
                          );
                        },
                        title: "7월 26일 (금)",
                        imageUrl: "http://devdory.com/old/photo/17.jpg",
                      ),
                      PhotoListCard(
                        onTap: () {
                          Get.to(
                            () => PhotoPage(
                              image_url: [
                                'http://devdory.com/old/photo/21.jpg',
                                'http://devdory.com/old/photo/22.jpg',
                                'http://devdory.com/old/photo/23.jpg',
                                'http://devdory.com/old/photo/24.jpg',
                              ],
                              title: "7월 27일 (토)",
                            ),
                          );
                        },
                        title: "7월 27일 (토)",
                        imageUrl: "http://devdory.com/old/photo/21.jpg",
                      ),
                    ],
                  ),
                )
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

class PhotoListCard extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final Function()? onTap;
  const PhotoListCard({Key? key, this.title, this.imageUrl, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(66, 198, 198, 198),
            offset: Offset(0, 5),
            blurRadius: 10.0,
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: onTap ?? () {},
        child: Ink(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                child: Image.network(
                  imageUrl ?? 'https://via.placeholder.com/150',
                  height: 133.w,
                  width: 150.w,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  title ?? '',
                  style: TextStyle(
                    fontSize: 15.w,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
