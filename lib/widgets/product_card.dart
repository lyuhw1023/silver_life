import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductCard extends StatelessWidget {
  final String? name;
  final String? price;
  final String? url;
  final String? image;
  const ProductCard({
    Key? key,
    this.name,
    this.price,
    this.url,
    this.image,
  }) : super(key: key);

  _launchURL() async {
    final Uri url = Uri.parse(this.url!);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              image!,
              width: 150.w,
              height: 150.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            name!,
            style: TextStyle(
              fontSize: 13.w,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            price!,
            style: TextStyle(
              fontSize: 15.w,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
