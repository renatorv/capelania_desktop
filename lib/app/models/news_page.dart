import 'package:capelania_desktop/app/models/article_category.dart';
import 'package:fluent_ui/fluent_ui.dart';

class NewsPage {
  final String title;
  final IconData iconData;
  final ArticleCategory category;

  NewsPage({required this.title, required this.iconData, required this.category});
}
