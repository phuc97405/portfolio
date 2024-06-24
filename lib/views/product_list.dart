import 'package:flutter/material.dart';
import 'package:portfolio/main.dart';

class ProductList extends StatefulWidget {
  final AddToCartAnimationManager manager;
  const ProductList({super.key, required this.manager});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<String> products = [
    'Product 1',
    'Product 2',
    'Product 3',
    'Product 4',
    'Product 5',
    'Product 6',
    'Product 7',
    'Product 8',
    'Product 9',
    'Product 10',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      childAspectRatio: 0.8,
      padding: const EdgeInsets.all(20),
      children: List.generate(
          products.length,
          (index) => Flexible(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.red[200],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Flexible(
                          flex: 5,
                          child: Container(
                            key: widget.manager.productKeys[index],
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Expanded(
                            child: FilledButton(
                          style: FilledButton.styleFrom(
                              elevation: 0,
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: () {
                            widget.manager.runAnimation(index);
                          },
                          child: const Text(
                            "Add to cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        )
                            // Container(
                            //   height: double.infinity,
                            //   decoration: const BoxDecoration(
                            //       color: Colors.red,
                            //       borderRadius:
                            //           BorderRadius.all(Radius.circular(12))),
                            //   alignment: Alignment.center,
                            //   width: double.infinity,
                            //   child: const Text(
                            //     "Add to cart",
                            //     style: TextStyle(
                            //         color: Colors.white,
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.bold),
                            //     textAlign: TextAlign.center,
                            //   ),
                            // ),
                            )
                      ],
                    )),
              )),
    );
  }
}
