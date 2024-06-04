import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../search/presentation/providers/services_provider.dart';

part 'get_service_by_query_group_controller.g.dart';

@riverpod
class GetServiceByQueryGroup extends _$GetServiceByQueryGroup {
  @override
  List<Map<String, dynamic>> build(String group) {
    final data = ref
        .watch(servicesProvider)
        .where((element) =>
            element['group'].toString().toLowerCase().contains(group))
        .toList();
    return data;
  }
}
