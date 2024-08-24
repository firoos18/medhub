part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  final CartProductItem? products;

  const CartEvent({
    this.products,
  });

  @override
  List<Object?> get props => [products];
}

final class AddProductToCart extends CartEvent {
  const AddProductToCart({super.products});
}

final class GetCartItems extends CartEvent {}

final class QuantityIncrement extends CartEvent {
  const QuantityIncrement({super.products});
}

final class QuantityDecrement extends CartEvent {
  const QuantityDecrement({super.products});
}

final class RemoveCartItem extends CartEvent {
  const RemoveCartItem({super.products});
}

final class Checkout extends CartEvent {}
