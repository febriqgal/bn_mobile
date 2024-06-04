import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/services_repository_impl.dart';
import '../../domain/usecases/get_services.dart';

part 'services_provider.g.dart';

@riverpod
class Services extends _$Services {
  @override
  List<Map<String, dynamic>> build() {
    return GetServices(repository: ServicesRepositoryImplement()).call();
  }
}
