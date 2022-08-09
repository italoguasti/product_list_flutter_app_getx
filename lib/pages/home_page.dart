import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.network(
              'https://usemobile.com.br/wp-content/uploads/2022/03/icone-apps-mobile.svg',
              width: MediaQuery.of(context).size.width * .3,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('title'),
                      const SizedBox(width: 20.0),
                      const Text('other'),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz_rounded),
                      ),
                    ],
                  ),
                  const Text('type'),
                  const SizedBox(height: 14.0),
                  Row(
                    children: [
                      RatingBarIndicator(
                        // rating: controller.products[index].rating.toDouble(),
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                      const Spacer(),
                      const Text('itemPrice'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
