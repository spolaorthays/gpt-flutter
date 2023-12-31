// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/chat/data/service/chat_service.dart' as _i4;
import '../../features/chat/domain/chat_interactor.dart' as _i5;
import '../../features/chat/presentation/bloc/chat_bloc.dart' as _i6;
import '../../network/network_module.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  gh.factory<_i3.Interceptor>(
    () => networkModule.providePrettyLogger(),
    instanceName: 'PrettyLogger',
  );
  gh.factory<String>(
    () => networkModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.singleton<_i3.Dio>(networkModule.provideDio(
    get<String>(instanceName: 'BaseUrl'),
    get<_i3.Interceptor>(instanceName: 'PrettyLogger'),
  ));
  gh.factory<_i4.ChatService>(() => _i4.ChatServiceImpl(get<_i3.Dio>()));
  gh.factory<_i5.ChatInteractor>(
      () => _i5.ChatInteractorImpl(get<_i4.ChatService>()));
  gh.factory<_i6.ChatBloc>(() => _i6.ChatBloc(get<_i5.ChatInteractor>()));
  return get;
}

class _$NetworkModule extends _i7.NetworkModule {}
