import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/data.dart';
import '../../../utils/location_utils.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void gitInitialRoute(BuildContext context) async {
   await LocationUtil.checkPermissionAndGetCurrentLatLng();

    if (await AppSession.getFirstInstall()) {
      Future.delayed(const Duration(seconds: 1), () async {
        // Future.delayed(const Duration(seconds: 1), () => context.navReplaceNamedTo(KAppRoutes.login));
      });
      AppSession.setFirstInstall(false);
    } else {
      Future.delayed(const Duration(seconds: 1), () async {
        // context.navReplaceNamedTo(KAppRoutes.login);

        // await refreshAccessToken(
        //   onSuccess: () {
        //     context.navReplaceNamedTo(KAppRoutes.btnNavPage);
        //   },
        //   onError: () {
        //     context.navReplaceNamedTo(KAppRoutes.btnNavPage);
        //   },
        // );
      });
    }
  }

  Future<void> refreshAccessToken({Function()? onSuccess, Function()? onError}) async {
    //   emit(LoadingState());
    //   try {
    //     final result = await Repository.instance.refreshAccessToken(
    //       body: AuthRequest(
    //         registrationToken: AppSession.registrationToken,
    //       ),
    //     );
    //     final response = AuthResponse.fromJson(result ?? {});
    //     if (response.success == true) {
    //       AppSession.currentUser = response;
    //       onSuccess?.call();
    //       emit(RefreshSuccess());
    //     } else {
    //       AppSession.currentUser = null;
    //       onError?.call();
    //       emit(RefreshError(HttpError(message: response.message ?? "Unknown Error")));
    //     }
    //   } on DioError catch (e) {
    //     onError?.call();
    //     emit(RefreshError(DioException.fromDioError(e).httpError));
    //   } catch (e) {
    //     onError?.call();
    //     emit(RefreshError(HttpError(message: "Unknown Error")));
    //   }
  }
}
