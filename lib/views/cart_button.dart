import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      elevation: 0,
      backgroundColor: Colors.yellow.shade600,
      foregroundColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onPressed: () => {},
      child: const Icon(Icons.shopping_cart),
    );
  }
}
