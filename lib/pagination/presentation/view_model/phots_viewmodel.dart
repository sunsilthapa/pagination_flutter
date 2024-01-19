import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_flutter/pagination/domain/usecase/get_all_photos_usecase.dart';
import 'package:pagination_flutter/pagination/presentation/state/photos_state.dart';

final photosViewModelProvider =
    StateNotifierProvider<PhotoViewModel, PhotoState>((ref) {
  final getPhotoUsecase = ref.read(getAllPhotoUsecaseProvider);
  return PhotoViewModel(getPhotoUsecase);
});

class PhotoViewModel extends StateNotifier<PhotoState> {
  final GetAllPhotosUsecase _getAllPhotosUsecase;
  PhotoViewModel(
    this._getAllPhotosUsecase,
  ) : super(
          PhotoState.initial(),
        ) {
    getPhotos();
  }

  Future resetState() async {
    state = PhotoState.initial();
    getPhotos();
  }

  Future getPhotos() async {
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page + 1;
    final photos = currentState.photos;
    final hasReachedMax = currentState.hasReachedMax;
    if (!hasReachedMax) {
      //* get data from data source
      final result = await _getAllPhotosUsecase.getAllPhotos(page);
      result.fold(
        (failure) =>
            state = state.copyWith(hasReachedMax: true, isLoading: false),
        (data) {
          if (data.isEmpty) {
            state = state.copyWith(hasReachedMax: true);
          } else {
            state = state.copyWith(
              photos: [...photos, ...data],
              page: page,
              isLoading: false,
            );
          }
        },
      );
    }
  }
}
