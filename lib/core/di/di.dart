import 'package:flutter_exam/core/constants/app_constants.dart';
import 'package:flutter_exam/core/dio/api_wrapper.dart';
import 'package:flutter_exam/core/dio/dio_client.dart';
import 'package:flutter_exam/features/data/api/auth_api.dart';
import 'package:flutter_exam/features/data/api/social_api.dart';
import 'package:flutter_exam/features/data/repository/auth_repository_impl.dart';
import 'package:flutter_exam/features/data/repository/social_repository_impl.dart';
import 'package:flutter_exam/features/domain/repository/auth_repository.dart';
import 'package:flutter_exam/features/domain/repository/social_repository.dart';
import 'package:flutter_exam/features/domain/usecase/login_usecase.dart';
import 'package:flutter_exam/features/bloc/global_bloc.dart';
import 'package:flutter_exam/features/domain/usecase/social_usecase.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {

  //Dio Client
  getIt.registerLazySingleton<DioClient>(
    () => DioClient(AppConstants.appBaseUrl),
  );

  //API Wrapper
  getIt.registerLazySingleton<ApiWrapper>(() => ApiWrapper(getIt<DioClient>()));

  //API
  getIt.registerLazySingleton<AuthApi>(
    () => AuthApi(
      apiWrapper: getIt<ApiWrapper>(),
    ),
  );

  getIt.registerLazySingleton<SocialApi>(
        () => SocialApi(
      apiWrapper: getIt<ApiWrapper>(),
    ),
  );

  //Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authApi: getIt<AuthApi>(),
    ),
  );

  getIt.registerLazySingleton<SocialRepository>(
        () => SocialRepositoryImpl(
      socialApi: getIt<SocialApi>(),
    ),
  );

  //UseCase
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      authRepository: getIt<AuthRepository>(),
    ),
  );

  getIt.registerLazySingleton<GetSocialUseCase>(
        () => GetSocialUseCase(
      socialRepository: getIt<SocialRepository>(),
    ),
  );

  //Bloc
  getIt.registerFactory<GlobalBloc>(
    () => GlobalBloc(
      loginUseCase: getIt<LoginUseCase>(),
      getSocialUseCase: getIt<GetSocialUseCase>(),
    ),
  );
}
