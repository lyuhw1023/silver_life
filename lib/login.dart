import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silver_life/home_page.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  Future<Null> getSharedPrefs() async {
    await SharedPreferences.getInstance();
  }

  late SingleValueDropDownController cnt = SingleValueDropDownController();
  @override
  void initState() {
    cnt = SingleValueDropDownController();
    super.initState();
    getSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      body: Center(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: DropdownButtonHideUnderline(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/silverlife_logo.png',
                    width: 270.w,
                    height: 75.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: DropDownTextField(
                      textFieldDecoration: const InputDecoration(
                        labelText: "실버타운을 선택하세요",
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                      controller: cnt,
                      clearIconProperty:
                          IconProperty(color: Color.fromRGBO(132, 118, 178, 1)),
                      searchDecoration:
                          const InputDecoration(hintText: "실버타운을 선택하세요"),
                      validator: (value) {
                        if (value == null) {
                          return "실버타운을 다시 선택해주세요";
                        } else {
                          return null;
                        }
                      },
                      dropDownItemCount: 6,
                      dropDownList: const [
                        DropDownValueModel(name: '서울시니어스', value: "value1"),
                        DropDownValueModel(
                            name: '실버캐슬요양타운',
                            value: "value2",
                            toolTipMsg:
                                "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                        DropDownValueModel(name: '글로리아 실버타운', value: "value3"),
                        DropDownValueModel(
                            name: '은혜실버타운',
                            value: "value4",
                            toolTipMsg:
                                "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                        DropDownValueModel(name: '마리스텔라', value: "value5"),
                        DropDownValueModel(name: '효누림실버타운', value: "value6"),
                      ],
                      onChanged: (val) async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setString('town', val.name);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Form(
                    child: Theme(
                      data: ThemeData(
                          //primaryColor: Colors.grey,
                          inputDecorationTheme: const InputDecorationTheme(
                              labelStyle: TextStyle(
                                  color: Colors.teal, fontSize: 15.0))),
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Builder(builder: (context) {
                            return Column(
                              children: [
                                TextField(
                                  controller:
                                      controller, //우항에 있는 controller에 비밀번호 값이 저장됨
                                  onChanged: (val) async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('mName', val);
                                  },
                                  autofocus: true,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    labelText: '보호자분 성함을 입력하세요',
                                    labelStyle: TextStyle(color: Colors.grey),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextField(
                                  controller:
                                      controller2, //우항에 있는 controller2에 이메일값이 저장됨
                                  onChanged: (val) async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('pName', val);
                                  },
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    labelText: '부모님 성함을 입력하세요',
                                    labelStyle: TextStyle(color: Colors.grey),
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextField(
                                  controller:
                                      controller3, //우항에 있는 controller2에 이메일값이 저장됨
                                  onChanged: (val) async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setString('pBirth', val);
                                  },
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    labelText: '부모님 생년월일을 입력하세요',
                                    hintText: 'ex) 20010417',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                                const SizedBox(
                                  height: 40.0,
                                ),
                                ButtonTheme(
                                    minWidth: 100.0,
                                    height: 50.0,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (controller.text == '이유미' &&
                                            controller2.text == '김복순' &&
                                            controller3.text == '19400731') {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage(
                                                        analytics: analytics,
                                                        observer: observer,
                                                      )));
                                        } else if (controller.text != '이경민') {
                                          showSnackBar(context,
                                              const Text('보호자분 성함을 다시 입력해주세요'));
                                        } else if (controller2.text != '안봉근') {
                                          showSnackBar(context,
                                              const Text('부모님 성함을 다시 입력해주세요'));
                                        } else if (controller3.text !=
                                            '20010417') {
                                          showSnackBar(
                                              context,
                                              const Text(
                                                  '부모님 생년월일을 다시 입력해주세요'));
                                        } else {
                                          showSnackBar(
                                              context,
                                              const Text(
                                                  'Check your info again'));
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xff4A80F0)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                          size: 30.w,
                                        ),
                                      ),
                                    ))
                              ],
                            );
                          })),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, Text text) {
  final snackBar = SnackBar(
    content: text,
    backgroundColor: const Color.fromARGB(255, 112, 48, 48),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
