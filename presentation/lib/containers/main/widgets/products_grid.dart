import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/routes/routes.dart';
import 'package:presentation/styles/theme.dart';
import 'package:presentation/widgets/text.dart';

class ProductsGrid extends StatelessWidget {
  final List<Product> products;
  const ProductsGrid({super.key, this.products = const []});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 320,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.productDetails,
                arguments: product);
          },
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: '${product.id}',
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.network(
                        product.images!.first,
                        fit: BoxFit.cover,
                        height: 200,
                        errorBuilder: (context, error, stackTrace) {
                          return const Placeholder(fallbackHeight: 200,);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          '${product.title}',
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 10),
                        TextWidget(
                          '${product.description}',
                          maxLines: 2,
                          fontSize: 12,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        TextWidget(
                          '\$${product.price?.toStringAsFixed(2)}',
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.add, color: white),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
