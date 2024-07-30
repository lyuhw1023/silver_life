import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:silver_life/program_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'class/Program2.dart';

class ProgramListPage extends StatefulWidget {
  const ProgramListPage({Key? key}) : super(key: key);

  @override
  _ProgramListPageState createState() => _ProgramListPageState();
}

class _ProgramListPageState extends State<ProgramListPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Program>> _fromFirestore_PROGRAM() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("program").orderBy('date').get();

    List<Program> result =
        snapshot.docs.map((e) => Program.fromJson(e.data())).toList();
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
              children: [
                SizedBox(
                  height: 80.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28.w),
                  child: Text(
                    "7월 5주차 프로그램",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 28.h),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: FutureBuilder(
                    future: _fromFirestore_PROGRAM(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 19.w,
                                  mainAxisExtent: 180.w,
                                  mainAxisSpacing: 19.w),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            // var program = snapshot.data![index];
                            return ProgramListCard(
                              imageUrl: snapshot.data![index].photo,
                              date: snapshot.data![index].date,
                              title1: snapshot.data![index].program1,
                              time1: snapshot.data![index].program1_time,
                              subtitle1: snapshot.data![index].program1_desc,
                              title2: snapshot.data![index].program2,
                              time2: snapshot.data![index].program2_time,
                              subtitle2: snapshot.data![index].program2_desc,
                            );
                          },
                        );
                      }
                      return Container();
                    }),
                  ),
                )),
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

class ProgramListCard extends StatelessWidget {
  final String? title1;
  final String? time1;
  final String? subtitle1;
  final String? title2;
  final String? time2;
  final String? subtitle2;
  final String? imageUrl;
  final String? date;
  final Function()? onTap;
  const ProgramListCard(
      {Key? key,
      this.title1,
      this.time1,
      this.subtitle1,
      this.title2,
      this.time2,
      this.subtitle2,
      this.imageUrl,
      this.date,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProgramPage(
              title1: title1,
              subtitle1: subtitle1,
              time1: time1,
              date: date,
              title2: title2,
              subtitle2: subtitle2,
              time2: time2,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xfffcfcfc),
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
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      date ?? '',
                      style: TextStyle(
                        fontSize: 15.w,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
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
