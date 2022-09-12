import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  final Function()? onPressedEdit;
  final Function()? onPressedDelete;

  const MyDialog({
    Key? key,
    required this.onPressedEdit,
    required this.onPressedDelete,
  }) : super(key: key);

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
              Icons.published_with_changes_rounded,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              'Edit or delete your product.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      onPressedEdit!();
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    child: const Text(
                      'Delete',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      onPressedDelete!();
                    },
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
