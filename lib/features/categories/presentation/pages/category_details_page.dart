import 'package:flutter/material.dart';
import 'package:medhub/features/categories/presentation/widgets/diabetic_listview.dart';
import 'package:medhub/features/home/presentation/widgets/products_listview.dart';

class CategoryDetailsPage extends StatelessWidget {
  const CategoryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Diabetes Care',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Stack(
                children: [
                  Image.asset('assets/images/carousel_image.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 23, top: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 120,
                          child: Text(
                            'Save extra on every order',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff00A59B),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: 140,
                          child: Text(
                            'Etiam mollis metus non faucibus sollicitudin.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xff090F47).withOpacity(0.65),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 19),
            const SizedBox(
              height: 225,
              child: DiabeticListview(),
            ),
            const SizedBox(height: 15),
            const ProductsListview()
          ],
        ),
      ),
    );
  }
}
