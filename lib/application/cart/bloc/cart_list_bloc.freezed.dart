// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartListEvent {
  String get userName => throw _privateConstructorUsedError;
  String get retailerName => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userName, String retailerName) initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userName, String retailerName)? initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userName, String retailerName)? initialize,
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

  @JsonKey(ignore: true)
  $CartListEventCopyWith<CartListEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartListEventCopyWith<$Res> {
  factory $CartListEventCopyWith(
          CartListEvent value, $Res Function(CartListEvent) then) =
      _$CartListEventCopyWithImpl<$Res, CartListEvent>;
  @useResult
  $Res call({String userName, String retailerName});
}

/// @nodoc
class _$CartListEventCopyWithImpl<$Res, $Val extends CartListEvent>
    implements $CartListEventCopyWith<$Res> {
  _$CartListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? retailerName = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      retailerName: null == retailerName
          ? _value.retailerName
          : retailerName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res>
    implements $CartListEventCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, String retailerName});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$CartListEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? retailerName = null,
  }) {
    return _then(_$InitializeImpl(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      retailerName: null == retailerName
          ? _value.retailerName
          : retailerName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements Initialize {
  const _$InitializeImpl({required this.userName, required this.retailerName});

  @override
  final String userName;
  @override
  final String retailerName;

  @override
  String toString() {
    return 'CartListEvent.initialize(userName: $userName, retailerName: $retailerName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.retailerName, retailerName) ||
                other.retailerName == retailerName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, retailerName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userName, String retailerName) initialize,
  }) {
    return initialize(userName, retailerName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userName, String retailerName)? initialize,
  }) {
    return initialize?.call(userName, retailerName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userName, String retailerName)? initialize,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(userName, retailerName);
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

abstract class Initialize implements CartListEvent {
  const factory Initialize(
      {required final String userName,
      required final String retailerName}) = _$InitializeImpl;

  @override
  String get userName;
  @override
  String get retailerName;
  @override
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartListState {
  List<Cart> get cartList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartListStateCopyWith<CartListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartListStateCopyWith<$Res> {
  factory $CartListStateCopyWith(
          CartListState value, $Res Function(CartListState) then) =
      _$CartListStateCopyWithImpl<$Res, CartListState>;
  @useResult
  $Res call({List<Cart> cartList, bool isLoading, bool hasError});
}

/// @nodoc
class _$CartListStateCopyWithImpl<$Res, $Val extends CartListState>
    implements $CartListStateCopyWith<$Res> {
  _$CartListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartList = null,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(_value.copyWith(
      cartList: null == cartList
          ? _value.cartList
          : cartList // ignore: cast_nullable_to_non_nullable
              as List<Cart>,
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
abstract class _$$CartListStateImplCopyWith<$Res>
    implements $CartListStateCopyWith<$Res> {
  factory _$$CartListStateImplCopyWith(
          _$CartListStateImpl value, $Res Function(_$CartListStateImpl) then) =
      __$$CartListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Cart> cartList, bool isLoading, bool hasError});
}

/// @nodoc
class __$$CartListStateImplCopyWithImpl<$Res>
    extends _$CartListStateCopyWithImpl<$Res, _$CartListStateImpl>
    implements _$$CartListStateImplCopyWith<$Res> {
  __$$CartListStateImplCopyWithImpl(
      _$CartListStateImpl _value, $Res Function(_$CartListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartList = null,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(_$CartListStateImpl(
      cartList: null == cartList
          ? _value._cartList
          : cartList // ignore: cast_nullable_to_non_nullable
              as List<Cart>,
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

class _$CartListStateImpl implements _CartListState {
  const _$CartListStateImpl(
      {required final List<Cart> cartList,
      required this.isLoading,
      required this.hasError})
      : _cartList = cartList;

  final List<Cart> _cartList;
  @override
  List<Cart> get cartList {
    if (_cartList is EqualUnmodifiableListView) return _cartList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartList);
  }

  @override
  final bool isLoading;
  @override
  final bool hasError;

  @override
  String toString() {
    return 'CartListState(cartList: $cartList, isLoading: $isLoading, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartListStateImpl &&
            const DeepCollectionEquality().equals(other._cartList, _cartList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_cartList), isLoading, hasError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartListStateImplCopyWith<_$CartListStateImpl> get copyWith =>
      __$$CartListStateImplCopyWithImpl<_$CartListStateImpl>(this, _$identity);
}

abstract class _CartListState implements CartListState {
  const factory _CartListState(
      {required final List<Cart> cartList,
      required final bool isLoading,
      required final bool hasError}) = _$CartListStateImpl;

  @override
  List<Cart> get cartList;
  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  @JsonKey(ignore: true)
  _$$CartListStateImplCopyWith<_$CartListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
