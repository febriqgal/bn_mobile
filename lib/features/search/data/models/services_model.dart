import 'package:freezed_annotation/freezed_annotation.dart';

part 'services_model.freezed.dart';
part 'services_model.g.dart';

@freezed
class ServicesModel with _$ServicesModel {
  const factory ServicesModel({
    required String title,
    required String icon,
    required String pathName,
    required String group,
  }) = _ServicesModel;

  factory ServicesModel.fromJson(Map<String, dynamic> json) =>
      _$ServicesModelFromJson(json);
}
