



import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_flutter/core/failure/failure.dart';
import 'package:pagination_flutter/pagination/data/model/photos_model.dart';
import 'package:pagination_flutter/pagination/data/repository/photos_repo_impl.dart';


final photoRepositoryProvider = Provider<PhotosRepository>((ref) => ref.read(photRepImplProvider));
abstract class PhotosRepository{
  Future<Either<Failure, List<Photos>>> getPhotos(int page);
}