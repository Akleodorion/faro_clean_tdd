import 'package:faro_clean_tdd/features/user_authentification/presentation/providers/state/user_state.dart';
import 'package:riverpod/riverpod.dart';

import '../../../domain/usecases/log_user_in.dart';
import '../../../domain/usecases/sign_user_in.dart' as si;

class UserNotifier extends StateNotifier<UserState> {
  final LogUserIn logUserInUsecase;
  final si.SignUserIn signUserInUsecase;
  UserState get initialState => Initial();

  UserNotifier({
    required this.logUserInUsecase,
    required this.signUserInUsecase,
  }) : super(Initial());

  Future<void> logUserIn(String email, String password) async {
    state = Loading();
    final response =
        await logUserInUsecase.call(Params(email: email, password: password));

    response.fold((failure) {
      state = Error(message: "An error as occured");
    }, (user) {
      state = Loaded(user: user!);
    });
  }
}
