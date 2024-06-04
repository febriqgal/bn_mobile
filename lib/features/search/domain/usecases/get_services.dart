import '../../data/repositories/services_repository_impl.dart';

class GetServices {
  final ServicesRepositoryImplement repository;
  GetServices({required this.repository});
  List<Map<String, dynamic>> call() {
    return repository.getServices();
  }
}
