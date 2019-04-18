import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reddit.g.dart';

abstract class Reddit implements Built<Reddit, RedditBuilder> {
  Children get data;

  Reddit._();
  factory Reddit([updates(RedditBuilder)]) = _$Reddit;
  static Serializer<Reddit> get serializer => _$redditSerializer;
}

abstract class Children implements Built<Children, ChildrenBuilder> {
  BuiltList<Data> get children;

  Children._();
  factory Children([updates(ChildrenBuilder)]) = _$Children;
  static Serializer<Children> get serializer => _$childrenSerializer;
}

abstract class Data implements Built<Data, DataBuilder> {
  Post get data;

  Data._();
  factory Data([updates(DataBuilder)]) = _$Data;
  static Serializer<Data> get serializer => _$dataSerializer;
}

abstract class Post implements Built<Post, PostBuilder> {
  String get author;
  String get url;
  String get title;
  String get thumbnail;
  String get subreddit;
  int get ups;

  Post._();
  factory Post([updates(PostBuilder)]) = _$Post;
  static Serializer<Post> get serializer => _$postSerializer;
}
