import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_text_styles.dart';

class TapSwitch extends StatelessWidget {
  TapSwitch({
    Key? key,
    this.onTap,
    required this.isSelected,
    required this.label,
    this.isEndSmallerRadius = false,
    this.width,
    this.height,
    this.isLoading = false,
    required this.color,
  }) : super(key: key);

  final void Function()? onTap;
  final double? width;
  final double? height;
  final bool isSelected;
  final bool isEndSmallerRadius;
  final String label;
  final bool isLoading;
  final Color color;

  final BorderRadiusDirectional topEndSmallerRadius = BorderRadiusDirectional.only(
    topStart: Radius.circular(18.r),
    topEnd: Radius.circular(18.r),
    bottomStart: Radius.circular(18.r),
    bottomEnd: Radius.circular(18.r),
  );

  final BorderRadiusDirectional topStartSmallerRadius = BorderRadiusDirectional.only(
    topStart: Radius.circular(18.r),
    topEnd: Radius.circular(18.r),
    bottomStart: Radius.circular(18.r),
    bottomEnd: Radius.circular(18.r),
  );

  final BoxDecoration boxDecoration = BoxDecoration(
    border: Border.all(
      color: Colors.transparent,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: width ?? 180.w,
        height: height ?? 50.h,
        decoration: boxDecoration.copyWith(
            borderRadius: isEndSmallerRadius ? topEndSmallerRadius : topStartSmallerRadius, color: color),
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
        alignment: AlignmentDirectional.center,
        child: Text(
          label,
          style: KAppTextStyle.boldTextStyle.copyWith(color: Colors.white , fontSize:18.sp ),
        ),
      ),
    );
  }
}
