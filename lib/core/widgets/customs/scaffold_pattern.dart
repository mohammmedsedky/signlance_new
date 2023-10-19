import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../core/extension/context_extensions.dart';

import '../../res/assets.dart';
import '../widgets.dart';

class ScaffoldPattern extends StatelessWidget {
  const ScaffoldPattern({
    super.key,
    required this.child,
    this.isLoading = false,
    this.backPatternPath = KAppPngs.defaultBG,
    this.backgroundColor = Colors.transparent,
    this.appBarBackgroundColor = Colors.white,
    this.statusBarIsLight = true,
  });

  final Widget child;
  final String backPatternPath;
  final bool isLoading;
  final Color backgroundColor;
  final Color appBarBackgroundColor;
  final bool statusBarIsLight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.removeFocus();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(backPatternPath),
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
        ),
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: ZeroHeightAppBar(color: appBarBackgroundColor, statusBarIsLight: statusBarIsLight),
          body: Stack(
            children: [
              IgnorePointer(
                ignoring: isLoading,
                child: child,
              ),
              isLoading
                  ? BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: const Align(
                        alignment: Alignment.center,
                        child: LoadingWidget(size: 60),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
