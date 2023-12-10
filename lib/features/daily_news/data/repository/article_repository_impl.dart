import 'dart:io';
import 'package:dio/dio.dart';
import 'package:structure_app/core/constants/constants.dart';
import 'package:structure_app/core/resources/data_state.dart';
import 'package:structure_app/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:structure_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:structure_app/features/daily_news/data/models/article.dart';
import 'package:structure_app/features/daily_news/domain/entities/article.dart';
import 'package:structure_app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final Appdatabase _appdatabase;

  ArticleRepositoryImpl(this._newsApiService, this._appdatabase);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponce = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponce != null) {
        if (httpResponce.response.statusCode == HttpStatus.ok) {
          return DataSuccess(httpResponce.data);
        } else {
          return DataFailed(
            DioException(
              error: httpResponce.response.statusMessage,
              requestOptions: httpResponce.response.requestOptions,
              response: httpResponce.response,
              type: DioExceptionType.badResponse,
            ),
          );
        }
      } else {
        return DataFailed(
          DioException(
            error: null,
            requestOptions: RequestOptions(),
            response: null,
            type: DioExceptionType.unknown,
          ),
        );
      }
    } on DioException catch (exception) {
      return DataFailed(exception);
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticled() async {
    return _appdatabase.articleDAO.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appdatabase.articleDAO
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appdatabase.articleDAO
        .insertArticle(ArticleModel.fromEntity(article));
  }
}
