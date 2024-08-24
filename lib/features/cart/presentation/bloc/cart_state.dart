part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  final List<CartProductItem>? products;

  const CartState({
    this.products,
  });

  @override
  List<Object?> get props => [products];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {}

final class CheckoutSuccess extends CartState {}

final class CartLoaded extends CartState {
  const CartLoaded({super.products});
}
