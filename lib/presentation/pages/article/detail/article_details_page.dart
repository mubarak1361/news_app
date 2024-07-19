import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/model/article_details.dart';
import 'package:news_app/presentation/gen/assets.gen.dart';
import 'package:news_app/presentation/pages/article/detail/article_details_view_model.dart';
import 'package:news_app/presentation/utils/app_colors.dart';
import 'package:news_app/presentation/utils/app_text_style.dart';
import 'package:news_app/presentation/widget/app_bar.dart';
import 'package:news_app/presentation/widget/responsive_layout.dart';
import 'package:news_app/presentation/widget/result_view.dart';

class ArticleDetailsPage extends ResultView<ArticleDetailsViewModel,ArticleDetails>{

  static const routeName = '/article-details';
  final int id;

  ArticleDetailsPage({required this.id, super.key});

  @override
  Widget? getHeaderView(BuildContext context) {
    return appBar(context: context,title: 'Details',centerTitle: false, enableBackAction: true);
  }

  @override
  Widget onBuild(BuildContext context, ArticleDetailsViewModel viewModel,ArticleDetails result) {
    return ResponsiveLayout(child: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(result.title, style: getText16Bold(), softWrap: true),
          ),
          CachedNetworkImage(
              imageUrl: result.image,
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
            padding: const EdgeInsets.only(top: 2.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(result.imageCaption, style: getText12Regular().copyWith(color: AppColors.halfGrey))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text('Region: ${result.region}', style: getText14Bold())),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(result.description, style: getText14Regular()),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text(result.author, style: getText14Regular().copyWith(color: AppColors.halfGrey)),
          ),
          Text('Published on ${result.publishedDat}', style: getText14Regular().copyWith(color: AppColors.halfGrey)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22.0),
            child: Text('Copyrights: ${result.imageCopyright}', style: getText14Bold()),
          )
          //Expanded(child: Text(result.imageCopyright, style: getText14Regular()))
        ],
      ),
    ));
  }

  @override
  void onStart(BuildContext context, ArticleDetailsViewModel viewModel) {
    viewModel.loadArticleDetails(id);
  }
}