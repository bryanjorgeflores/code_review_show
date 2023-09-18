import 'package:core/core.dart';
import 'package:domain/domain.dart';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt $initGetIt(GetIt getIt, {Map<String, String>? env}) {
  final gh = GetItHelper(getIt);

  gh.factory<ApiProvider>(
      () => ApiProvider(urlServer: env?['API_URL'] as String));

  //commons
  gh.factory<ErrorMapping>(() => ErrorMapping());

  //main
  gh.factory<MainMapping>(() => MainMapping());
  gh.factory<MainProvider>(() => MainProvider(getIt<ApiProvider>()));
  gh.factory<MainRepository>(() => MainRepository(
      getIt<MainProvider>(), getIt<MainMapping>(), getIt<ErrorMapping>()));

  return getIt;
}
