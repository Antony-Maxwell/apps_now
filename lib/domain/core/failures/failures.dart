import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
  const factory MainFailure.clientFailure() = _MainFailure;
  const factory MainFailure.serverFailure() = _ServerFailure;
}
