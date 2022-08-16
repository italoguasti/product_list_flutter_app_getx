import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.abc_sharp,
              size: 60,
            ),
            const SizedBox(height: 16),
            const Text(
              'Edit',
              textAlign: TextAlign.center,
              // style: AppTextTheme.title,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: const Text('botao1'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    child: const Text('botao2'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
