import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_flutter/core/failure/failure.dart';
import 'package:pagination_flutter/pagination/data/data_source/photos_data_source.dart';
import 'package:pagination_flutter/pagination/data/model/photos_model.dart';
import 'package:pagination_flutter/pagination/domain/repository/photo_repository.dart';

final photRepImplProvider = Provider<PhotosRepoImpl>((ref) => PhotosRepoImpl(photosDataSource: ref.read(photosDataSourceProvider)));

class PhotosRepoImpl  implements PhotosRepository{
  final PhotosDataSource photosDataSource;

  PhotosRepoImpl({required this.photosDataSource});
  
  @override
  Future<Either<Failure, List<Photos>>> getPhotos(int page) {
    // TODO: implement getPhotos
  return photosDataSource.getPhotos(page);
  }

}