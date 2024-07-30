import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:silver_life/icons.dart';
import 'package:silver_life/widgets/svg_asset.dart';

class DiscoverProgramCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? additionaltitle;
  final String? image;
  final Color? gradientStartColor;
  final Color? gradientEndColor;
  final double? height;
  final double? width;
  final Widget? vectorBottom;
  final Widget? vectorTop;
  final Function? onTap;
  final String? tag;
  const DiscoverProgramCard(
      {Key? key,
      this.title,
      this.subtitle,
      this.additionaltitle,
      this.image,
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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTap!(),
        borderRadius: BorderRadius.circular(5),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                offset: Offset(0, 10),
                blurRadius: 5,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Container(
            height: 190.w,
            width: 305.w,
            child: Stack(
              children: [
                vectorBottom ??
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: SvgAsset(
                          height: 190.w,
                          width: 305.w,
                          assetName: AssetName.vectorBottom),
                    ),
                vectorTop ??
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: SvgAsset(
                          height: 190.w,
                          width: 305.w,
                          assetName: AssetName.vectorTop),
                    ),
                Padding(
                  padding: EdgeInsets.only(left: 24.w, top: 24.h, bottom: 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                  style: TextStyle(
                                      fontSize: 16.w,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.black),
                                )
                              : Container(),
                          SizedBox(height: 8.h),
                          additionaltitle != null
                              ? Text(
                                  additionaltitle!,
                                  style: TextStyle(
                                      fontSize: 15.w,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
