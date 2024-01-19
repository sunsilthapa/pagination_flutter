



import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_flutter/config/api_endpoints.dart';
import 'package:pagination_flutter/config/http_service.dart';
import 'package:pagination_flutter/core/failure/failure.dart';
import 'package:pagination_flutter/pagination/data/model/photos_model.dart';

final photosDataSourceProvider = Provider((ref) => 
PhotosDataSource(ref.read(httpServiceProvider)));


class PhotosDataSource{
  final Dio _dio;

  PhotosDataSource( this._dio);

  //* get photos from 
  Future<Either<Failure, List<Photos>>> getPhotos(int page) async{
    try{
      final response = await _dio.get(ApiEndpoints.photos,
      queryParameters: {
        "_page": page,
        "_limit": ApiEndpoints.limitPage,
      });
      final data  = response.data as List;
      final photos = data.map((e) => Photos.fromJson(e)).toList();
      return Right(photos);
    }on DioException catch(e){
      return Left(Failure(message: e.message.toString()));
    }
  }


}