import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/model/article.dart';
import 'package:news_app/presentation/gen/assets.gen.dart';
import 'package:news_app/presentation/pages/article/detail/article_details_page.dart';
import 'package:news_app/presentation/pages/article/list/article_list_view_model.dart';
import 'package:news_app/presentation/utils/app_text_style.dart';
import 'package:news_app/presentation/widget/app_bar.dart';
import 'package:news_app/presentation/widget/custom_material.dart';
import 'package:news_app/presentation/widget/responsive_layout.dart';
import 'package:news_app/presentation/widget/result_view.dart';
import 'package:news_app/presentation/widget/staggered_animation_separated_list_view.dart';
import 'package:path/path.dart';

import '../../../utils/app_colors.dart';

class ArticleListPage extends ResultView<ArticleListViewModel,List<Article>>{

  static const routeName = '/';

  ArticleListPage({super.key});

  @override
  Widget? getHeaderView(BuildContext context) {
    return appBar(context: context,title: 'Articles',centerTitle: false);
  }

  @override
  Widget onBuild(BuildContext context, ArticleListViewModel viewModel, List<Article> result) {
    return ResponsiveLayout(child: _buildListView(context,result));
  }

  @override
  void onStart(BuildContext context, ArticleListViewModel viewModel) {
    viewModel.loadArticles();
  }

  @override
  void onRefresh(BuildContext context, ArticleListViewModel viewModel) {
    viewModel.loadArticles();
  }

  Widget _buildListView(BuildContext context, List<Article> articles) {
    return StaggeredAnimationSeparatedListView(
      itemBuilder: (_, index) => _buildListTile(context: context, article: articles[index]),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      physics:
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: articles.length,
    );
  }

  Widget _buildListTile({required BuildContext context, required Article article}){
    return  CustomMaterial(
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, ArticleDetailsPage.routeName,
            arguments: article.id),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
                imageUrl: article.image,
                width: MediaQuery.of(context).size.width,
                height: 180.0,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                      child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          backgroundColor: Colors.white,
                          value: downloadProgress.progress),
                    ),
                errorWidget: (context, url, error) =>
                    Assets.svgs.common.noPreview.image(fit: BoxFit.scaleDown),
                fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(article.publishedDate, style: getText14Regular())),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(article.title, style: getText16Bold(), softWrap: true),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                      child: Text(article.author, style: getText12Regular())),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}