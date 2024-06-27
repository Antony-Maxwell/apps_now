part of 'cart_count_bloc.dart';

abstract class CartCountEvent {}

class Increment extends CartCountEvent {}

class Decrement extends CartCountEvent {}

class ResetCart extends CartCountEvent {}
