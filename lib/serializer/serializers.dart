library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:voice_based_app/modals/id.dart';
import 'package:voice_based_app/modals/search_item.dart';
import 'package:voice_based_app/modals/search_snippet.dart';
import 'package:voice_based_app/modals/thumbnail.dart';
import 'package:voice_based_app/modals/thumbnails.dart';
import 'package:voice_based_app/modals/youtube_search_result.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  YoutubeSearchResult,
  SearchItem,
  Id,
  SearchSnippet,
  Thumbnail,
  Thumbnails,
])

final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();