import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../utils/app_size.dart';
import '../widgets.dart';

class FullScreenLoading extends StatelessWidget {
  const FullScreenLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: GestureDetector(
        /**
         ** add onTap to look other click while loading
         **/
        behavior: HitTestBehavior.opaque,
        onTap: () {},
        child: SizedBox(
          height: AppSize.screenH,
          width: AppSize.screenW,
          child: const Center(
            child: LoadingWidget(),
          ),
        ),
      ),
    );
  }
}
