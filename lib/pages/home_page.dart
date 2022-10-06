import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_lesson_one/components/product_card.dart';
import 'package:getx_lesson_one/models/product_model.dart';

import 'package:getx_lesson_one/controllers/home_controller.dart';

import '../theme/app_gradient_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeController = HomeController();

  @override
  void initState() {
    super.initState();
    homeController.findProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Products',
        ),
        flexibleSpace: Container(
          decoration: gradientColorWidget(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => homeController.findProducts(),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
          child: StreamBuilder<List<ProductModel>>(
            stream: homeController.productsStream,
            builder: (context, snapshot) {
              final products = snapshot.data;
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.separated(
                itemCount: products!.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(
                  
                    productTitle: products[index].title.toString(),
                    productType: products[index].type.toString(),
                    productRating: products[index].rating, //todouble
                    productPrice: 'R\$${products[index].price}',

                    onPressedEdit:() {
                      Get.toNamed('/editProduct', arguments: {
                                'controller': homeController,
                                'productModel': products[index],
                              });
                    },
                    onPressedDelete: () => homeController.removeProduct(products[index]),
                    
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 14.0,
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Get.toNamed('/createProduct',
              arguments: {'controller': homeController});
        }),
        backgroundColor: const Color(0xFF4a00e0),
        child: const Icon(Icons.add),
      ),
    );
  }
}
