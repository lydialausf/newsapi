import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


part 'source_response.g.dart';

/// {@template source_response}
/// SourceResponse description
/// {@endtemplate}
@JsonSerializable()
class SourceResponse extends Equatable {
  /// {@macro source_response}
  const SourceResponse({ 
  required this.id,
  required this.name,
  });

    /// Creates a SourceResponse from Json map
  factory SourceResponse.fromJson(Map<String, dynamic> data) => _$SourceResponseFromJson(data);

  /// A description for id
  @JsonKey(name: 'id')
  final String id;

  /// A description for name
  @JsonKey(name: 'name')
  final String name;

    /// Creates a copy of the current SourceResponse with property changes
  SourceResponse copyWith({ 
    String? id,
    String? name,
  }) {
    return SourceResponse(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }


    @override
  List<Object?> get props => [
        id,
        name,
      ];

    /// Creates a Json map from a SourceResponse
  Map<String, dynamic> toJson() => _$SourceResponseToJson(this);

    /// Creates a toString() override for SourceResponse
  @override
  String toString() => 'SourceResponse(id: $id, name: $name)';
}
