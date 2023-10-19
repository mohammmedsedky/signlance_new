import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_text_styles.dart';
import '../res/colors.dart';


class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  final String label;
  final String icon;
  final bool isSelected;
  final Function() onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            height: 20.h,
            color: isSelected ? KAppColors.primaryColor : KAppColors.color_C3ACD0,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: isSelected
                ? KAppTextStyle.regularTextStyle.copyWith(fontSize: 13.sp)
                : KAppTextStyle.regularTextStyle.copyWith(color: KAppColors.color_C3ACD0, fontSize: 13.sp),
          ),
        ],
      ),
    );
  }
}
