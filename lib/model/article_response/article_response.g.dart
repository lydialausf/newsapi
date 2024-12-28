part of 'article_response.dart';

ArticleResponse _$ArticleResponseFromJson(Map<String, dynamic> json) =>
    ArticleResponse(
      sourceName: json['source']['id'] == null
          ? 'Unable to retrieve source name'
          : SourceResponse.fromJson(json['source'] as Map<String, dynamic>)
              .name,
      author: json['author'] == null
          ? 'Unable to retrive author'
          : json['author'] as String,
      title: json['title'] == null
          ? 'Unable to retrieve title'
          : json['title'] as String,
      description: json['description'] == null
          ? 'Unable to retrieve description'
          : json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] == null
          ? 'Unable to retrieve image'
          : json['urlToImage'] as String,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] == null
          ? 'Unable to retrieve content'
          : json['content'] as String,
    );

Map<String, dynamic> _$ArticleResponseToJson(ArticleResponse instance) =>
    <String, dynamic>{
      'sourceName': instance.sourceName,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'imageUrl': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
