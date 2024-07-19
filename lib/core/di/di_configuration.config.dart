// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:news_app/data/mapper/data_to_domain_mapper.dart' as _i3;
import 'package:news_app/data/model/remote_article.dart' as _i6;
import 'package:news_app/data/model/remote_articles.dart' as _i7;
import 'package:news_app/data/model/remote_multimedia.dart' as _i8;
import 'package:news_app/data/repo/repository_impl.dart' as _i14;
import 'package:news_app/data/source/local/local_source.dart' as _i4;
import 'package:news_app/data/source/local/local_source_impl.dart' as _i5;
import 'package:news_app/data/source/remote/remote_source.dart' as _i9;
import 'package:news_app/data/source/remote/remote_source_impl.dart' as _i10;
import 'package:news_app/data/store/data_store.dart' as _i11;
import 'package:news_app/data/store/data_store_impl.dart' as _i12;
import 'package:news_app/domain/interactor/article_details_use_case.dart'
    as _i15;
import 'package:news_app/domain/interactor/article_details_use_case_impl.dart'
    as _i16;
import 'package:news_app/domain/interactor/articles_use_case.dart' as _i18;
import 'package:news_app/domain/interactor/articles_use_case_impl.dart' as _i19;
import 'package:news_app/domain/repo/repository.dart' as _i13;
import 'package:news_app/presentation/pages/article/detail/article_details_view_model.dart'
    as _i17;
import 'package:news_app/presentation/pages/article/list/article_list_view_model.dart'
    as _i20;

const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt $initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.DataToDomainMapper>(() => _i3.DataToDomainMapper());
    gh.lazySingleton<_i4.LocalSource>(() => _i5.LocalSourceImpl());
    gh.factoryParam<_i6.RemoteArticle, Map<String, dynamic>?, dynamic>((
      json,
      _,
    ) =>
        _i6.RemoteArticle.fromJson(json));
    gh.factoryParam<_i7.RemoteArticles, Map<String, dynamic>?, dynamic>((
      json,
      _,
    ) =>
        _i7.RemoteArticles.fromJson(json));
    gh.factoryParam<_i8.RemoteMultimedia, Map<String, dynamic>?, dynamic>((
      json,
      _,
    ) =>
        _i8.RemoteMultimedia.fromJson(json));
    gh.lazySingleton<_i9.RemoteSource>(
      () => _i10.RemoteSourceImpl(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i11.DataStore>(() => _i12.DataStoreImpl(
          gh<_i4.LocalSource>(),
          gh<_i9.RemoteSource>(),
        ));
    gh.factory<_i13.Repository>(() => _i14.RepositoryImpl(
          gh<_i11.DataStore>(),
          gh<_i3.DataToDomainMapper>(),
        ));
    gh.factory<_i15.ArticleDetailUseCase>(
        () => _i16.ArticleDetailsUseCaseImpl(gh<_i13.Repository>()));
    gh.factory<_i17.ArticleDetailsViewModel>(
        () => _i17.ArticleDetailsViewModel(gh<_i15.ArticleDetailUseCase>()));
    gh.factory<_i18.ArticlesUseCase>(
        () => _i19.ArticlesUseCaseImpl(gh<_i13.Repository>()));
    gh.factory<_i20.ArticleListViewModel>(
        () => _i20.ArticleListViewModel(gh<_i18.ArticlesUseCase>()));
    return this;
  }
}
