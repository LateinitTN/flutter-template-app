class AlbumResponse {
  final int userId;
  final int id;
  final String title;

  AlbumResponse({this.userId, this.id, this.title});

  factory AlbumResponse.fromJson(Map<String, dynamic> json) {
    return AlbumResponse(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
