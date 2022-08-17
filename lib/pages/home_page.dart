import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:getx_lesson_one/controllers/home_controller.dart';
import 'package:getx_lesson_one/widgets/dialog_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeController = HomeController();

  @override
  void initState() {
    homeController.populateProducts();
    super.initState();
  }

  colorGradientDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.primary,
          ]),
    );
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
          decoration: colorGradientDecoration(),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: colorGradientDecoration(),
        height: 56.0,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: const <Widget>[
                Icon(Icons.home, color: Colors.white, size: 36.0),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
        child: AnimatedBuilder(
          animation: homeController,
          builder: (context, snapshot) {
            return ListView.separated(
              itemCount: homeController.products.length,
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
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/images/${homeController.products[index].filename}')),
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
                                      homeController.products[index].title,
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
                                      const DialogWidget(),
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
                                homeController.products[index].type,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: homeController.products[index].rating
                                      .toDouble(),
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
                                  'R\$${homeController.products[index].price}',
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
    );
  }
}
