import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silver_life/icons.dart';
import 'package:silver_life/widgets/svg_asset.dart';

class DiscoverCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Color? gradientStartColor;
  final Color? gradientEndColor;
  final double? height;
  final double? width;
  final Widget? vectorBottom;
  final Widget? vectorTop;
  final Function? onTap;
  final String? tag;
  const DiscoverCard(
      {Key? key,
      this.title,
      this.subtitle,
      this.gradientStartColor,
      this.gradientEndColor,
      this.height,
      this.width,
      this.vectorBottom,
      this.vectorTop,
      this.onTap,
      this.tag})
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
        borderRadius: BorderRadius.circular(26),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          // onTap: () => onTap!(),
          borderRadius: BorderRadius.circular(26),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              gradient: LinearGradient(
                colors: [
                  gradientStartColor ?? Color(0xff441DFC),
                  gradientEndColor ?? Color(0xff4E81EB),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Container(
              width: 305.w,
              child: Stack(
                children: [
                  vectorBottom ??
                      ClipRRect(
                        borderRadius: BorderRadius.circular(26),
                        child: SvgAsset(
                            height: 176.w,
                            width: 305.w,
                            assetName: AssetName.vectorBottom),
                      ),
                  vectorTop ??
                      ClipRRect(
                        borderRadius: BorderRadius.circular(26),
                        child: SvgAsset(
                            height: 176.w,
                            width: 305.w,
                            assetName: AssetName.vectorTop),
                      ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 24.w, top: 24.h, right: 24.w, bottom: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                title!,
                                style: TextStyle(
                                    fontSize: 22.w,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            subtitle != null
                                ? Text(
                                    subtitle!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16.w,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black),
                                  )
                                : Container(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Text("2024.07.31")],
                        )
                      ],
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
