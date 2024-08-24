import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medhub/features/categories/presentation/widgets/products_item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartProductItem {
  final Products products;
  final int packageSize;
  int quantity;

  CartProductItem({
    required this.packageSize,
    required this.products,
    required this.quantity,
  });
}

class CartBloc extends Bloc<CartEvent, CartState> {
  List<CartProductItem> products = [];

  CartBloc() : super(CartInitial()) {
    on<AddProductToCart>(onAddProductToCart);
    on<GetCartItems>(onGetCartItems);
    on<QuantityIncrement>(onQuantityIncrement);
    on<QuantityDecrement>(onQuantityDecrement);
    on<RemoveCartItem>(onRemoveCartItem);
    on<Checkout>(onCheckout);
  }

  void onAddProductToCart(CartEvent event, Emitter<CartState> emit) {
    emit(CartLoading());

    if (event.products != null) {
      if (products.contains(event.products!)) {
        final productIndex = products.indexOf(event.products!);
        products[productIndex].quantity += 1;
        emit(CartSuccess());
      }
      products.add(event.products!);
      emit(CartSuccess());
    }
  }

  void onGetCartItems(CartEvent event, Emitter<CartState> emit) {
    emit(CartLoading());

    emit(CartLoaded(products: products));
  }

  void onCheckout(CartEvent event, Emitter<CartState> emit) {
    emit(CartLoading());

    for (var i = 0; i < products.length; i++) {
      products.removeAt(i);
    }

    emit(CheckoutSuccess());
  }

  void onQuantityIncrement(CartEvent event, Emitter<CartState> emit) {
    emit(CartLoading());
    final isExist = products.contains(event.products);
    if (isExist) {
      int productIndex = products.indexOf(event.products!);
      products[productIndex].quantity += 1;
      emit(CartLoaded(products: products));
    }
  }

  void onQuantityDecrement(CartEvent event, Emitter<CartState> emit) {
    emit(CartLoading());
    final isExist = products.contains(event.products);
    if (isExist) {
      int productIndex = products.indexOf(event.products!);
      if (products[productIndex].quantity == 1) {
        products[productIndex].quantity == 1;
      } else {
        products[productIndex].quantity -= 1;
      }
      emit(CartLoaded(products: products));
    }
  }

  void onRemoveCartItem(CartEvent event, Emitter<CartState> emit) {
    emit(CartLoading());
    final isExist = products.contains(event.products);
    if (isExist) {
      int productIndex = products.indexOf(event.products!);
      products.removeAt(productIndex);
      emit(CartLoaded(products: products));
    }
  }
}
