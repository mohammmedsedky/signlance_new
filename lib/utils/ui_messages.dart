import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:toast/toast.dart';
import '../core/dialogs/show_popup.dart';
import '../core/widgets/customs/loading_widget.dart';
import 'app_text_styles.dart';

void showToast({
  required BuildContext context,
  required String message,
  Color backgroundColor = Colors.black,
  int duration = Toast.lengthLong,
}) {
  ToastContext().init(context);
  Toast.show(
    message,
    textStyle: KAppTextStyle.regularTextStyle.copyWith(
      color: Colors.white,
      fontSize: 14,
    ),
    backgroundColor: backgroundColor,
    duration: duration,
  );
}
const rippleSpinKit = SpinKitRipple(
  duration: Duration(milliseconds: 800),
  color: Colors.white,
  size: 40.0,
);






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
    isDialogShown: (bool isDialogShowing) {},
  );
}
