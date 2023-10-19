import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/res/assets.dart';
import '../../../core/widgets/widgets.dart';
import '../cubit/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..gitInitialRoute(context),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ScaffoldPattern(
            backPatternPath: KAppSvgs.splashBG,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.center,
                  child: GestureDetector(
                    onTap: () {
                      // context.navNamedTo(KAppRoutes.login);
                      // context.navNamedTo(KAppRoutes.settings);
                      // context.navNamedTo(KAppRoutes.homePage);
                      // context.navNamedTo(KAppRoutes.bottomNav);
                      // context.navNamedTo(KAppRoutes.productsPage);
                    },
                    child: Image.asset(
                      KAppPngs.splashLogo,
                      height: 140.h,
                    ),
                  ),
                ),
                const Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: CopyRightWidget(appName: 'تطبيق ميك'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
