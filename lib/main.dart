import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/views/cart_button.dart';
import 'package:portfolio/views/product_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late final controller = AnimationController(vsync: this);
  late final manager = AddToCartAnimationManager(controller);

  @override
  void dispose() {
    controller.dispose();
    manager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portfolio',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: Colors.red[100],
          floatingActionButton: const CartButton(),
          body: Stack(children: [
            ProductList(manager: manager),
            ListenableBuilder(
              listenable: manager.productSize,
              builder: (context, _) => Container(
                width: manager.productSize.value.width,
                height: manager.productSize.value.height,
                color: Colors.red,
              ),
            ).animate(autoPlay: false, controller: controller).slide()
          ]),
        ));
  }
}

class AddToCartAnimationManager {
  AddToCartAnimationManager(this.controller);

  final AnimationController controller;
  final productKeys = List.generate(10, (index) => GlobalKey());
  var productSize = ValueNotifier(const Size(0, 0));
  var productPosition = Offset.zero;

  void dispose() {
    productSize.dispose();
  }
}
