import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../config/k_app_const.dart';
import '../../localization/app_localization.dart';
import '../../../utils/app_text_styles.dart';
import '../../res/colors.dart';


class CountryPickerTextField extends StatelessWidget {
  final String? hint;
  final String? initial;
  final String code;
  final String? errorLabel;
  final TextEditingController? controller;
  final void Function(PhoneNumber) onChanged;

  const CountryPickerTextField({
    Key? key,
    required this.onChanged,
    this.initial,
    this.controller,
    this.hint,
    this.code = "SA",
    this.errorLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        // color: AppConstant.textFieldColor,
      ),
      child: IntlPhoneField(
        initialValue: initial,
        controller: controller,
        textAlign: TextAlign.end,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
        ],
        style: TextStyle(
          fontFamily: KAppConfig.APP_Font_Janna,
          color: KAppColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
        cursorColor: KAppColors.primaryColor,
        decoration: InputDecoration(
          counterText: '',
          fillColor: Colors.white,
          // errorBorder: InputBorder.none,
          //errorText:AppLocalizations.of(context).translate("phone_error"),
          errorStyle: KAppTextStyle.regularTextStyle.copyWith(
            fontSize: 13.sp,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),

          isDense: true,
          enabled: false,
/*
          suffixIconConstraints:BoxConstraints(maxHeight: 20.w,maxWidth: 20.w),
          suffixIcon: Padding(
            padding:   EdgeInsetsDirectional.only(end: 10.w),
            child: SvgPicture.asset(KAppSvgs.icMobile,
               ),
          ),*/
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: KAppColors.primaryColor,
              width: 1,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),

          contentPadding: EdgeInsetsDirectional.only(top: 26.h, bottom: 26.h, start: 20.w, end: 8.w),
          filled: true,

          hintText: hint ?? AppLocalizations.of(context)!.translate("phone_number"),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: KAppColors.primaryColor,
              width: 1,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: KAppTextStyle.regularTextStyle.copyWith(
            color: KAppColors.hintColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
          border: const OutlineInputBorder(
            //Outline border type for TextField
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              width: 1,
              color: KAppColors.hintColor,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: KAppColors.hintColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        initialCountryCode: code,
        invalidNumberMessage: errorLabel ?? AppLocalizations.of(context)!.translate("phone_error"),
        dropdownTextStyle: KAppTextStyle.regularTextStyle.copyWith(
          fontSize: 14.sp,
          color: KAppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
        flagsButtonPadding: const EdgeInsetsDirectional.only(start: 10),
        dropdownIcon: const Icon(
          Icons.arrow_drop_down,
          color: KAppColors.primaryColor,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
