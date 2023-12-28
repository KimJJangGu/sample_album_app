class AlbumDto {
  num? userId;
  num? id;
  String? title;

  AlbumDto(
    this.userId,
    this.id,
    this.title,
  );

  AlbumDto.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    return map;
  }

  @override
  String toString() {
    return 'AlbumDto{userId: $userId, id: $id, title: $title}';
  }
}
