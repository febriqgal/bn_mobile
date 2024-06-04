import '../../domain/repositories/services_repository.dart';
import '../datasources/local/services_local_datasource.dart';

class ServicesRepositoryImplement implements ServicesRepository {
  @override
  List<Map<String, dynamic>> getServices() {
    return ServicesLocalDataSource.services;
  }
}
