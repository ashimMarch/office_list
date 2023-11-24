part of 'injection_container.dart';


final sl = GetIt.instance;

Future<void> initializeDependancy() async{
  await initAuth();
  await initOffice();
}

Future<void> initAuth() async{
  final pref = await SharedPreferences.getInstance();
  
  sl..registerFactory(() => AuthBloc(
    signInUser: sl(),
    signOutUser: sl(),
  ))
  ..registerLazySingleton(() => SignInUserUsecase(sl()))
  ..registerLazySingleton(() => SignOutUserUsecase(sl()))
  ..registerLazySingleton<AuthRrpo>(() => AuthRrpoImpl(sl()))
  ..registerLazySingleton<AuthRemoteSrc>(() => AuthRemoteSrcImpl(sl()))
  ..registerLazySingleton(() => pref)
  ..registerLazySingleton(() => Client());
}

Future<void> initOffice() async{  
  sl..registerFactory(() => OfficeCubit(sl()))
  ..registerLazySingleton(() => GetAllOffices(sl()))
  ..registerLazySingleton<OfficeRepo>(() => OfficeRepoImple(sl()))
  ..registerLazySingleton<OfficeRemoteDataSrc>(() => OfficeRemoteDataSrcImpl(sl()));
}
