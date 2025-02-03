// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodoNotifier {
  List<dynamic> get todos => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Create a copy of TodoNotifier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoNotifierCopyWith<TodoNotifier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoNotifierCopyWith<$Res> {
  factory $TodoNotifierCopyWith(
          TodoNotifier value, $Res Function(TodoNotifier) then) =
      _$TodoNotifierCopyWithImpl<$Res, TodoNotifier>;
  @useResult
  $Res call({List<dynamic> todos, String title, String description});
}

/// @nodoc
class _$TodoNotifierCopyWithImpl<$Res, $Val extends TodoNotifier>
    implements $TodoNotifierCopyWith<$Res> {
  _$TodoNotifierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoNotifier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      todos: null == todos
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoNotifierImplCopyWith<$Res>
    implements $TodoNotifierCopyWith<$Res> {
  factory _$$TodoNotifierImplCopyWith(
          _$TodoNotifierImpl value, $Res Function(_$TodoNotifierImpl) then) =
      __$$TodoNotifierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic> todos, String title, String description});
}

/// @nodoc
class __$$TodoNotifierImplCopyWithImpl<$Res>
    extends _$TodoNotifierCopyWithImpl<$Res, _$TodoNotifierImpl>
    implements _$$TodoNotifierImplCopyWith<$Res> {
  __$$TodoNotifierImplCopyWithImpl(
      _$TodoNotifierImpl _value, $Res Function(_$TodoNotifierImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoNotifier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$TodoNotifierImpl(
      todos: null == todos
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TodoNotifierImpl implements _TodoNotifier {
  _$TodoNotifierImpl(
      {required final List<dynamic> todos,
      required this.title,
      required this.description})
      : _todos = todos;

  final List<dynamic> _todos;
  @override
  List<dynamic> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'TodoNotifier(todos: $todos, title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoNotifierImpl &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_todos), title, description);

  /// Create a copy of TodoNotifier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoNotifierImplCopyWith<_$TodoNotifierImpl> get copyWith =>
      __$$TodoNotifierImplCopyWithImpl<_$TodoNotifierImpl>(this, _$identity);
}

abstract class _TodoNotifier implements TodoNotifier {
  factory _TodoNotifier(
      {required final List<dynamic> todos,
      required final String title,
      required final String description}) = _$TodoNotifierImpl;

  @override
  List<dynamic> get todos;
  @override
  String get title;
  @override
  String get description;

  /// Create a copy of TodoNotifier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoNotifierImplCopyWith<_$TodoNotifierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
