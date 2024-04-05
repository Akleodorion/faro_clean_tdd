// Mocks generated by Mockito 5.4.4 from annotations
// in faro_clean_tdd/test/features/members/domain/usecases/fetch_members_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:faro_clean_tdd/core/errors/failures.dart' as _i5;
import 'package:faro_clean_tdd/features/members/data/models/member_model.dart'
    as _i6;
import 'package:faro_clean_tdd/features/members/domain/repositories/member_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

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

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MemberRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMemberRepository extends _i1.Mock implements _i3.MemberRepository {
  MockMemberRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.MemberModel>> createMember(
          {required _i6.MemberModel? member}) =>
      (super.noSuchMethod(
        Invocation.method(
          #createMember,
          [],
          {#member: member},
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.MemberModel>>.value(
            _FakeEither_0<_i5.Failure, _i6.MemberModel>(
          this,
          Invocation.method(
            #createMember,
            [],
            {#member: member},
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.MemberModel>>);

  @override
  _i4.Future<_i5.Failure?> deleteMember({required _i6.MemberModel? member}) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteMember,
          [],
          {#member: member},
        ),
        returnValue: _i4.Future<_i5.Failure?>.value(),
      ) as _i4.Future<_i5.Failure?>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.MemberModel>>> fetchMembers(
          {required int? userId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchMembers,
          [],
          {#userId: userId},
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.MemberModel>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.MemberModel>>(
          this,
          Invocation.method(
            #fetchMembers,
            [],
            {#userId: userId},
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.MemberModel>>>);
}
