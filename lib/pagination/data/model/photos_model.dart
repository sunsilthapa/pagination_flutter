
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photos_model.g.dart';

@JsonSerializable()
class Photos extends Equatable {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photos(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

      factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);

      Map<String, dynamic> toJson()=> _$PhotosToJson(this);
      
        @override
        // TODO: implement props
        List<Object?> get props => throw UnimplementedError();
}
