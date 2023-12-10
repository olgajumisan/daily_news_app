import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:structure_app/config/theme/app_theme.dart';
import 'package:structure_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:structure_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:structure_app/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:structure_app/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => inst()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        title: 'Flutter Demo',
        theme: appTheme(),
        home: const DailyNews(),
      ),
    );
  }
}
