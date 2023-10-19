import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toast/toast.dart';
import '../../../core/dialogs/show_popup.dart';
import '../../../core/widgets/customs/loading_widget.dart';
import '../../../utils/app_text_styles.dart';

void showToast({
  required BuildContext context,
  required String msg,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
  int duration = Toast.lengthLong,
}) {
  ToastContext().init(context);
  Toast.show(
    msg,
    textStyle: KAppTextStyle.regularTextStyle.copyWith(
      color: textColor,
      fontSize: 14,
    ),
    backgroundColor: backgroundColor,
    duration: duration,
  );
}

void showErrorToast({
  required BuildContext context,
  required String msg,
  Color backgroundColor = Colors.red,
  int duration = Toast.lengthLong,
}) {
  showToast(context: context, msg: msg, backgroundColor: backgroundColor);
}

void showSuccessToast({
  required BuildContext context,
  required String msg,
  Color backgroundColor = Colors.green,
  int duration = Toast.lengthLong,
}) {
  showToast(context: context, msg: msg, backgroundColor: backgroundColor);
}

void showLoadingDialog(BuildContext context, bool isLoading) {
  showPopup(
    context: context,
    childContent: WillPopScope(
      onWillPop: () async {
        return !isLoading;
      },
      child: const LoadingWidget(),
    ),
    hasShape: false,
  );
}

const rippleSpinKit = SpinKitRipple(
  duration: Duration(milliseconds: 800),
  size: 100,
  color: Colors.white,
);

ValidatorFunction mustMatch(String controlName, String matchingControlName) {
  return (AbstractControl<dynamic> control) {
    final form = control as FormGroup;
    final formControl = form.control(controlName);
    final matchingFormControl = form.control(matchingControlName);
    if (formControl.value != matchingFormControl.value) {
      matchingFormControl.setErrors({'mustMatch': true});
      matchingFormControl.markAsTouched();
    } else {
      matchingFormControl.removeError('mustMatch');
    }
    return null;
  };
}
