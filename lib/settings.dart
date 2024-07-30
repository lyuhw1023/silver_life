import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

import 'discover_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String fontSizeLabel = '';
  bool Dark = false;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FontSizeProvider()),
        ChangeNotifierProvider(create: (_) => UiProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          return Dark
              ? Scaffold(
                  backgroundColor: Colors.black,
                  appBar: AppBar(
                    backgroundColor: Colors.black,
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                          const Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),
                  body: SafeArea(
                    child: Stack(
                      children: [
                        SettingsList(
                          lightTheme: const SettingsThemeData(
                            settingsListBackground: Colors.black,
                            settingsSectionBackground:
                                Color.fromARGB(255, 106, 106, 106),
                          ),
                          sections: [
                            SettingsSection(
                              title: const Text(
                                '공통',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              tiles: <SettingsTile>[
                                SettingsTile.navigation(
                                  leading: const Icon(Icons.language),
                                  title: Text(
                                    '언어',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            (Provider.of<FontSizeProvider>(
                                                    context,
                                                    listen: false)
                                                .fontSize)),
                                  ),
                                  value: Text(
                                    '한국어',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            (Provider.of<FontSizeProvider>(
                                                    context,
                                                    listen: false)
                                                .fontSize)),
                                  ),
                                  onPressed: ((context) {}),
                                ),
                                SettingsTile.switchTile(
                                  title: Text(
                                    '다크모드',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            (Provider.of<FontSizeProvider>(
                                                    context,
                                                    listen: false)
                                                .fontSize)),
                                  ),
                                  initialValue: Dark,
                                  onToggle: (value) {
                                    setState(() {
                                      Dark = !Dark;
                                    });
                                  },
                                  leading: const Icon(Icons.vibration),
                                ),
                                SettingsTile.navigation(
                                  leading: const Icon(Icons.text_fields),
                                  title: Text(
                                    '폰트 크기',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            (Provider.of<FontSizeProvider>(
                                                    context,
                                                    listen: false)
                                                .fontSize)),
                                  ),
                                  value: Consumer<FontSizeProvider>(
                                    builder:
                                        (context, fontSizeProvider, child) {
                                      return Text(
                                        Provider.of<FontSizeProvider>(context,
                                                listen: false)
                                            .fontlabel,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                (Provider.of<FontSizeProvider>(
                                                        context,
                                                        listen: false)
                                                    .fontSize)),
                                      );
                                    },
                                  ),
                                  onPressed: (context) {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext builder) {
                                        return SizedBox(
                                          height: 200,
                                          child: CupertinoPicker(
                                            itemExtent: 40,
                                            onSelectedItemChanged: (value) {
                                              setState(() {
                                                switch (value) {
                                                  case 0:
                                                    Provider.of<FontSizeProvider>(
                                                            context,
                                                            listen: false)
                                                        .setSmall();
                                                    Provider.of<FontSizeProvider>(
                                                            context,
                                                            listen: false)
                                                        .fontlabel = '작게';
                                                    break;
                                                  case 1:
                                                    Provider.of<FontSizeProvider>(
                                                            context,
                                                            listen: false)
                                                        .setMedium();
                                                    Provider.of<FontSizeProvider>(
                                                            context,
                                                            listen: false)
                                                        .fontlabel = '보통';
                                                    break;
                                                  case 2:
                                                    Provider.of<FontSizeProvider>(
                                                            context,
                                                            listen: false)
                                                        .setLarge();
                                                    Provider.of<FontSizeProvider>(
                                                            context,
                                                            listen: false)
                                                        .fontlabel = '크게';
                                                    break;
                                                }
                                              });
                                            },
                                            children: const <Widget>[
                                              Center(
                                                child: Text('작게'),
                                              ),
                                              Center(
                                                child: Text('보통'),
                                              ),
                                              Center(
                                                child: Text(
                                                  '크게',
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                            SettingsSection(
                              title: const Text('계정'),
                              tiles: <SettingsTile>[
                                SettingsTile.navigation(
                                  leading: const Icon(Icons.logout),
                                  title: Text(
                                    '로그아웃',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            (Provider.of<FontSizeProvider>(
                                                    context,
                                                    listen: false)
                                                .fontSize)),
                                  ),
                                  onPressed: ((context) {}),
                                ),
                              ],
                            ),
                            SettingsSection(
                              title: const Text('기타'),
                              tiles: <SettingsTile>[
                                SettingsTile.navigation(
                                  leading: const Icon(Icons.star),
                                  title: const Text(
                                    '앱 평가하기',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: ((context) {}),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
              : Scaffold(
                  backgroundColor: const Color(0xfff8f9fa),
                  appBar: AppBar(
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  body: SafeArea(
                    child: Stack(
                      children: [
                        SettingsList(
                          lightTheme: const SettingsThemeData(
                            settingsListBackground: Color(0xfff8f9fa),
                          ),
                          sections: [
                            SettingsSection(
                              title: const Text(
                                '공통',
                              ),
                              tiles: <SettingsTile>[
                                SettingsTile.navigation(
                                  leading: const Icon(Icons.language),
                                  title: Text(
                                    '언어',
                                    style: TextStyle(
                                        fontSize:
                                            (Provider.of<FontSizeProvider>(
                                                    context,
                                                    listen: false)
                                                .fontSize)),
                                  ),
                                  value: Text(
                                    '한국어',
                                    style: TextStyle(
                                        fontSize:
                                            (Provider.of<FontSizeProvider>(
                                                    context,
                                                    listen: false)
                                                .fontSize)),
                                  ),
                                  onPressed: ((context) {}),
                                ),
                                SettingsTile.switchTile(
                                  title: Text(
                                    '다크모드',
                                    style: TextStyle(
                                        fontSize:
                                            (Provider.of<FontSizeProvider>(
                                                    context,
                                                    listen: false)
                                                .fontSize)),
                                  ),
                                  initialValue: Dark,
                                  onToggle: (value) {
                                    setState(() {
                                      Dark = !Dark;
                                    });
                                  },
                                  leading: const Icon(Icons.vibration),
                                ),
                                SettingsTile.navigation(
                                  leading: const Icon(Icons.text_fields),
                                  title: Text(
                                    '폰트 크기',
                                    style: TextStyle(
                                        fontSize:
                                            (Provider.of<FontSizeProvider>(
                                                    context,
                                                    listen: false)
                                                .fontSize)),
                                  ),
                                  value: Consumer<FontSizeProvider>(
                                    builder:
                                        (context, fontSizeProvider, child) {
                                      return Text(
                                        Provider.of<FontSizeProvider>(context,
                                                listen: false)
                                            .fontlabel,
                                        style: TextStyle(
                                            fontSize:
                                                (Provider.of<FontSizeProvider>(
                                                        context,
                                                        listen: false)
                                                    .fontSize)),
                                      );
                                    },
                                  ),
                                  onPressed: (context) {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext builder) {
                                        return SizedBox(
                                          height: 200,
                                          child: CupertinoPicker(
                                            itemExtent: 40,
                                            onSelectedItemChanged: (value) {
                                              setState(() {
                                                switch (value) {
                                                  case 0:
                                                    Provider.of<FontSizeProvider>(
                                                            context,
                                                            listen: false)
                                                        .setSmall();
                                                    Provider.of<FontSizeProvider>(
                                                            context,
                                                            listen: false)
                                                        .fontlabel = '작게';
                                                    break;
                                                  case 1:
                                                    Provider.of<FontSizeProvider>(
                                                            context,
                                                            listen: false)
                                                        .setMedium();
                                                    Provider.of<FontSizeProvider>(
                                                            context,
                                                            listen: false)
                                                        .fontlabel = '보통';
                                                    break;
                                                  case 2:
                                                    Provider.of<FontSizeProvider>(
                                                            context,
                                                            listen: false)
                                                        .setLarge();
                                                    Provider.of<FontSizeProvider>(
                                                            context,
                                                            listen: false)
                                                        .fontlabel = '크게';
                                                    break;
                                                }
                                              });
                                            },
                                            children: const <Widget>[
                                              Center(
                                                child: Text('작게'),
                                              ),
                                              Center(
                                                child: Text('보통'),
                                              ),
                                              Center(
                                                child: Text(
                                                  '크게',
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                            SettingsSection(
                              title: const Text('계정'),
                              tiles: <SettingsTile>[
                                SettingsTile.navigation(
                                  leading: const Icon(Icons.logout),
                                  title: Text(
                                    '로그아웃',
                                    style: TextStyle(
                                        fontSize:
                                            (Provider.of<FontSizeProvider>(
                                                    context,
                                                    listen: false)
                                                .fontSize)),
                                  ),
                                  onPressed: ((context) {}),
                                ),
                              ],
                            ),
                            SettingsSection(
                              title: const Text('기타'),
                              tiles: <SettingsTile>[
                                SettingsTile.navigation(
                                  leading: const Icon(Icons.star),
                                  title: const Text('앱 평가하기'),
                                  onPressed: ((context) {}),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ));
        },
      ),
    );
  }
}

void onBackIconTapped() {
  Get.back();
}

class UiProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  final darkTheme = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    primaryColorDark: Colors.black,
  );
  final lightTheme = ThemeData(
      primaryColor: const Color(0xfff8f9fa),
      brightness: Brightness.light,
      primaryColorDark: const Color(0xfff8f9fa));

  changeTheme() {
    _isDark = !isDark;
    notifyListeners();
  }
}
