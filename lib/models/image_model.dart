class ImageModelListResponse {
  List<ImageModel> imageList = [];
  int? totalCount;

  ImageModelListResponse.fromJson(Map<String, dynamic> json) {
    if (json['hits'] is List) {
      (json['hits'] as List).forEach((element) {
        imageList.add(ImageModel.fromJson(element));
      });
    }
    totalCount = json['totalHits'];
  }
}

class ImageModel {
  int? id;
  int? views;
  int? likes;
  String? imageUrl;
  String? largeImageURL;

  ImageModel(
      {this.id, this.views, this.likes, this.largeImageURL, this.imageUrl});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    views = json['views'];
    likes = json['likes'];
    imageUrl = json['webformatURL'];
    largeImageURL = json['largeImageURL'];
  }
}
