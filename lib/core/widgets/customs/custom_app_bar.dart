import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/extension/context_extensions.dart';
import '../../../data/data.dart';

import '../../../utils/app_text_styles.dart';
import '../../res/assets.dart';
import '../../res/colors.dart';

class ZeroHeightAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ZeroHeightAppBar({
    Key? key,
    this.color = Colors.white,
    this.statusBarIsLight = true,
  }) : super(key: key);

  final Color color;
  final bool statusBarIsLight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color, // IOS status bar color
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: statusBarIsLight ? Brightness.dark : Brightness.light,
        // Android status bar icons color
        statusBarBrightness: statusBarIsLight ? Brightness.light : Brightness.dark,
        // IOS status bar icons color
        statusBarColor: color, // Android status bar color
      ),
      toolbarHeight: 0,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 0);
}

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({
    super.key,
    this.title,
    this.bottomWidget,
    this.backWidget,
    this.hasSearch = true,
    this.hasNotification = true,
    this.hasCart = true,
    this.hasBottomShadow = true,
    this.backWidth = 28,
  });

  final Widget? bottomWidget;
  final Widget? backWidget;
  final String? title;
  final bool hasSearch;
  final bool hasNotification;
  final bool hasCart;
  final bool hasBottomShadow;
  final double? backWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 20.w,
            ),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 50.h,
                    child: title != null
                        ? Center(
                            child: Text(
                              title ?? '',
                              style: KAppTextStyle.boldTextStyle.copyWith(
                                fontSize: 18.sp,
                                color: KAppColors.blackColor,
                              ),
                            ),
                          )
                        : Image.asset(KAppPngs.appbarLogo),
                  ),
                ),
                Row(
                  children: [
                    (backWidget != null)
                        ? SizedBox(
                            width: (backWidth != null) ? backWidth!.w : null,
                            child: backWidget,
                          )
                        : GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              context.pop();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: SizedBox(
                                width: 26.r,
                                child: SvgPicture.asset(
                                  (AppSessionKeys.langKey == 'ar') ? KAppSvgs.backArIcon : KAppSvgs.backEnIcon,
                                ),
                              ),
                            ),
                          ),
                    const Spacer(),
                    if (hasNotification)
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        // onTap:() => context.navNamedTo(KAppRoutes.notification),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: SizedBox(
                            width: 22.w,
                            child: SvgPicture.asset(KAppSvgs.notificationIcon),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (bottomWidget != null) bottomWidget!,
        ],
      ),
    );
  }
}

// class HomeAppBar extends StatelessWidget {
//   const HomeAppBar({
//     super.key,
//     this.title,
//     this.notificationCount = 0,
//     this.hasSearch = false,
//     this.onCartClick,
//   });
//
//   final Widget? title;
//   final int notificationCount;
//   final bool hasSearch;
//   final void Function()? onCartClick;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 48.h,
//       padding: EdgeInsetsDirectional.symmetric(
//         horizontal: 20.w,
//       ),
//       child: Stack(
//         alignment: AlignmentDirectional.center,
//         children: [
//           Align(
//             alignment: AlignmentDirectional.centerStart,
//             child: Row(
//               children: [
//                 GestureDetector(
//                   behavior: HitTestBehavior.opaque,
//                   onTap: onCartClick,
//                   child: SvgPicture.asset(KAppSvgs.cart),
//                 ),
//                 if (hasSearch) ...[
//                   SizedBox(width: 10
//                       .w),
//                   SvgPicture.asset(KAppSvgs.headerSearch),
//                 ] else
//                   ...[]
//               ],
//             ),
//           ),
//           Align(
//             alignment: AlignmentDirectional.center,
//             child: title ??
//                 Image.asset(
//                   KAppImages.logoAppBarFix1,
//                   height: 40.h,
//                 ),
//           ),
//           GestureDetector(
//             onTap: () {
//               context.navNamedTo(KAppRoutes.notificationsPage);
//             },
//             child: Align(
//               alignment: AlignmentDirectional.centerEnd,
//               child: badges.Badge(
//                 position: badges.BadgePosition.topStart(top: -12.h, start: -10.w),
//                 badgeContent: Text(
//                   '$notificationCount',
//                   style: KAppTextStyle.regularTextStyle.copyWith(color: KAppColors.white, fontSize: 12.sp),
//                 ),
//                 badgeStyle: const badges.BadgeStyle(badgeColor: KAppColors.color_E57438),
//                 child: SvgPicture.asset(KAppSvgs.notificationBell),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CustomAppBar extends StatelessWidget {
//   const CustomAppBar({
//     super.key,
//     required this.title,
//     this.showNotifications = true,
//     this.showCart = false,
//     this.showShare = false,
//     this.onShareClick,
//     this.notificationCount = 0,
//   });
//
//   final String title;
//   final int notificationCount;
//   final bool showNotifications;
//   final bool showCart;
//   final bool showShare;
//   final void Function()? onShareClick;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 48.h,
//       padding: EdgeInsetsDirectional.symmetric(
//         horizontal: 20.w,
//       ),
//       child: Stack(
//         alignment: AlignmentDirectional.center,
//         children: [
//           Align(
//             alignment: AlignmentDirectional.centerStart,
//             child: Row(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     context.pop();
//                   },
//                   child: SvgPicture.asset(KAppSvgs.backPage),
//                 ),
//                 Visibility(
//                   visible: showCart,
//                   child: Padding(
//                     padding: EdgeInsetsDirectional.only(start: 20.w),
//                     child: GestureDetector(
//                       onTap: () {
//                         context.navNamedTo(KAppRoutes.cart);
//                       },
//                       child: SvgPicture.asset(KAppSvgs.cart),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Align(
//             alignment: AlignmentDirectional.center,
//             child: Container(
//               margin: EdgeInsetsDirectional.symmetric(horizontal: 90.w),
//               child: Text(
//                 title,
//                 textAlign: TextAlign.center,
//                 style: KAppTextStyle.boldTextStyle.copyWith(fontSize: 19.sp),
//               ),
//             ),
//           ),
//           Align(
//             alignment: AlignmentDirectional.centerEnd,
//             child: GestureDetector(
//               onTap: () {
//                 context.navNamedTo(KAppRoutes.notificationsPage);
//               },
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Visibility(
//                     visible: showShare,
//                     child: GestureDetector(
//                       onTap: onShareClick,
//                       child: SvgPicture.asset(KAppSvgs.share),
//                     ),
//                   ),
//                   Visibility(
//                     visible: showNotifications && showShare,
//                     child: SizedBox(width: 16.w),
//                   ),
//                   Visibility(
//                     visible: showNotifications,
//                     child: badges.Badge(
//                       position: badges.BadgePosition.topStart(top: -12.h, start: -10.w),
//                       badgeContent: Text(
//                         '$notificationCount',
//                         style: KAppTextStyle.regularTextStyle.copyWith(color: KAppColors.white, fontSize: 12.sp),
//                       ),
//                       badgeStyle: const badges.BadgeStyle(badgeColor: KAppColors.color_E57438),
//                       child: SvgPicture.asset(
//                         KAppSvgs.notificationBell,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class AppBarIcon extends StatelessWidget {
//   const AppBarIcon({
//     Key? key,
//     required this.asset,
//     this.onClicked,
//     this.centerSize = 16,
//     this.startSize = 16,
//     this.endSize = 16,
//     this.centerText = "",
//     this.hasCenterText = false,
//   }) : super(key: key);
//
//   final Function()? onClicked;
//   final double startSize;
//   final double centerSize;
//   final bool hasCenterText;
//   final double endSize;
//   final String asset;
//   final String centerText;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onTap: onClicked,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(width: startSize.w),
//           hasCenterText
//               ? Text(
//                   centerText,
//                   style: KAppTextStyle.boldTextStyle.copyWith(
//                     fontSize: 19.sp,
//                   ),
//                 )
//               : const SizedBox.shrink(),
//           SizedBox(width: centerSize.w),
//           SvgPicture.asset(
//             asset,
//           ),
//           SizedBox(width: endSize.w),
//         ],
//       ),
//     );
//   }
// }
