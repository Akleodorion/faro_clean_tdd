import 'package:dartz/dartz.dart';
import 'package:faro_clean_tdd/core/errors/failures.dart';
import 'package:faro_clean_tdd/features/events/domain/entities/event.dart';
import 'package:faro_clean_tdd/features/events/domain/repositories/event_repository.dart';
import 'package:faro_clean_tdd/features/events/domain/usecases/fetch_all_events.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'fetch_all_events_test.mocks.dart';

@GenerateMocks([EventRepository])
void main() {
  late MockEventRepository mockEventRepository;
  late FetchAllEvents usecase;

  setUp(() {
    mockEventRepository = MockEventRepository();
    usecase = FetchAllEvents(repository: mockEventRepository);
  });

  final tEvent1 = Event(
      name: 'Event 1',
      eventId: 1,
      description: 'short description',
      date: DateTime.now(),
      location: 'Lille',
      category: Category.concert,
      imageUrl: 'imageUrl',
      userId: 1,
      modelEco: ModelEco.gratuit);

  final tEvent2 = Event(
      name: 'Event 2',
      eventId: 2,
      description: 'short description',
      date: DateTime.now(),
      location: 'Arras',
      category: Category.culture,
      imageUrl: 'imageUrl',
      userId: 1,
      modelEco: ModelEco.payant);

  final tEvents = [tEvent1, tEvent2];

  group(
    "execute",
    () {
      test(
        "should return the right list of Events",
        () async {
          //arrange
          when(mockEventRepository.fetchAllEvents())
              .thenAnswer((realInvocation) async => Right(tEvents));
          //act
          final result = await usecase.execute();
          //assert
          expect(result, Right(tEvents));
          verify(mockEventRepository.fetchAllEvents()).called(1);
        },
      );

      test(
        "should return the right failure message is the request is unsuccesfful",
        () async {
          when(mockEventRepository.fetchAllEvents()).thenAnswer(
              (realInvocation) async => const Left(
                  ServerFailure(errorMessage: "An error has occured")));
          //act
          final result = await usecase.execute();
          //assert
          expect(result,
              const Left(ServerFailure(errorMessage: "An error has occured")));
          verify(mockEventRepository.fetchAllEvents()).called(1);
        },
      );
    },
  );
}
