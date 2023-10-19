import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../utils/app_text_styles.dart';
import '../../res/colors.dart';
import '../../validators/validation_messages.dart';

class CustomReactiveTextField extends StatelessWidget {
  final String? hint;
  final String? formControlName;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isReadOnly;
  final bool? isPassword;
  final TextInputType? textInputType;
  final EdgeInsetsGeometry? outsidePadding;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final double? fontSize;
  final Color filledColor;
  final String? fontFamily;
  final FontWeight? textFontWeight;
  final String? errorLabel;
  final Color errorColor;
  final bool withShadow;
  final bool withBorder;
  final bool withLabel;
  final int maxLine;
  final int? maxLength;
  final double? circular;
  final Color hintColor;
  final List<TextInputFormatter>? inputFormatter;

  const CustomReactiveTextField({
    Key? key,
    this.hint,
    this.maxLength,
    this.controller,
    this.formControlName,
    this.circular,
    this.textInputType,
    this.contentPadding,
    this.suffixIcon,
    this.prefixIcon,
    this.isReadOnly = false,
    this.isPassword = false,
    this.outsidePadding,
    this.fontSize,
    this.filledColor = Colors.white,
    this.fontFamily,
    this.textFontWeight,
    this.errorColor = Colors.red,
    this.errorLabel,
    this.withShadow = false,
    this.withBorder = true,
    this.maxLine = 1,
    this.inputFormatter,
    this.hintColor = KAppColors.hintColor,
    this.withLabel = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildTextField();
  }

  Widget buildTextField() {
    return Padding(
      padding: outsidePadding ?? EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: <BoxShadow>[
          withShadow
              ? const BoxShadow(offset: Offset(0, 20), color: Color(0x0D000000), spreadRadius: 1, blurRadius: 30)
              : const BoxShadow(offset: Offset(0, 0), color: Colors.white, spreadRadius: 0, blurRadius: 0)
        ]),
        child: ReactiveTextField(
          inputFormatters: inputFormatter,
          formControlName: formControlName,
          maxLength: maxLength,
          keyboardType: textInputType,
          readOnly: isReadOnly!,
          obscureText: isPassword!,
          maxLines: maxLine,
          cursorColor: KAppColors.primaryColor,
          style: KAppTextStyle.regularTextStyle,
          decoration: InputDecoration(
            fillColor: filledColor,
            filled: true,
            labelText: hint,
            /*  labelText:  withLabel ?hint:"",
               labelStyle:KAppTextStyle.regularTextStyle.copyWith(color: hintColor,
              fontSize: fontSize??14.sp,
              fontWeight: textFontWeight ?? FontWeight.normal,
             ),*/
            contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 18.w, vertical: 26.h),
            labelStyle: KAppTextStyle.regularTextStyle.copyWith(
              color: hintColor,
              fontSize: fontSize ?? 14.sp,
              fontWeight: textFontWeight ?? FontWeight.normal,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: .5.w,
                color: KAppColors.primaryColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: withBorder
                  ? BorderSide(
                      width: 1.w,
                      color: KAppColors.hintColor,
                    )
                  : const BorderSide(style: BorderStyle.none, color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
            ),
            errorStyle: KAppTextStyle.regularTextStyle.copyWith(
              color: errorColor,
              fontSize: 12,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: KAppColors.primaryColor),
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: KAppColors.primaryColor),
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
            ),
            suffixIcon: suffixIcon,
            prefixIconConstraints: BoxConstraints(
              maxWidth: 35.w,
            ),
            prefixIcon: prefixIcon,
          ),
          validationMessages: ValidationMessages.map,
        ),
      ),
    );
  }
}
