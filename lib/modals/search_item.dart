library search_item;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:voice_based_app/modals/search_snippet.dart';
import 'package:voice_based_app/serializer/serializers.dart';
import 'id.dart';

part 'search_item.g.dart';

abstract class SearchItem implements Built<SearchItem, SearchItemBuilder> {
  Id get id;
  SearchSnippet get snippet;
  SearchItem._();

  factory SearchItem([updates(SearchItemBuilder builder)]) = _$SearchItem;

  String toJson() {
    return json.encode(serializers.serializeWith(SearchItem.serializer, this));
  }

  static SearchItem fromJson(String jsonString) {
    return serializers.deserializeWith(SearchItem.serializer, json.decode(jsonString));
  }

  static Serializer<SearchItem> get serializer => _$searchItemSerializer;
}