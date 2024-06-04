import 'package:flutter/material.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  const AppCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        key: key,
        width: 24,
        height: 24,
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      );
}
