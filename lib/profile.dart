import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    getSharedPrefs();
  }

  String town = '';
  String mName = '';
  String pName = '';
  String pBirth = '';
  String pbirthY = '';
  String pbirthM = '';
  String pbirthD = '';
  getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      town = (prefs.getString('town') ?? "");
      mName = (prefs.getString('mName') ?? "");
      pName = (prefs.getString('pName') ?? "");
      pBirth = (prefs.getString('pBirth') ?? "");
      pbirthY = pBirth.isNotEmpty ? pBirth.substring(0, 4) : '';
      pbirthM = pBirth.isNotEmpty ? pBirth.substring(4, 6) : '';
      pbirthD = pBirth.isNotEmpty ? pBirth.substring(6, 8) : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 40.h),
                  Container(
                    padding: EdgeInsets.all(2.w),
                    // height: 280.w,
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10.0.w,
                          offset: const Offset(0, 7),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/profile.jpg',
                        width: 200.w,
                        height: 200.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.w),
                  Text(
                    town,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.w),
                  buildUserInfoDisplay(mName, '보호자 성함'),
                  SizedBox(height: 20.w),
                  buildUserInfoDisplay(pName, '부모님 성함'),
                  SizedBox(height: 20.w),
                  buildUserInfoDisplay(
                      '$pbirthY년 $pbirthM월 $pbirthD일', '부모님 생년월일'),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                color: const Color(0xfff8f9fa),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 28.w,
                    right: 28.w,
                    top: 36.h,
                  ),
                  child: Material(
                    color: const Color(0xfff8f9fa),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '프로필',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 34.w,
                              fontWeight: FontWeight.bold),
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
}

Widget buildUserInfoDisplay(String getValue, String title) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 60),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 1,
        ),
        Container(
            width: 350,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(children: [
              Expanded(
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        getValue,
                        style: const TextStyle(
                            fontSize: 16, height: 1.4, color: Colors.black),
                      ))),
            ]))
      ],
    ));
