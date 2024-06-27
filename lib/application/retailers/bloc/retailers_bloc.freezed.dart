// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'retailers_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RetailersEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RetailersEventCopyWith<$Res> {
  factory $RetailersEventCopyWith(
          RetailersEvent value, $Res Function(RetailersEvent) then) =
      _$RetailersEventCopyWithImpl<$Res, RetailersEvent>;
}

/// @nodoc
class _$RetailersEventCopyWithImpl<$Res, $Val extends RetailersEvent>
    implements $RetailersEventCopyWith<$Res> {
  _$RetailersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$RetailersEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializeImpl implements Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'RetailersEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initialize value) initialize,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initialize value)? initialize,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initialize value)? initialize,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class Initialize implements RetailersEvent {
  const factory Initialize() = _$InitializeImpl;
}

/// @nodoc
mixin _$RetailersState {
  List<Retailer> get reatailersList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RetailersStateCopyWith<RetailersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RetailersStateCopyWith<$Res> {
  factory $RetailersStateCopyWith(
          RetailersState value, $Res Function(RetailersState) then) =
      _$RetailersStateCopyWithImpl<$Res, RetailersState>;
  @useResult
  $Res call({List<Retailer> reatailersList, bool isLoading, bool hasError});
}

/// @nodoc
class _$RetailersStateCopyWithImpl<$Res, $Val extends RetailersState>
    implements $RetailersStateCopyWith<$Res> {
  _$RetailersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reatailersList = null,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(_value.copyWith(
      reatailersList: null == reatailersList
          ? _value.reatailersList
          : reatailersList // ignore: cast_nullable_to_non_nullable
              as List<Retailer>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RetailersStateImplCopyWith<$Res>
    implements $RetailersStateCopyWith<$Res> {
  factory _$$RetailersStateImplCopyWith(_$RetailersStateImpl value,
          $Res Function(_$RetailersStateImpl) then) =
      __$$RetailersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Retailer> reatailersList, bool isLoading, bool hasError});
}

/// @nodoc
class __$$RetailersStateImplCopyWithImpl<$Res>
    extends _$RetailersStateCopyWithImpl<$Res, _$RetailersStateImpl>
    implements _$$RetailersStateImplCopyWith<$Res> {
  __$$RetailersStateImplCopyWithImpl(
      _$RetailersStateImpl _value, $Res Function(_$RetailersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reatailersList = null,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(_$RetailersStateImpl(
      reatailersList: null == reatailersList
          ? _value._reatailersList
          : reatailersList // ignore: cast_nullable_to_non_nullable
              as List<Retailer>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RetailersStateImpl implements _RetailersState {
  const _$RetailersStateImpl(
      {required final List<Retailer> reatailersList,
      required this.isLoading,
      required this.hasError})
      : _reatailersList = reatailersList;

  final List<Retailer> _reatailersList;
  @override
  List<Retailer> get reatailersList {
    if (_reatailersList is EqualUnmodifiableListView) return _reatailersList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reatailersList);
  }

  @override
  final bool isLoading;
  @override
  final bool hasError;

  @override
  String toString() {
    return 'RetailersState(reatailersList: $reatailersList, isLoading: $isLoading, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RetailersStateImpl &&
            const DeepCollectionEquality()
                .equals(other._reatailersList, _reatailersList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reatailersList),
      isLoading,
      hasError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RetailersStateImplCopyWith<_$RetailersStateImpl> get copyWith =>
      __$$RetailersStateImplCopyWithImpl<_$RetailersStateImpl>(
          this, _$identity);
}

abstract class _RetailersState implements RetailersState {
  const factory _RetailersState(
      {required final List<Retailer> reatailersList,
      required final bool isLoading,
      required final bool hasError}) = _$RetailersStateImpl;

  @override
  List<Retailer> get reatailersList;
  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  @JsonKey(ignore: true)
  _$$RetailersStateImplCopyWith<_$RetailersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
