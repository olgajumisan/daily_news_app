import 'package:json_annotation/json_annotation.dart';
import 'package:floor/floor.dart';
import 'package:structure_app/features/daily_news/domain/entities/article.dart';

part 'article.g.dart';

@Entity(tableName: 'article', primaryKeys: ['id'])
@JsonSerializable()
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int? id,
    required super.author,
    required super.title,
    required super.description,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) =>
      _$ArticleModelFromJson(map);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
        author: entity.author,
        title: entity.title,
        description: entity.description,
        url: entity.url,
        urlToImage: entity.urlToImage,
        publishedAt: entity.publishedAt,
        content: entity.content);
  }
}
