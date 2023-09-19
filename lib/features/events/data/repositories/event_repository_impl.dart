import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/event_remote_data_source.dart';
import '../../domain/entities/event.dart';
import '../../domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final EventRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  EventRepositoryImpl(
      {required this.remoteDatasource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Event>>?> fetchAllEvents() async {
    if (await networkInfo.isConnected) {
      final events = await remoteDatasource.fetchAllEvents();
      return Right(events);
    } else {
      return const Left(ServerFailure(errorMessage: "No internet connexion"));
    }
  }
}