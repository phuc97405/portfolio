import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/views/cart_button.dart';
import 'package:portfolio/views/product_list.dart';

void main() {
  runApp(MyApp());
}

final productAnimDuration = 1.seconds;

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late final controller = AnimationController(vsync: this);
  late final cartController = AnimationController(vsync: this);

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
          floatingActionButton: CartButton(key: manager.cartKey)
              .animate(
                  controller: cartController,
                  autoPlay: false,
                  onComplete: (controller) => controller.reset())
              .moveY(begin: 0, end: -20, duration: 200.ms)
              .shake(),
          body: Stack(children: [
            ProductList(manager: manager),
            ListenableBuilder(
                listenable: manager.productSize,
                builder: (context, _) => SizedBox(
                        width: manager.productSize.value.width,
                        height: manager.productSize.value.height,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 7),
                                    blurRadius: 29,
                                    color: Colors.black26)
                              ]),
                        )
                            .animate(
                              autoPlay: false,
                              controller: controller,
                            )
                            .scale(
                                duration: productAnimDuration * 0.8,
                                begin: const Offset(1, 1),
                                end: Offset.zero,
                                alignment: Alignment.bottomRight,
                                delay: productAnimDuration * 0.2))
                    .animate(
                      autoPlay: false,
                      controller: controller,
                      onComplete: (controller) => {
                        controller.reset(),
                        manager.reset(),
                        cartController.forward()
                      },
                    )
                    .followPath(
                        duration: productAnimDuration,
                        path: manager.path,
                        curve: Curves.easeInOutCubic))
          ]),
        ));
  }
}

class AddToCartAnimationManager {
  AddToCartAnimationManager(this.controller);

  final cartKey = GlobalKey();
  final AnimationController controller;
  final productKeys = List.generate(10, (index) => GlobalKey());
  var productSize = ValueNotifier(const Size(0, 0));
  var productPosition = Offset.zero;
  var path = Path();

  void dispose() {
    productSize.dispose();
  }

  void reset() {
    productSize.value = Size.zero;
    productPosition = Offset.zero;
    path = Path();
  }

  void runAnimation(int index) {
    final productContext = productKeys[index].currentContext!;
    //Get position of bottom right of cart button
    final cartPosition =
        (cartKey.currentContext!.findRenderObject() as RenderBox)
            .localToGlobal(Offset.zero);

    final cartBottomRight =
        cartKey.currentContext!.size!.bottomRight(cartPosition);
    //Get position of product image
    productPosition = (productContext.findRenderObject() as RenderBox)
        .localToGlobal(Offset.zero);
    //Get size of product image
    productSize.value = productContext.size!;
    //Create Path object
    path = Path()
      ..moveTo(productPosition.dx, productPosition.dy)
      ..relativeLineTo(-20, -20)
      ..lineTo(cartBottomRight.dx - productSize.value.width - 5,
          cartBottomRight.dy - productSize.value.height - 5);
    //Trigger animation
    controller.forward();
  }
}
