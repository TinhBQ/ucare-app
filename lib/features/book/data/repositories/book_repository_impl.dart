import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';

import '../../domain/repository/book_repository.dart';
import '../datasources/book_remote_data_source.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource bookRemoteDataSource;

  BookRepositoryImpl(this.bookRemoteDataSource);

  @override
  Future<Either<Failure, CountryGetItem>> getCountries() async {
    try {
      final countryGetItem = await bookRemoteDataSource.getCountries();
      return right(countryGetItem!);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
