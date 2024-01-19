import 'package:pagination_flutter/pagination/data/model/photos_model.dart';

class PhotoState {
  final List<Photos> photos;
  final bool hasReachedMax;
  final int page;
  final bool isLoading;

  PhotoState(
      {required this.photos,
      required this.hasReachedMax,
      required this.page,
      required this.isLoading});

  factory PhotoState.initial() {
    return PhotoState(
        photos: [], hasReachedMax: false, page: 0, isLoading: false);
  }

  PhotoState copyWith({
    List<Photos>? photos,
    bool? hasReachedMax,
    int? page,
    bool? isLoading,
  }) {
    return PhotoState(
        photos: photos ?? this.photos,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        page: page ?? this.page,
        isLoading: isLoading ?? this.isLoading);
  }
}
