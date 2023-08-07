// Mocks generated by Mockito 5.4.2 from annotations
// in faro_clean_tdd/test/features/user_authentification/domain/usecases/log_user_in_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:dartz/dartz.dart' as _i4;
import 'package:faro_clean_tdd/core/errors/failures.dart' as _i5;
import 'package:faro_clean_tdd/features/user_authentification/domain/repositories/user_authentification_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [UserAuthentificationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserAuthentificationRepository extends _i1.Mock
    implements _i2.UserAuthentificationRepository {
  MockUserAuthentificationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Either<_i5.Failure, void>>? logUserIn(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(Invocation.method(
        #logUserIn,
        [
          email,
          password,
        ],
      )) as _i3.Future<_i4.Either<_i5.Failure, void>>?);
  @override
  _i3.Future<_i4.Either<_i5.Failure, void>>? signUserIn(
    String? email,
    String? password,
    String? username,
    String? phoneNumber,
  ) =>
      (super.noSuchMethod(Invocation.method(
        #signUserIn,
        [
          email,
          password,
          username,
          phoneNumber,
        ],
      )) as _i3.Future<_i4.Either<_i5.Failure, void>>?);
}
