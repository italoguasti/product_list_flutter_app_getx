// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'my_dialog.dart';

class ProductCard extends StatelessWidget {
  final String productTitle;
  final String productType;
  final double productRating;
  final String productPrice;
  final dynamic Function()? onPressedEdit;
  final dynamic Function()? onPressedDelete;

  const ProductCard({
    Key? key,
    required this.productTitle,
    required this.productType,
    required this.productRating,
    required this.productPrice,
    required this.onPressedEdit,
    required this.onPressedDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  fit: BoxFit.cover, image: AssetImage('assets/images/10.jpg')),
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
                          productTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2.0,
                        horizontal: 10.0,
                      ),
                      child: Text(
                        DateFormat('dd-MM-yyyy').format(DateTime.now()),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.dialog(
                          MyDialog(
                            onPressedEdit: onPressedEdit,
                            onPressedDelete: onPressedDelete,
                          ),
                          barrierColor:
                              const Color(0xff1B1B1B).withOpacity(0.9),
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
                    productType,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    //Conferir esse RatingBarIndicator
                    RatingBarIndicator(
                      rating: productRating,
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
                      productPrice,
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
  }
}
