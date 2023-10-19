import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_text_styles.dart';
import '../../res/colors.dart';

class EmptyPlaceHolder extends StatelessWidget {
  final String text;
  final String? subText;

  const EmptyPlaceHolder({
    Key? key,
    required this.text,
    this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          Text(
            text,
            style: KAppTextStyle.boldTextStyle.copyWith(
              fontSize: 20.sp,
              color: KAppColors.primaryColor,
            ),
          ),
          if (subText != null) ...[
            SizedBox(height: 10.h),
            Text(
              subText!,
              textAlign: TextAlign.center,
              style: KAppTextStyle.regularTextStyle.copyWith(
                color: KAppColors.color_9E9E9E,
                fontSize: 16.sp,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
