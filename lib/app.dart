import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routing/k_routes.dart';
import 'core/localization/app_localizations_setup.dart';
import 'core/localization/lang_bloc/local_cubit.dart';
import 'data/data.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _applySystemChrome();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocalCubit()),
      ],
      child: BlocConsumer<LocalCubit, LocalStates>(
        listener: (context, state) {},
        buildWhen: (previousState, currentState) => previousState != currentState,
        builder: (_, localeState) => MaterialApp(
          title: 'Al7osam Template',
          navigatorKey: AppSessionKeys.navigatorKey,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizationSetup.localizationsDelegate,
          supportedLocales: AppLocalizationSetup.supportedLocales,
          locale: localeState.locale,
          onGenerateRoute: KAppRoutes.generateRoute,
          initialRoute: KAppRoutes.splash,
        ),
      ),
    );
  }

  _applySystemChrome() {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
