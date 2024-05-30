// Mocks generated by Mockito 5.4.4 from annotations
// in faro_clean_tdd/test/features/user_authentification/presentation/providers/user_auth/state/user_notifier_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes

// Dart imports:
import 'dart:async' as _i5;

// Package imports:
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// Project imports:
import 'package:faro_faro/core/errors/failures.dart' as _i6;

import 'package:faro_faro/features/user_authentification/domain/entities/user.dart'
    as _i7;
import 'package:faro_faro/features/user_authentification/domain/repositories/user_authentification_repository.dart'
    as _i2;
import 'package:faro_faro/features/user_authentification/domain/usecases/get_user_info.dart'
    as _i9;
import 'package:faro_faro/features/user_authentification/domain/usecases/log_in_with_token.dart'
    as _i10;
import 'package:faro_faro/features/user_authentification/domain/usecases/log_user_in.dart'
    as _i4;
import 'package:faro_faro/features/user_authentification/domain/usecases/log_user_out.dart'
    as _i11;
import 'package:faro_faro/features/user_authentification/domain/usecases/sign_user_in.dart'
    as _i8;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUserAuthentificationRepository_0 extends _i1.SmartFake
    implements _i2.UserAuthentificationRepository {
  _FakeUserAuthentificationRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [LogUserIn].
///
/// See the documentation for Mockito's code generation for more information.
class MockLogUserIn extends _i1.Mock implements _i4.LogUserIn {
  MockLogUserIn() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.UserAuthentificationRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeUserAuthentificationRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.UserAuthentificationRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.User?>> call(_i4.Params? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.User?>>.value(
            _FakeEither_1<_i6.Failure, _i7.User?>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.User?>>);
}

/// A class which mocks [SignUserIn].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignUserIn extends _i1.Mock implements _i8.SignUserIn {
  MockSignUserIn() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.UserAuthentificationRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeUserAuthentificationRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.UserAuthentificationRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.User?>> call(_i8.Params? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.User?>>.value(
            _FakeEither_1<_i6.Failure, _i7.User?>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.User?>>);
}

/// A class which mocks [GetUserInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetUserInfo extends _i1.Mock implements _i9.GetUserInfo {
  MockGetUserInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.UserAuthentificationRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeUserAuthentificationRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.UserAuthentificationRepository);

  @override
  _i5.Future<Map<String, dynamic>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue:
            _i5.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i5.Future<Map<String, dynamic>>);
}

/// A class which mocks [LogInWithToken].
///
/// See the documentation for Mockito's code generation for more information.
class MockLogInWithToken extends _i1.Mock implements _i10.LogInWithToken {
  MockLogInWithToken() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.UserAuthentificationRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeUserAuthentificationRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.UserAuthentificationRepository);

  @override
  _i5.Future<_i7.User?> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i5.Future<_i7.User?>.value(),
      ) as _i5.Future<_i7.User?>);
}

/// A class which mocks [LogUserOutUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockLogUserOutUsecase extends _i1.Mock implements _i11.LogUserOutUsecase {
  MockLogUserOutUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.UserAuthentificationRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeUserAuthentificationRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.UserAuthentificationRepository);

  @override
  _i5.Future<_i6.Failure?> execute({required String? jwt}) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {#jwt: jwt},
        ),
        returnValue: _i5.Future<_i6.Failure?>.value(),
      ) as _i5.Future<_i6.Failure?>);
}
