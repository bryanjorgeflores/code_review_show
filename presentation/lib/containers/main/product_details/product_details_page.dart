import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/containers/main/product_details/widgets/slider.dart';
import 'package:presentation/styles/theme.dart';
import 'package:presentation/widgets/text.dart';
import 'package:presentation/widgets/text_button.dart';
import 'package:presentation/widgets/text_icon_button.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product? product;
  const ProductDetailsPage({super.key, this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.product?.title}')),
      body: ListView(
        children: [
          CarouselSlider(
            slides: widget.product?.images ?? [],
            heroId: '${widget.product?.id}',
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  '\$${widget.product?.price?.toStringAsFixed(2)}',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                TextWidget(
                  '${widget.product?.description}',
                  maxLines: 5,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: CustomTextIconButton(
                  icon: Icons.shopping_basket,
                  text: 'Agregar al carrito',
                  onPressed: () {},
                  buttonColor: skyblue,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextButton(
                  text: 'Comprar Ahora',
                  onPressed: () {},
                  buttonColor: blue,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
