import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getx_lesson_one/controllers/home_controller.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
        ),
        centerTitle: true,
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
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            const SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    homeController.products[index].title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Text(
                                  '08/2022',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const SizedBox(width: 44.0),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Icon(Icons.more_horiz_rounded),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              homeController.products[index].type,
                              style: Theme.of(context).textTheme.bodyText1,
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
                  height: 16.0,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
