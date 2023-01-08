import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import '../utils/app_colors.dart';
import '../utils/size_config.dart';

class CustomTabView extends StatelessWidget {
  const CustomTabView({Key? key, this.segments, required this.controller})
      : super(key: key);
  final Map<String, String>? segments;
  final ValueNotifier<String> controller;

  @override
  Widget build(BuildContext context) {
    return AdvancedSegment(
        backgroundColor: AppColors.goldenColor,
        borderRadius: BorderRadius.circular(12),
        inactiveStyle: TextStyle(
            color: Colors.white,
            fontSize: SizeConfig.defaultSize! * 1.3,
            fontWeight: FontWeight.bold,
            fontFamily: "A"),
        activeStyle: TextStyle(
            color: Colors.black,
            fontSize: SizeConfig.defaultSize! * 2.2,
            fontWeight: FontWeight.bold,
            fontFamily: "A"),
        itemPadding: EdgeInsetsDirectional.fromSTEB(
            SizeConfig.defaultSize! * 9.3,
            SizeConfig.defaultSize!,
            SizeConfig.defaultSize! * 5.3,
            SizeConfig.defaultSize!),
        controller: controller,
        segments: segments!);
  }
}
