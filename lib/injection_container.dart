import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:structure_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:structure_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:structure_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:structure_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:structure_app/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:structure_app/features/daily_news/domain/usecases/remove_article.dart';
import 'package:structure_app/features/daily_news/domain/usecases/save_article.dart';
import 'package:structure_app/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:structure_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'features/daily_news/data/data_sources/local/app_database.dart';

final inst = GetIt.instance;

Future<void> initializeDependencies() async {
  inst.registerSingleton<Dio>(Dio());
  inst.registerSingleton<NewsApiService>(NewsApiService(inst()));
  inst.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(inst(), inst()));

  inst.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(inst()));

  final database =
      await $FloorAppdatabase.databaseBuilder('app_database.db').build();
  inst.registerSingleton<Appdatabase>(database);

  inst.registerSingleton<GetArticleUseCase>(GetArticleUseCase(inst()));
  inst.registerSingleton<GetSavedArticleUseCase>(
      GetSavedArticleUseCase(inst()));
  inst.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(inst()));
  inst.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(inst()));

  inst.registerFactory<LocalArticlesBloc>(
      () => LocalArticlesBloc(inst(), inst(), inst()));
}
