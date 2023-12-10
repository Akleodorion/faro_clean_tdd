import 'package:faro_clean_tdd/core/errors/failures.dart';
import 'package:faro_clean_tdd/features/members/data/models/member_model.dart';
import 'package:faro_clean_tdd/features/members/domain/usecases/create_member_usecase.dart';
import 'package:faro_clean_tdd/features/members/presentation/providers/create_member/state/create_member_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateMemberNotifier extends StateNotifier<CreateMemberState> {
  CreateMemberNotifier({required this.usecase}) : super(Initial());
  final CreateMemberUsecase usecase;

  CreateMemberState get initialState => Initial();

  Future<CreateMemberState> createMember({required MemberModel member}) async {
    state = Loading();
    final result = await usecase.execute(member: member);
    result.fold((error) {
      if (error is ServerFailure) {
        state = Error(message: error.errorMessage);
      }
    }, (member) {
      state = Loaded(
          member: member, message: "Le membre a été ajouté avec succès!");
    });
    return state;
  }
}
