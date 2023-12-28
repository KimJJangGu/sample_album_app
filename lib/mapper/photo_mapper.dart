import 'package:album_app/dto/photo_dto.dart';

import '../model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo dtoToPhoto() {
    return Photo(
      title: title ?? '',
      url: url ?? '',
      thumbnailUrl: thumbnailUrl ?? '',
    );
  }
}