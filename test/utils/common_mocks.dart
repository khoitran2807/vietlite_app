import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vietlite/module/discover/root/application/discover_bloc.dart';
import 'package:vietlite/module/discover/root/infrastructure/datasource/discover_remote.dart';
import 'package:vietlite/module/discover/root/infrastructure/repository/discover_repository.dart';
import 'package:vietlite/module/discover/thing_detail/application/thing_detail_bloc.dart';
import 'package:vietlite/module/discover/thing_detail/infrastructure/datasource/thing_detail_remote.dart';
import 'package:vietlite/module/discover/thing_detail/infrastructure/repository/thing_detail_repository.dart';
import 'package:vietlite/module/discover/thing_exercise/application/thing_exercise_bloc.dart';
import 'package:vietlite/module/discover/things/application/things_bloc.dart';
import 'package:vietlite/module/discover/things/infrastructure/datasource/things_remote.dart';
import 'package:vietlite/module/discover/things/infrastructure/repository/things_repository.dart';
import 'package:vietlite/module/letters_and_numbers/letter_detail/application/letter_detail_bloc.dart';
import 'package:vietlite/module/letters_and_numbers/letter_detail/infrastructure/datasource/letter_detail_remote.dart';
import 'package:vietlite/module/letters_and_numbers/letter_detail/infrastructure/repository/letter_detail_repository.dart';
import 'package:vietlite/module/letters_and_numbers/letters/application/letters_bloc.dart';
import 'package:vietlite/module/letters_and_numbers/letters/infrastructure/datasource/letter_remote.dart';
import 'package:vietlite/module/letters_and_numbers/letters/infrastructure/repository/letter_repository.dart';
import 'package:vietlite/module/letters_and_numbers/number_detail/application/number_detail_bloc.dart';
import 'package:vietlite/module/letters_and_numbers/number_detail/infrastructure/datasource/number_detail_remote.dart';
import 'package:vietlite/module/letters_and_numbers/number_detail/infrastructure/repository/letter_detail_repository.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/application/number_bloc.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/infrastructure/datasource/number_remote.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/infrastructure/repository/number_repository.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/domain/repository/i_progress_repository.dart';
import 'package:vietlite/module/progress/infrastructure/datasource/progress_remote.dart';
import 'package:vietlite/module/progress/infrastructure/repository/progress_repository.dart';
import 'package:vietlite/module/root/application/tab_view_bloc.dart';
import 'package:vietlite/module/user/forget_password/application/forget_password_bloc.dart';
import 'package:vietlite/module/user/forget_password/infrastructure/datasource/forget_password_remote.dart';
import 'package:vietlite/module/user/forget_password/infrastructure/repository/forget_password_repository.dart';
import 'package:vietlite/module/user/register/application/register_bloc.dart';
import 'package:vietlite/module/user/register/infrastructure/datasource/register_remote.dart';
import 'package:vietlite/module/user/register/infrastructure/repository/register_repository.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_detail/application/word_match_detail_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_detail/infrastructure/datasource/word_match_detail_remote.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_detail/infrastructure/repository/word_match_detail_repository.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_exercise/application/word_match_exercise_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/application/word_match_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/infrastructure/datasource/word_match_remote.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/infrastructure/repository/word_match_repository.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_detail/application/word_selection_detail_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_detail/infrastructure/datasource/word_selection_detail_remote.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_detail/infrastructure/repository/word_selection_detail_repository.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_exercise/application/word_selection_exercise_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/application/word_selection_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/insfrastructure/datasource/word_selection_remote.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/insfrastructure/repository/word_selection_repository.dart';
import 'package:vietlite/plugin/firebase/firestore_service.dart';
import 'package:vietlite/plugin/firebase/remote_config_service.dart';
import 'package:vietlite/plugin/google/google_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/module/setting/application/setting_bloc.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/user/auth/infrastructure/datasource/auth_remote.dart';
import 'package:vietlite/module/user/auth/infrastructure/repository/auth_repository.dart';
import 'package:vietlite/module/user/login/application/login_bloc.dart';
import 'package:vietlite/module/user/login/infrastructure/datasource/login_remote.dart';
import 'package:vietlite/module/user/login/infrastructure/repository/login_repository.dart';
import 'package:vietlite/plugin/firebase/auth_service.dart';
import 'package:vietlite/plugin/storage/local_storage.dart';

class FakeProgressEvent extends Fake implements ProgressEvent {}

class MockRemoteConfigService extends Mock implements RemoteConfigService {}

// setting
class MockSettingBloc extends MockBloc<SettingEvent, SettingState>
    implements SettingBloc {}

// tab view
class MockTabviewBloc extends MockBloc<TabViewEvent, TabViewState>
    implements TabViewBloc {}

// router
class AppRouterMock extends Mock implements AppRouter {}

class MockRootStackRouter extends Mock implements RootStackRouter {}

// storage
class MockStorage extends Mock implements LocalStorage {}

// auth
class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockAuthService extends Mock implements AuthService {}

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthRepository extends Mock implements AuthRepository {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockGoogleService extends Mock implements GoogleService {}

class MockGoogleAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleAuth extends Mock implements GoogleSignInAuthentication {}

class MockRemoteConfig extends Mock implements FirebaseRemoteConfig {}

class MockUser extends Mock implements User {}

class MockUserCredential extends Mock implements UserCredential {}

class MockAuthCredential extends Mock implements AuthCredential {}

class FakeAuthCredential extends Fake implements AuthCredential {}

// login
class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class MockLoginRemoteDataSource extends Mock implements LoginRemoteDataSource {}

class MockLoginRepository extends Mock implements LoginRepository {}

//register
class MockRegisterBloc extends MockBloc<RegisterEvent, RegisterState>
    implements RegisterBloc {}

class MockRegisterRemoteDataSource extends Mock
    implements RegisterRemoteDataSource {}

class MockRegisterRepository extends Mock implements RegisterRepository {}

// forget password
class MockForgetPasswordBloc
    extends MockBloc<ForgetPasswordEvent, ForgetPasswordState>
    implements ForgetPasswordBloc {}

class MockForgetPasswordRemoteDataSource extends Mock
    implements ForgetPasswordRemoteDataSource {}

class MockForgetPasswordRepository extends Mock
    implements ForgetPasswordRepository {}

// rootScreen
class FakePageRouteInfo extends Fake implements PageRouteInfo {}

//letters_and_numbers
//letters
class MockLettersBloc extends MockBloc<LettersEvent, LettersState>
    implements LettersBloc {}

class MockLetterDetailBloc
    extends MockBloc<LetterDetailEvent, LetterDetailState>
    implements LetterDetailBloc {}

class MockFirestoreService extends Mock implements FirestoreService {}

class MockLetterRemoteDataSource extends Mock
    implements LetterRemoteDataSource {}

class MockLetterDetailRemoteDataSource extends Mock
    implements LetterDetailRemoteDataSource {}

class MockLetterRepository extends Mock implements LetterRepository {}

class MockLetterDetailRepository extends Mock
    implements LetterDetailRepository {}

//number
class MockNumberRepository extends Mock implements NumberRepository {}

class MockNumberRemoteDataSource extends Mock
    implements NumberRemoteDataSource {}

class MockNumbersBloc extends MockBloc<NumberEvent, NumberState>
    implements NumbersBloc {}

class MockNumberDetailRemoteDataSource extends Mock
    implements NumberDetailRemoteDataSource {}

class MockNumberDetailRepository extends Mock
    implements NumberDetailRepository {}

class MockNumberDetailBloc
    extends MockBloc<NumberDetailEvent, NumberDetailState>
    implements NumberDetailBloc {}

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockQuerySnapshot extends Mock
    implements QuerySnapshot<Map<String, dynamic>> {}

// ignore: subtype_of_sealed_class
class MockCollectionReference extends Mock
    implements CollectionReference<Map<String, dynamic>> {}

// ignore: subtype_of_sealed_class
class MockQueryDocumentSnapshot extends Mock
    implements QueryDocumentSnapshot<Map<String, dynamic>> {}

// ignore: subtype_of_sealed_class
class MockDocumentReference extends Mock
    implements DocumentReference<Map<String, dynamic>> {}

// ignore: subtype_of_sealed_class
class MockDocumentSnapshot extends Mock
    implements DocumentSnapshot<Map<String, dynamic>> {}

//WordsAndSentences

//WordSelection
class MockWordSelectionRemoteDataSource extends Mock
    implements WordSelectionRemoteDataSource {}

class MockWordSelectionRepository extends Mock
    implements WordSelectionRepository {}

class MockWordSelectionBloc
    extends MockBloc<WordSelectionEvent, WordSelectionState>
    implements WordSelectionBloc {}

class MockWordSelectionDetailRemoteDataSource extends Mock
    implements WordSelectionDetailRemoteDataSource {}

class MockWordSelectionDetailRepository extends Mock
    implements WordSelectionDetailRepository {}

class MockWordSelectionDetailBloc
    extends MockBloc<WordSelectionDetailEvent, WordSelectionDetailState>
    implements WordSelectionDetailBloc {}

class MockWordSelectionExerciseBloc
    extends MockBloc<WordSelectionExerciseEvent, WordSelectionExerciseState>
    implements WordSelectionExerciseBloc {}

//WordMatch
class MockWordMatchRemoteDataSource extends Mock
    implements WordMatchRemoteDataSource {}

class MockWordMatchRepository extends Mock implements WordMatchRepository {}

class MockWordMatchBloc extends MockBloc<WordMatchEvent, WordMatchState>
    implements WordMatchBloc {}

class MockWordMatchDetailRemoteDataSource extends Mock
    implements WordMatchDetailRemoteDataSource {}

class MockWordMatchDetailRepository extends Mock
    implements WordMatchDetailRepository {}

class MockWordMatchDetailBloc
    extends MockBloc<WordMatchDetailEvent, WordMatchDetailState>
    implements WordMatchDetailBloc {}

class MockWordMatchExerciseBloc
    extends MockBloc<WordMatchExerciseEvent, WordMatchExerciseState>
    implements WordMatchExerciseBloc {}

//progress
class MockProgressRepository extends Mock implements ProgressRepository {}

class MockIProgressRepository extends Mock implements IProgressRepository {}

class MockProgressRemoteDataSource extends Mock
    implements ProgressRemoteDataSource {}

class MockProgressBloc extends MockBloc<ProgressEvent, ProgressState>
    implements ProgressBloc {}

// things
class MockThingsRemoteDataSource extends Mock
    implements ThingsRemoteDataSource {}

class MockThingDetailRemoteDataSource extends Mock
    implements ThingDetailRemoteDataSource {}

class MockThingsRepository extends Mock implements ThingsRepository {}

class MockThingDetailRepository extends Mock implements ThingDetailRepository {}

class MockThingsBloc extends MockBloc<ThingsEvent, ThingsState>
    implements ThingsBloc {}

class MockThingDetailBloc extends MockBloc<ThingDetailEvent, ThingDetailState>
    implements ThingDetailBloc {}

class MockThingExerciseBloc
    extends MockBloc<ThingExerciseEvent, ThingExerciseState>
    implements ThingExerciseBloc {}

class MockDiscoverRepository extends Mock implements DiscoverRepository {}

class MockDiscoverRemoteDataSource extends Mock
    implements DiscoverRemoteDataSource {}

class MockDiscoverBloc extends MockBloc<DiscoverEvent, DiscoverState>
    implements DiscoverBloc {}
