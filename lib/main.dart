import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/core/di/di.dart' as di;
import 'package:flutter_exam/core/logging/app_logging.dart';
import 'package:flutter_exam/features/domain/usecase/company_usecase.dart';
import 'package:flutter_exam/features/domain/usecase/login_usecase.dart';
import 'package:flutter_exam/features/domain/usecase/logout_usecase.dart';
import 'package:flutter_exam/features/domain/usecase/social_usecase.dart';
import 'package:flutter_exam/features/routes/app_routes.dart';
import 'package:flutter_exam/features/bloc/global_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.setupLocator();
  logger.info('App Successfully Initialized');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GlobalBloc(
        loginUseCase: di.getIt<LoginUseCase>(),
        getSocialUseCase: di.getIt<GetSocialUseCase>(),
        companyUseCase: di.getIt<CompanyUseCase>(),
        logoutUseCase: di.getIt<LogoutUseCase>()
      ),
      child: ScreenUtilInit(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'),
          ],
          theme: ThemeData(
            useMaterial3: true,
          ),
          routerConfig: AppRoutes.routers,
        ),
      ),
    );
  }
}
