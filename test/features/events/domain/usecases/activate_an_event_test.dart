import 'package:dartz/dartz.dart';
import 'package:faro_clean_tdd/core/errors/failures.dart';
import 'package:faro_clean_tdd/features/events/domain/entities/event.dart';
import 'package:faro_clean_tdd/features/events/domain/repositories/event_repository.dart';
import 'package:faro_clean_tdd/features/events/domain/usecases/activate_an_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'activate_an_event_test.mocks.dart';

@GenerateMocks([EventRepository])
void main() {
  late MockEventRepository mockEventRepository;
  late ActivateAnEvent usecase;

  setUp(() {
    mockEventRepository = MockEventRepository();
    usecase = ActivateAnEvent(repository: mockEventRepository);
  });

  group(
    "execute",
    () {
      const int tEventId = 1;
      const int tUserId = 1;
      Event tEvent = Event(
          name: "name",
          eventId: tEventId,
          description: "description",
          date: DateTime.now(),
          address: "address",
          latitude: 10.5264,
          longitude: 20.4585,
          category: Category.concert,
          imageUrl: "imageUrl",
          userId: tUserId,
          modelEco: ModelEco.gratuit,
          standardTicketPrice: 5000,
          maxStandardTicket: 10,
          standardTicketDescription: "standardTicketDescription",
          vipTicketPrice: 10000,
          maxVipTicket: 5,
          vipTicketDescription: "vipTicketDescription",
          vvipTicketPrice: 15000,
          maxVvipTicket: 5,
          vvipTicketDescription: "vvipTicketDescription");
      test(
        "should return a valid Event when call is successful",
        () async {
          //arrange
          when(mockEventRepository.activateAnEvent(
                  eventId: anyNamed('eventId'), userId: anyNamed('userId')))
              .thenAnswer((_) async => Right(tEvent));
          //act
          final result =
              await usecase.execute(eventId: tEventId, userId: tUserId);
          //assert
          expect(result, Right(tEvent));
          verify(mockEventRepository.activateAnEvent(
              eventId: tEventId, userId: tUserId));
        },
      );

      test(
        "should return a failure with an error message",
        () async {
          //arrange
          when(mockEventRepository.activateAnEvent(
                  eventId: anyNamed('eventId'), userId: anyNamed('userId')))
              .thenAnswer((_) async =>
                  const Left(ServerFailure(errorMessage: 'oops ')));
          //act
          final result =
              await usecase.execute(eventId: tEventId, userId: tUserId);
          //assert
          expect(result, const Left(ServerFailure(errorMessage: 'oops ')));
          verify(mockEventRepository.activateAnEvent(
                  eventId: tEventId, userId: tUserId))
              .called(1);
        },
      );
    },
  );
}
