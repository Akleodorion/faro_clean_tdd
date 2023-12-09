import 'package:dartz/dartz.dart';
import 'package:faro_clean_tdd/core/errors/exceptions.dart';
import 'package:faro_clean_tdd/core/errors/failures.dart';
import 'package:faro_clean_tdd/features/address/data/datasources/address_remote_data_source.dart';
import 'package:faro_clean_tdd/features/address/domain/entities/address.dart';
import 'package:faro_clean_tdd/features/address/domain/repositories/address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  AddressRepositoryImpl({required this.remoteDataSource});

  final AddressRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, Address>> getCurrentLocationAddress() async {
    try {
      final response =
          await remoteDataSource.fetchAddressDataFromCurrentLocation();

      return Right(response);
    } on ServerException catch (error) {
      return Left(ServerFailure(errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<Failure, Address>> getSelectedLocationAddress(
      double latitude, double longitude) async {
    try {
      final response =
          await remoteDataSource.fetchAddressDataFromMap(latitude, longitude);

      return Right(response);
    } on ServerException catch (error) {
      return Left(ServerFailure(errorMessage: error.errorMessage));
    }
  }
}
