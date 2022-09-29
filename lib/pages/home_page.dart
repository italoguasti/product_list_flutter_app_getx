import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_lesson_one/models/product_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:getx_lesson_one/controllers/home_controller.dart';
import 'package:getx_lesson_one/widgets/my_dialog.dart';

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
    homeController.findProducts();
    super.initState();
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
      body: Padding(
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
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .3,
                        height: MediaQuery.of(context).size.height * .15,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/0.jpg')),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .55,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      products[index].title.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2.0,
                                    horizontal: 10.0,
                                  ),
                                  child: Text(
                                    DateFormat('dd-MM-yyyy')
                                        .format(DateTime.now()),
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.dialog(
                                      MyDialog(
                                        onPressedEdit: () {
                                          Get.toNamed('/editProduct',
                                              arguments: {
                                                'controller': homeController,
                                                'productModel': products[index],
                                                'index': index,
                                              });
                                        },
                                        onPressedDelete: () {
                                          homeController
                                              .removeProduct(products[index]);
                                        },
                                      ),
                                      barrierColor: const Color(0xff1B1B1B)
                                          .withOpacity(0.9),
                                    );
                                  },
                                  child: const Icon(Icons.more_horiz_rounded),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 4.0),
                              child: Text(
                                products[index].type.toString(),
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: products[index].rating.toDouble(),
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  direction: Axis.horizontal,
                                ),
                                const Spacer(),
                                Text(
                                  'R\$${products[index].price}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
