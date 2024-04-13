import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_ahmed/data/api_manager.dart';
import 'package:news_ahmed/model/ArticalResponse.dart';
import 'package:news_ahmed/ui/widgets/app_loader.dart';

import '../../widgets/app_error.dart';

class TabDetails extends StatelessWidget {
  final String sourceId;

  const TabDetails({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.loadArticalList(sourceId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return AppError(error: snapshot.error.toString());
          } else if (snapshot.hasData) {
            return articalsList(snapshot.data!.articles!);
          } else {
            return const AppLoader();
          }
        });
  }

  Widget articalsList(List<Articles?> articles) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return articleWidget(context, articles[index]!);
        });
  }

  Widget articleWidget(BuildContext context, Articles article) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: article.urlToImage!,
            height: MediaQuery.of(context).size.height * .25,
            errorWidget: (_, __, ___) => const Center(child: Icon(Icons.error)),
            placeholder: (_, __) =>
                const Center(child: CircularProgressIndicator()),
          ),
          Text(
            article.source?.name ?? '',
            textAlign: TextAlign.start,
          ),
          Text(article.title ?? '', textAlign: TextAlign.start),
          Text(article.publishedAt ?? '', textAlign: TextAlign.end),
        ],
      ),
    );
  }
}
