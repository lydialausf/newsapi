import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:news_api/model/model.dart';

part 'article_response.g.dart';

/// {@template article_response}
/// ArticleResponse description
/// {@endtemplate}
@JsonSerializable()
class ArticleResponse extends Equatable {
  /// {@macro article_response}
  const ArticleResponse({
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  /// Creates a ArticleResponse from Json map
  factory ArticleResponse.fromJson(Map<String, dynamic> data) =>
      _$ArticleResponseFromJson(data);

  /// A description for sourceName

  final String sourceName;

  /// A description for author
  @JsonKey(name: 'author')
  final String author;

  /// A description for title
  @JsonKey(name: 'title')
  final String title;

  /// A description for description
  @JsonKey(name: 'description')
  final String description;

  /// A description for url
  @JsonKey(name: 'url')
  final String url;

  /// A description for urlToImage

  final String urlToImage;

  /// A description for publishedAt

  final String publishedAt;

  /// A description for content
  @JsonKey(name: 'content')
  final String content;

  /// Creates a copy of the current ArticleResponse with property changes
  ArticleResponse copyWith({
    String? sourceName,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) {
    return ArticleResponse(
      sourceName: sourceName ?? this.sourceName,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }

  @override
  List<Object?> get props => [
        sourceName,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];

  /// Creates a Json map from a ArticleResponse
  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);

  /// Creates a toString() override for ArticleResponse
  @override
  String toString() =>
      'ArticleResponse(sourceName: $sourceName, author: $author, title: $title, description: $description, url: $url, imageUrl: $urlToImage, publishedAt: $publishedAt, content: $content,)';
}
