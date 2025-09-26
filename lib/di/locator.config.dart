// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i627;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;

import '../app/config/app_config.dart' as _i273;
import '../app/router/app_router.dart' as _i559;
import '../module/discover/root/application/discover_bloc.dart' as _i43;
import '../module/discover/root/domain/repository/i_discover_repository.dart'
    as _i276;
import '../module/discover/root/infrastructure/datasource/discover_remote.dart'
    as _i32;
import '../module/discover/root/infrastructure/repository/discover_repository.dart'
    as _i809;
import '../module/discover/thing_detail/application/thing_detail_bloc.dart'
    as _i779;
import '../module/discover/thing_detail/domain/i_thing_detail_repository.dart'
    as _i324;
import '../module/discover/thing_detail/infrastructure/datasource/thing_detail_remote.dart'
    as _i758;
import '../module/discover/thing_detail/infrastructure/repository/thing_detail_repository.dart'
    as _i158;
import '../module/discover/thing_exercise/application/thing_exercise_bloc.dart'
    as _i756;
import '../module/discover/things/application/things_bloc.dart' as _i959;
import '../module/discover/things/domain/repository/i_things_repository.dart'
    as _i732;
import '../module/discover/things/infrastructure/datasource/things_remote.dart'
    as _i806;
import '../module/discover/things/infrastructure/repository/things_repository.dart'
    as _i486;
import '../module/letters_and_numbers/letter_detail/application/letter_detail_bloc.dart'
    as _i669;
import '../module/letters_and_numbers/letter_detail/domain/repository/i_letter_detail_repository.dart'
    as _i843;
import '../module/letters_and_numbers/letter_detail/infrastructure/datasource/letter_detail_remote.dart'
    as _i469;
import '../module/letters_and_numbers/letter_detail/infrastructure/repository/letter_detail_repository.dart'
    as _i768;
import '../module/letters_and_numbers/letters/application/letters_bloc.dart'
    as _i66;
import '../module/letters_and_numbers/letters/domain/repository/i_letter_repository.dart'
    as _i1038;
import '../module/letters_and_numbers/letters/infrastructure/datasource/letter_remote.dart'
    as _i395;
import '../module/letters_and_numbers/letters/infrastructure/repository/letter_repository.dart'
    as _i800;
import '../module/letters_and_numbers/number_detail/application/number_detail_bloc.dart'
    as _i818;
import '../module/letters_and_numbers/number_detail/domain/repository/i_number_detail_repository.dart'
    as _i791;
import '../module/letters_and_numbers/number_detail/infrastructure/datasource/number_detail_remote.dart'
    as _i481;
import '../module/letters_and_numbers/number_detail/infrastructure/repository/letter_detail_repository.dart'
    as _i196;
import '../module/letters_and_numbers/numbers/application/number_bloc.dart'
    as _i739;
import '../module/letters_and_numbers/numbers/domain/repository/i_number_repository.dart'
    as _i236;
import '../module/letters_and_numbers/numbers/infrastructure/datasource/number_remote.dart'
    as _i62;
import '../module/letters_and_numbers/numbers/infrastructure/repository/number_repository.dart'
    as _i711;
import '../module/progress/application/progress_bloc.dart' as _i576;
import '../module/progress/domain/repository/i_progress_repository.dart'
    as _i172;
import '../module/progress/infrastructure/datasource/progress_remote.dart'
    as _i360;
import '../module/progress/infrastructure/repository/progress_repository.dart'
    as _i137;
import '../module/root/application/tab_view_bloc.dart' as _i1050;
import '../module/setting/application/setting_bloc.dart' as _i291;
import '../module/setting/domain/repository/i_setting_repository.dart' as _i737;
import '../module/setting/infrastructure/datasource/setting_local.dart' as _i89;
import '../module/setting/infrastructure/repository/setting_repository.dart'
    as _i233;
import '../module/user/auth/application/auth_bloc.dart' as _i831;
import '../module/user/auth/domain/repository/i_auth_repository.dart' as _i733;
import '../module/user/auth/infrastructure/datasource/auth_remote.dart'
    as _i782;
import '../module/user/auth/infrastructure/repository/auth_repository.dart'
    as _i638;
import '../module/user/forget_password/application/forget_password_bloc.dart'
    as _i423;
import '../module/user/forget_password/domain/repository/i_forget_password_repository.dart'
    as _i335;
import '../module/user/forget_password/infrastructure/datasource/forget_password_remote.dart'
    as _i1061;
import '../module/user/forget_password/infrastructure/repository/forget_password_repository.dart'
    as _i173;
import '../module/user/login/application/login_bloc.dart' as _i156;
import '../module/user/login/domain/repository/i_login_repository.dart' as _i57;
import '../module/user/login/infrastructure/datasource/login_remote.dart'
    as _i520;
import '../module/user/login/infrastructure/repository/login_repository.dart'
    as _i107;
import '../module/user/register/application/register_bloc.dart' as _i28;
import '../module/user/register/domain/repository/i_register_repository.dart'
    as _i26;
import '../module/user/register/infrastructure/datasource/register_remote.dart'
    as _i1033;
import '../module/user/register/infrastructure/repository/register_repository.dart'
    as _i594;
import '../module/words_and_sentences/word_match/word_match_detail/application/word_match_detail_bloc.dart'
    as _i62;
import '../module/words_and_sentences/word_match/word_match_detail/domain/repository/i_word_match_detail_repository.dart'
    as _i316;
import '../module/words_and_sentences/word_match/word_match_detail/infrastructure/datasource/word_match_detail_remote.dart'
    as _i393;
import '../module/words_and_sentences/word_match/word_match_detail/infrastructure/repository/word_match_detail_repository.dart'
    as _i716;
import '../module/words_and_sentences/word_match/word_match_exercise/application/word_match_exercise_bloc.dart'
    as _i421;
import '../module/words_and_sentences/word_match/word_match_list/application/word_match_bloc.dart'
    as _i68;
import '../module/words_and_sentences/word_match/word_match_list/domain/repository/i_word_match_repository.dart'
    as _i872;
import '../module/words_and_sentences/word_match/word_match_list/infrastructure/datasource/word_match_remote.dart'
    as _i153;
import '../module/words_and_sentences/word_match/word_match_list/infrastructure/repository/word_match_repository.dart'
    as _i88;
import '../module/words_and_sentences/word_selection/word_selection_detail/application/word_selection_detail_bloc.dart'
    as _i500;
import '../module/words_and_sentences/word_selection/word_selection_detail/domain/repository/i_word_selection_detail_repository.dart'
    as _i952;
import '../module/words_and_sentences/word_selection/word_selection_detail/infrastructure/datasource/word_selection_detail_remote.dart'
    as _i645;
import '../module/words_and_sentences/word_selection/word_selection_detail/infrastructure/repository/word_selection_detail_repository.dart'
    as _i459;
import '../module/words_and_sentences/word_selection/word_selection_exercise/application/word_selection_exercise_bloc.dart'
    as _i337;
import '../module/words_and_sentences/word_selection/word_selection_list/application/word_selection_bloc.dart'
    as _i380;
import '../module/words_and_sentences/word_selection/word_selection_list/domain/repository/i_word_selection_repository.dart'
    as _i740;
import '../module/words_and_sentences/word_selection/word_selection_list/insfrastructure/datasource/word_selection_remote.dart'
    as _i52;
import '../module/words_and_sentences/word_selection/word_selection_list/insfrastructure/repository/word_selection_repository.dart'
    as _i36;
import '../plugin/firebase/auth_service.dart' as _i449;
import '../plugin/firebase/firebase_injectable_module.dart' as _i613;
import '../plugin/firebase/firestore_service.dart' as _i508;
import '../plugin/firebase/remote_config_service.dart' as _i283;
import '../plugin/google/google_injectable_module.dart' as _i714;
import '../plugin/google/google_service.dart' as _i128;
import '../plugin/storage/local_storage.dart' as _i938;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final googleInjectableModule = _$GoogleInjectableModule();
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    gh.factory<_i89.SettingLocalDataSource>(
      () => const _i89.SettingLocalDataSource(),
    );
    gh.singleton<_i273.AppConfig>(() => _i273.AppConfig());
    gh.singleton<_i559.AppRouter>(() => _i559.AppRouter());
    gh.singleton<_i1050.TabViewBloc>(() => _i1050.TabViewBloc());
    gh.singleton<_i116.GoogleSignIn>(() => googleInjectableModule.googleSignIn);
    gh.singleton<_i938.LocalStorage>(() => _i938.LocalStorage());
    gh.singleton<_i59.GoogleAuthProvider>(
      () => firebaseInjectableModule.googleAuthProvider,
    );
    gh.lazySingleton<_i59.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth,
    );
    gh.lazySingleton<_i974.FirebaseFirestore>(
      () => firebaseInjectableModule.firebaseFirestore,
    );
    gh.lazySingleton<_i627.FirebaseRemoteConfig>(
      () => firebaseInjectableModule.remoteConfig,
    );
    gh.singleton<_i128.GoogleService>(
      () => _i128.GoogleService(googleSignIn: gh<_i116.GoogleSignIn>()),
    );
    gh.factory<_i737.ISettingRepository>(
      () => _i233.SettingRepository(
        localDataSource: gh<_i89.SettingLocalDataSource>(),
      ),
    );
    gh.singleton<_i283.RemoteConfigService>(
      () => _i283.RemoteConfigService(
        remoteConfig: gh<_i627.FirebaseRemoteConfig>(),
      ),
    );
    gh.lazySingleton<_i508.FirestoreService>(
      () => _i508.FirestoreService(firestore: gh<_i974.FirebaseFirestore>()),
    );
    gh.lazySingleton<_i449.AuthService>(
      () => _i449.AuthService(
        auth: gh<_i59.FirebaseAuth>(),
        googleService: gh<_i128.GoogleService>(),
      ),
    );
    gh.factory<_i1061.ForgetPasswordRemoteDataSource>(
      () => _i1061.ForgetPasswordRemoteDataSource(
        authService: gh<_i449.AuthService>(),
      ),
    );
    gh.factory<_i1033.RegisterRemoteDataSource>(
      () =>
          _i1033.RegisterRemoteDataSource(authService: gh<_i449.AuthService>()),
    );
    gh.factory<_i520.LoginRemoteDataSource>(
      () => _i520.LoginRemoteDataSource(authService: gh<_i449.AuthService>()),
    );
    gh.singleton<_i291.SettingBloc>(
      () => _i291.SettingBloc(repository: gh<_i737.ISettingRepository>()),
    );
    gh.factory<_i758.ThingDetailRemoteDataSource>(
      () => _i758.ThingDetailRemoteDataSource(
        firestoreService: gh<_i508.FirestoreService>(),
      ),
    );
    gh.factory<_i32.DiscoverRemoteDataSource>(
      () => _i32.DiscoverRemoteDataSource(
        firestoreService: gh<_i508.FirestoreService>(),
      ),
    );
    gh.factory<_i806.ThingsRemoteDataSource>(
      () => _i806.ThingsRemoteDataSource(
        firestoreService: gh<_i508.FirestoreService>(),
      ),
    );
    gh.factory<_i360.ProgressRemoteDataSource>(
      () => _i360.ProgressRemoteDataSource(
        firestoreService: gh<_i508.FirestoreService>(),
      ),
    );
    gh.factory<_i469.LetterDetailRemoteDataSource>(
      () => _i469.LetterDetailRemoteDataSource(
        firestoreService: gh<_i508.FirestoreService>(),
      ),
    );
    gh.factory<_i395.LetterRemoteDataSource>(
      () => _i395.LetterRemoteDataSource(
        firestoreService: gh<_i508.FirestoreService>(),
      ),
    );
    gh.factory<_i62.NumberRemoteDataSource>(
      () => _i62.NumberRemoteDataSource(
        firestoreService: gh<_i508.FirestoreService>(),
      ),
    );
    gh.factory<_i481.NumberDetailRemoteDataSource>(
      () => _i481.NumberDetailRemoteDataSource(
        firestoreService: gh<_i508.FirestoreService>(),
      ),
    );
    gh.factory<_i153.WordMatchRemoteDataSource>(
      () => _i153.WordMatchRemoteDataSource(
        firestoreService: gh<_i508.FirestoreService>(),
      ),
    );
    gh.factory<_i393.WordMatchDetailRemoteDataSource>(
      () => _i393.WordMatchDetailRemoteDataSource(
        firestoreService: gh<_i508.FirestoreService>(),
      ),
    );
    gh.factory<_i52.WordSelectionRemoteDataSource>(
      () => _i52.WordSelectionRemoteDataSource(
        firestoreService: gh<_i508.FirestoreService>(),
      ),
    );
    gh.factory<_i645.WordSelectionDetailRemoteDataSource>(
      () => _i645.WordSelectionDetailRemoteDataSource(
        firestoreService: gh<_i508.FirestoreService>(),
      ),
    );
    gh.factory<_i324.IThingDetailRepository>(
      () => _i158.ThingDetailRepository(
        remoteDataSource: gh<_i758.ThingDetailRemoteDataSource>(),
      ),
    );
    gh.factory<_i732.IThingsRepository>(
      () => _i486.ThingsRepository(
        remoteDataSource: gh<_i806.ThingsRemoteDataSource>(),
      ),
    );
    gh.factory<_i843.ILetterDetailRepository>(
      () => _i768.LetterDetailRepository(
        remoteDataSource: gh<_i469.LetterDetailRemoteDataSource>(),
      ),
    );
    gh.factory<_i236.INumberRepository>(
      () => _i711.NumberRepository(
        remoteDataSource: gh<_i62.NumberRemoteDataSource>(),
      ),
    );
    gh.factory<_i872.IWordMatchRepository>(
      () => _i88.WordMatchRepository(
        remoteDataSource: gh<_i153.WordMatchRemoteDataSource>(),
      ),
    );
    gh.factory<_i959.ThingsBloc>(
      () => _i959.ThingsBloc(repository: gh<_i732.IThingsRepository>()),
    );
    gh.factory<_i316.IWordMatchDetailRepository>(
      () => _i716.WordMatchDetailRepository(
        remoteDataSource: gh<_i393.WordMatchDetailRemoteDataSource>(),
      ),
    );
    gh.factory<_i26.IRegisterRepository>(
      () => _i594.RegisterRepository(
        remoteDataSource: gh<_i1033.RegisterRemoteDataSource>(),
      ),
    );
    gh.factory<_i28.RegisterBloc>(
      () => _i28.RegisterBloc(repository: gh<_i26.IRegisterRepository>()),
    );
    gh.factory<_i1038.ILetterRepository>(
      () => _i800.LetterRepository(
        remoteDataSource: gh<_i395.LetterRemoteDataSource>(),
      ),
    );
    gh.factory<_i335.IForgetPasswordRepository>(
      () => _i173.ForgetPasswordRepository(
        remoteDataSource: gh<_i1061.ForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i68.WordMatchBloc>(
      () => _i68.WordMatchBloc(repository: gh<_i872.IWordMatchRepository>()),
    );
    gh.factory<_i423.ForgetPasswordBloc>(
      () => _i423.ForgetPasswordBloc(
        repository: gh<_i335.IForgetPasswordRepository>(),
      ),
    );
    gh.factory<_i791.INumberDetailRepository>(
      () => _i196.NumberDetailRepository(
        remoteDataSource: gh<_i481.NumberDetailRemoteDataSource>(),
      ),
    );
    gh.factory<_i66.LettersBloc>(
      () => _i66.LettersBloc(repository: gh<_i1038.ILetterRepository>()),
    );
    gh.factory<_i782.AuthRemoteDataSource>(
      () => _i782.AuthRemoteDataSource(
        authService: gh<_i449.AuthService>(),
        firestoreService: gh<_i508.FirestoreService>(),
      ),
    );
    gh.factory<_i952.IWordSelectionDetailRepository>(
      () => _i459.WordSelectionDetailRepository(
        remoteDataSource: gh<_i645.WordSelectionDetailRemoteDataSource>(),
      ),
    );
    gh.factory<_i57.ILoginRepository>(
      () => _i107.LoginRepository(
        remoteDataSource: gh<_i520.LoginRemoteDataSource>(),
      ),
    );
    gh.factory<_i276.IDiscoverRepository>(
      () => _i809.DiscoverRepository(
        remoteDataSource: gh<_i32.DiscoverRemoteDataSource>(),
      ),
    );
    gh.factory<_i172.IProgressRepository>(
      () => _i137.ProgressRepository(
        remoteDataSource: gh<_i360.ProgressRemoteDataSource>(),
      ),
    );
    gh.factory<_i739.NumbersBloc>(
      () => _i739.NumbersBloc(repository: gh<_i236.INumberRepository>()),
    );
    gh.factory<_i740.IWordSelectionRepository>(
      () => _i36.WordSelectionRepository(
        remoteDataSource: gh<_i52.WordSelectionRemoteDataSource>(),
      ),
    );
    gh.factory<_i818.NumberDetailBloc>(
      () => _i818.NumberDetailBloc(
        repository: gh<_i791.INumberDetailRepository>(),
        progressRepository: gh<_i172.IProgressRepository>(),
      ),
    );
    gh.factory<_i62.WordMatchDetailBloc>(
      () => _i62.WordMatchDetailBloc(
        progressRepository: gh<_i172.IProgressRepository>(),
        repository: gh<_i316.IWordMatchDetailRepository>(),
      ),
    );
    gh.factory<_i43.DiscoverBloc>(
      () => _i43.DiscoverBloc(repository: gh<_i276.IDiscoverRepository>()),
    );
    gh.factory<_i156.LoginBloc>(
      () => _i156.LoginBloc(repository: gh<_i57.ILoginRepository>()),
    );
    gh.factory<_i669.LetterDetailBloc>(
      () => _i669.LetterDetailBloc(
        repository: gh<_i843.ILetterDetailRepository>(),
        progressRepository: gh<_i172.IProgressRepository>(),
      ),
    );
    gh.factory<_i756.ThingExerciseBloc>(
      () =>
          _i756.ThingExerciseBloc(repository: gh<_i172.IProgressRepository>()),
    );
    gh.factory<_i576.ProgressBloc>(
      () => _i576.ProgressBloc(repository: gh<_i172.IProgressRepository>()),
    );
    gh.factory<_i421.WordMatchExerciseBloc>(
      () => _i421.WordMatchExerciseBloc(
        repository: gh<_i172.IProgressRepository>(),
      ),
    );
    gh.factory<_i337.WordSelectionExerciseBloc>(
      () => _i337.WordSelectionExerciseBloc(
        repository: gh<_i172.IProgressRepository>(),
      ),
    );
    gh.factory<_i380.WordSelectionBloc>(
      () => _i380.WordSelectionBloc(
        repository: gh<_i740.IWordSelectionRepository>(),
      ),
    );
    gh.factory<_i733.IAuthRepository>(
      () => _i638.AuthRepository(
        remoteDataSource: gh<_i782.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i500.WordSelectionDetailBloc>(
      () => _i500.WordSelectionDetailBloc(
        progressRepository: gh<_i172.IProgressRepository>(),
        repository: gh<_i952.IWordSelectionDetailRepository>(),
      ),
    );
    gh.singleton<_i831.AuthBloc>(
      () => _i831.AuthBloc(repository: gh<_i733.IAuthRepository>()),
    );
    gh.factory<_i779.ThingDetailBloc>(
      () => _i779.ThingDetailBloc(
        repository: gh<_i324.IThingDetailRepository>(),
        progressRepository: gh<_i172.IProgressRepository>(),
      ),
    );
    return this;
  }
}

class _$GoogleInjectableModule extends _i714.GoogleInjectableModule {}

class _$FirebaseInjectableModule extends _i613.FirebaseInjectableModule {}
