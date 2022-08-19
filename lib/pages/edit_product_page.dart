import 'package:flutter/material.dart';

import '../widgets/gradient_color_widget.dart';

class EditProductPage extends StatefulWidget {
  const EditProductPage({Key? key}) : super(key: key);

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Edit Product',
        ),
        flexibleSpace: Container(
          decoration: gradientColorWidget(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 8.0),
            TextFormField(
              autocorrect: false,
              enableSuggestions: false,
              decoration: const InputDecoration(
                labelText: 'Type',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              autocorrect: false,
              enableSuggestions: false,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {},
              child: Text(
                'Confirm edit',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
