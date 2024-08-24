import 'package:flutter/cupertino.dart';
import 'package:medhub/features/categories/presentation/widgets/products_item.dart';

List<Products> productsItem = [
  Products(
    imagePath: 'assets/images/product_1.png',
    isSale: true,
    price: 112000,
    rating: 4.2,
    title: 'Accu-check Active Test Strip',
    packageSize: [500, 200, 150],
  ),
  Products(
    imagePath: 'assets/images/product_2.png',
    isSale: true,
    price: 150000,
    discount: 15,
    rating: 4.2,
    title: 'Omron HEM-8712 BP Monitor',
    packageSize: [300, 120, 70],
  ),
  Products(
    imagePath: 'assets/images/product_3.png',
    isSale: false,
    price: 112000,
    rating: 4.2,
    title: 'Accu-check Active Test Strip',
    packageSize: [320, 125, 60],
  ),
  Products(
    imagePath: 'assets/images/product_4.png',
    isSale: false,
    price: 150000,
    rating: 4.2,
    title: 'Omron HEM-8712 BP Monitor',
    packageSize: [100, 20, 40],
  ),
];

class ProductsListview extends StatelessWidget {
  const ProductsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'All Products',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24),
          Flexible(
            fit: FlexFit.loose,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 160 / 230,
                crossAxisSpacing: 14,
                mainAxisSpacing: 17,
              ),
              itemCount: productsItem.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ProductsItem(
                products: productsItem[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
