// GENERATED CODE - DO NOT MODIFY BY HAND

part of id;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Id> _$idSerializer = new _$IdSerializer();

class _$IdSerializer implements StructuredSerializer<Id> {
  @override
  final Iterable<Type> types = const [Id, _$Id];
  @override
  final String wireName = 'Id';

  @override
  Iterable<Object> serialize(Serializers serializers, Id object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  Id deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new IdBuilder().build();
  }
}

class _$Id extends Id {
  factory _$Id([void Function(IdBuilder) updates]) =>
      (new IdBuilder()..update(updates)).build();

  _$Id._() : super._();

  @override
  Id rebuild(void Function(IdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IdBuilder toBuilder() => new IdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Id;
  }

  @override
  int get hashCode {
    return 587887538;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('Id').toString();
  }
}

class IdBuilder implements Builder<Id, IdBuilder> {
  _$Id _$v;

  IdBuilder();

  @override
  void replace(Id other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Id;
  }

  @override
  void update(void Function(IdBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Id build() {
    final _$result = _$v ?? new _$Id._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
