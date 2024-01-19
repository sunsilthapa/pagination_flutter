


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_flutter/pagination/domain/repository/photo_repository.dart';

final getAllPhotoUsecaseProvider = Provider<GetAllPhotosUsecase>((ref) => GetAllPhotosUsecase(photosRepository: ref.read(photoRepositoryProvider)));
class GetAllPhotosUsecase{
  final PhotosRepository _photosRepository;

  GetAllPhotosUsecase({required PhotosRepository photosRepository}) : _photosRepository = photosRepository;


Future getAllPhotos(int page){
  return _photosRepository.getPhotos(page);
}
}