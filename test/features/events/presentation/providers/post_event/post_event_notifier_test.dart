import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:faro_clean_tdd/core/errors/failures.dart';
import 'package:faro_clean_tdd/features/events/data/models/event_model.dart';
import 'package:faro_clean_tdd/features/events/domain/entities/event.dart';
import 'package:faro_clean_tdd/features/events/domain/usecases/post_an_event.dart';
import 'package:faro_clean_tdd/features/events/presentation/providers/post_event/state/post_event_notifier.dart';
import 'package:faro_clean_tdd/features/events/presentation/providers/post_event/state/post_event_state.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'post_event_notifier_test.mocks.dart';

@GenerateMocks([PostAnEvent])
void main() {
  late MockPostAnEvent mockPostAnEvent;
  late PostEventNotifier postEventNotifier;

  setUpAll(() {
    mockPostAnEvent = MockPostAnEvent();
    postEventNotifier = PostEventNotifier(postAnEventUsecase: mockPostAnEvent);
  });

  // Usecases tests
  test(
    "initialState should be Loading",
    () async {
      //assert
      expect(postEventNotifier.initialState, Initial(infoMap: const {}));
    },
  );

  group('postAnEvent', () {
    final tEvent = EventModel(
        name: "My test event",
        eventId: 20,
        description: "Short description for the test event !",
        date: DateTime.now(),
        address: "Lille",
        latitude: 42.54596,
        longitude: -127.5345,
        category: Category.concert,
        imageUrl: "flyers.jpg",
        userId: 1,
        modelEco: ModelEco.gratuit,
        standardTicketPrice: 5000,
        maxStandardTicket: 15,
        standardTicketDescription: "Short ticket description for the test",
        vipTicketPrice: 5000,
        maxVipTicket: 15,
        vipTicketDescription: "Short ticket description for the test",
        vvipTicketPrice: 5000,
        maxVvipTicket: 15,
        vvipTicketDescription: "Short ticket description for the test");

    final tImage = File('flyers.jpg');

    test(
      "should emit [Loading, Loaded] if the request is successfull ",
      () async {
        //arrange
        when(mockPostAnEvent.execute(event: tEvent, image: tImage))
            .thenAnswer((_) async => Right(tEvent));
        //assert
        final expectedState = [Loading(), Loaded(event: tEvent)];
        expectLater(postEventNotifier.stream, emitsInOrder(expectedState));
        // act
        await postEventNotifier.postAnEvent(event: tEvent, image: tImage);
      },
    );

    test(
      "should emit [Error] if the request is unsuccessful",
      () async {
        //arrange
        when(mockPostAnEvent.execute(event: tEvent, image: tImage)).thenAnswer(
            (realInvocation) async => const Left(
                ServerFailure(errorMessage: "an error has occured")));
        //act
        final expectedState = [
          Loading(),
          Error(infoMap: const {}, message: "an error has occured")
        ];
        expectLater(postEventNotifier.stream, emitsInOrder(expectedState));
        //assert
        await postEventNotifier.postAnEvent(event: tEvent, image: tImage);
      },
    );
  });
}